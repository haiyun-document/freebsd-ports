#!/bin/sh
#
# $FreeBSD$
#
# Maintenance shell script to vacuum and backup database
# Put this in /usr/local/etc/periodic/daily, and it will be run 
# every night
#
# Written by Palle Girgensohn <girgen@pingpong.net>
#
# In public domain, do what you like with it,
# and use it at your own risk... :)
#
######################################################################
#
# If you like to tweak the settings of the variables PGBACKUPDIR and
# PGDUMP_ARGS, you should preferably set them in ~pgsql/.profile.
# If set there, that setting will override the defaults here.
#
######################################################################

DIR=`dirname $0`
progname=`basename $0`
PRG=`cd $DIR; pwd `/$progname

# Run as user pgsql
if [ `id -un` != pgsql ]; then
    su -l pgsql -c ${PRG}
    exit $?
fi

# arguments to pg_dump
PGDUMP_ARGS=${PGDUMP_ARGS:-"-b -F c"}

# The directory where the backups will reside.
# ${HOME} is pgsql's home directory
PGBACKUPDIR=${PGBACKUPDIR:-${HOME}/backups}

# If you want to keep a history of database backups, set
# PGBACKUP_SAVE_DAYS in ~pgsql/.profile to the number of days. This is
# used as "find ... -mtime +${PGBACKUP_SAVE_DAYS} -delete", see below
PGBACKUP_SAVE_DAYS=${PGBACKUP_SAVE_DAYS:-7}

# PGBACKUPDIR must be writeable by user pgsql
# ~pgsql is just that under normal circumstances,
# but this might not be where you want the backups...
if [ ! -d ${PGBACKUPDIR} ] ; then 
    echo Creating ${PGBACKUPDIR}
    mkdir ${PGBACKUPDIR}
    chmod 700 ${PGBACKUPDIR}
fi

echo
echo "PostgreSQL maintenance"

# Protect the data
umask 077
dbnames=`psql -q -t -A -d template1 -c "SELECT datname FROM pg_database WHERE datname != 'template0'"`
rc=$?
now=`date "+%Y-%m-%dT%H:%M:%S"`
file=${PGBACKUPDIR}/pgglobals_${now}
pg_dumpall -g | gzip -9 > ${file}.gz
for db in ${dbnames}; do
    echo -n " $db"
    file=${PGBACKUPDIR}/pgdump_${db}_${now}
    pg_dump ${PGDUMP_ARGS} -f ${file} ${db}
    [ $? -gt 0 ] && rc=3
done

if [ $rc -gt 0 ]; then
    echo
    echo "Errors were reported during backup."
fi

echo
echo "vacuuming..."
vacuumdb -a -z -q
if [ $? -gt 0 ]
then
    echo
    echo "Errors were reported during vacuum."
    rc=3
fi

# cleaning up old data
find ${PGBACKUPDIR} \( -name 'pgdump_*' -o -name 'pgglobals_*' \) \
    -a -mtime +${PGBACKUP_SAVE_DAYS} -delete

exit $rc
