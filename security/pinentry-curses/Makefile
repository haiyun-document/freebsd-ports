# New ports collection makefile for:    pinentry-curses
# Date created:                         03 May 2004
# Whom:					Michael Nottebrock <lofi@freebsd.org>
#
# $FreeBSD$
#

PORTNAME=	pinentry

COMMENT=	Curses version of the gnupg password dialog

CONFLICTS=	pinentry-[0-9]*

PINENTRY_SLAVE=	-curses
WITH_NCURSES=	yes

MASTERDIR=	${.CURDIR}/../pinentry

.include "${MASTERDIR}/Makefile"
