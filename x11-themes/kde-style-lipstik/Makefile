# New ports collection makefile for:   lipstik
# Date created:                        12th February, 2005
# Whom:                                decept
#
# $FreeBSD$
#

PORTNAME=	lipstik
PORTVERSION=	2.2.3
PORTREVISION=	7
CATEGORIES=	x11-themes kde
MASTER_SITES=	http://www.kde-look.org/CONTENT/content-files/
PKGNAMEPREFIX=	kde-style-
DISTNAME=	18223-${PORTNAME}-${PORTVERSION}

MAINTAINER=	shanjobe@gmail.com
COMMENT=	Modified Plastik KDE style

USE_KDEBASE_VER=3
USE_AUTOTOOLS=	libtool
LDFLAGS+=	${PTHREAD_LIBS}
WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

.include <bsd.port.mk>
