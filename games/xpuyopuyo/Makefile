# New ports collection makefile for:	xpuyopuyo
# Date created:		19 Sep 1999
# Whom:			Yin-Jieh Chen <yinjieh@csie.nctu.edu.tw>
#
# $FreeBSD$
#

PORTNAME=	xpuyopuyo
PORTVERSION=	0.9.8
PORTREVISION=	6
CATEGORIES=	games
MASTER_SITES=	http://chaos2.org/xpuyopuyo/

MAINTAINER=	ports@FreeBSD.org
COMMENT=	A puzzle game, somewhat like Tetris

USE_GMAKE=	yes
USE_XORG=	xpm
USE_AUTOTOOLS=	autoconf213
USE_GNOME=	gtk12
WANT_GNOME=	yes

MAN6=		xpuyopuyo.6

OPTIONS_DEFINE=	MIKMOD ROTATE_FIXED AIBREED
ROTATE_FIXED_DESC=	Fix position of one blob during rotation
AIBREED_DESC=	Allow AI breeding

.include <bsd.port.pre.mk>

.if ${PORT_OPTIONS:MMIKMOD} || exists(${LOCALBASE}/lib/libmikmod.a)
LIB_DEPENDS+=	mikmod.2:${PORTSDIR}/audio/libmikmod
CONFIGURE_ARGS+=--with-libmikmod-prefix=${LOCALBASE}
.endif

.if ${HAVE_GNOME:Mgnomelibs}!=""
USE_GNOME+=	gnomelibs gnomehack
PKGNAMESUFFIX=	-gnome
.else
CONFIGURE_ARGS+=	--without-gnome
.endif

.if ${PORT_OPTIONS:MROTATE_FIXED}
CONFIGURE_ARGS+=--enable-rotate-fixed
.endif
.if ${PORT_OPTIONS:MAIBREED}
CONFIGURE_ARGS+=--enable-aibreed
.endif

.include <bsd.port.post.mk>
