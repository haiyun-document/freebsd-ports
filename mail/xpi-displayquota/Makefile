# New ports collection makefile for:	xpi-displayquota
# Date created:			10 May 2006
# Whom:				Andrew Pantyukhin <infofarmer@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	displayquota
PORTVERSION=	0.3.4
DISTVERSIONSUFFIX=	-tb
CATEGORIES=	mail

MAINTAINER=	gecko@FreeBSD.org
COMMENT=	Displays your IMAP quota in statusbar

XPI_DISTNAME=	display_quota
XPI_NUM=	881
XPI_ID=		{c1ac4523-76c2-9995-adbd-d93bf5141bea}
XPI_FILES=	chrome.manifest \
		chrome/DisplayQuota.jar \
		defaults/preferences/displayquota.js \
		install.rdf
XPI_DIRS=	defaults/preferences \
		defaults \
		chrome

.include "${.CURDIR}/../../www/xpi-adblock/Makefile.xpi"
.include <bsd.port.mk>
