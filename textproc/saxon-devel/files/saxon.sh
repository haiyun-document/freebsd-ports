#!/bin/sh
#
# $FreeBSD$

IAM=`basename "$0"`

if [ "${IAM}" = "saxon-xquery" ]
then
	LAUNCHER_CLASS="net.sf.saxon.Query"
else
	LAUNCHER_CLASS="net.sf.saxon.Transform"
fi

SAXON_CLASSPATH=""
for jarfile in %%SAXON_JARS%%
do
	SAXON_CLASSPATH="${SAXON_CLASSPATH}:${jarfile}"
done

JAVAVM="%%JAVAVM%%" "%%LOCALBASE%%/bin/javavm" -classpath "${SAXON_CLASSPATH}" "${LAUNCHER_CLASS}" "$@"
