# New ports collection makefile for:	ajaxzip2-core
# Date created:		4 Mar 2012
# Whom:			Jun Kuriyama <kuriyama@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	ajaxzip2
PORTVERSION=	20081102
CATEGORIES=	japanese
MASTER_SITES=	${MASTER_SITE_LOCAL}
MASTER_SITE_SUBDIR=	kuriyama
PKGNAMESUFFIX=	-core
DISTNAME=	${PORTNAME}-${PORTVERSION}${PKGNAMESUFFIX}

MAINTAINER=	kuriyama@FreeBSD.org
COMMENT=	ajaxzip2 (Japanese ZIP code utility) core scripts

WRKSRC=		${WRKDIR}/${PORTNAME}
USE_ZIP=	YES
NO_BUILD=	YES
USE_DOS2UNIX=	YES

do-install:
	${MKDIR} ${WWWDIR} ${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/ajaxzip2.js ${WWWDIR}/
	${INSTALL_SCRIPT} ${WRKSRC}/work/csv2jsonzip.pl ${DATADIR}/

.include <bsd.port.mk>
