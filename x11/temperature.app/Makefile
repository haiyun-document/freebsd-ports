# New ports collection makefile for:	Temperature.app
# Date created:				06 May 2001
# Whom:					Per Otterstr=F6m <pelle@fukt.bth.se>
#
# $FreeBSD$
#

PORTNAME=	temperature.app
PORTVERSION=	1.4
PORTREVISION=	4
CATEGORIES=	x11 windowmaker
MASTER_SITES=	http://www.fukt.bsnet.se/~per/temperature/
DISTNAME=	Temperature.app-${PORTVERSION}

MAINTAINER=	ports@FreeBSD.org
COMMENT=	A dockable WindowMaker applet which displays the local temperature

LICENSE=	GPLv2
LICENSE_FILE=	${WRKSRC}/COPYING

RUN_DEPENDS=	wget:${PORTSDIR}/ftp/wget

USE_XORG=	x11 xpm

do-install:
	@${INSTALL_PROGRAM} ${WRKSRC}/Temperature.app ${PREFIX}/bin
.ifndef(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${WRKSRC}/README ${DOCSDIR}
.endif

.include <bsd.port.mk>
