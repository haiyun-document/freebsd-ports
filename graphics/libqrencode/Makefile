# ex:ts=8
# Ports collection makefile for:	libqrencode
# Date created:			Dec 14, 2006
# Whom:				ijliao
#
# $FreeBSD$
#

PORTNAME=	libqrencode
PORTVERSION=	3.3.1
PORTREVISION=	1
CATEGORIES=	graphics
MASTER_SITES=	http://fukuchi.org/works/qrencode/
DISTNAME=	qrencode-${PORTVERSION}

MAINTAINER=	vanilla@FreeBSD.org
COMMENT=	A C library for encoding data in a QR Code symbol

LIB_DEPENDS=	png15:${PORTSDIR}/graphics/png

USE_GNOME=	gnomehack pkgconfig
GNU_CONFIGURE=	yes
LDFLAGS+=	-L${LOCALBASE}/lib
CFLAGS+=	-I${LOCALBASE}/include
USE_LDCONFIG=	yes

MAN1=		qrencode.1

PLIST_FILES=	bin/qrencode \
		include/qrencode.h \
		lib/libqrencode.la \
		lib/libqrencode.so \
		lib/libqrencode.so.3 \
		libdata/pkgconfig/libqrencode.pc

post-patch:
	@${REINPLACE_CMD} -e 's,libpng12,libpng,' ${WRKSRC}/configure
	@${REINPLACE_CMD} -e '9s|$$| ${PTHREAD_LIBS}|' ${WRKSRC}/libqrencode.pc.in

.include <bsd.port.mk>
