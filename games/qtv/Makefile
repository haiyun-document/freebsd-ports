# New ports collection makefile for:	QTV (Quake TV, formerly EZTV)
# Date created:				29 July 2009
# Whom:					Alexey Dokuchaev <danfe@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	qtv
PORTVERSION=	1.00
CATEGORIES=	games net
MASTER_SITES=	http://qw-dev.net/attachments/download/153/
DISTNAME=	${PORTNAME}_${PORTVERSION}_sources

MAINTAINER=	danfe@FreeBSD.org
COMMENT=	MVD demo data streaming proxy over TCP/IP for QuakeWorld servers

ALL_TARGET=	${PORTNAME}
MAKE_ARGS=	CC=${CC}
WRKSRC=		${WRKDIR}/${PORTNAME}_${PORTVERSION}

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME}.bin ${PREFIX}/bin/${PORTNAME}
	@${FIND} ${WRKSRC} -type d -name .svn -print0 | ${XARGS} -0 ${RM} -r
	@${RM} -f "${WRKSRC}/example-configs/PLACE YOUR QTV.BIN HERE"
	cd ${WRKSRC}/example-configs && ${COPYTREE_SHARE} . ${DATADIR}
	cd ${WRKSRC} && ${COPYTREE_SHARE} metaqtv ${DATADIR}

.include <bsd.port.mk>
