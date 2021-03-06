# New ports collection makefile for:	xmobar
# Date created:				November 7, 2008
# Whom:					Samy Al Bahra <sbahra@kerneled.org>
#
# $FreeBSD$

PORTNAME=	xmobar
PORTVERSION=	0.14
PORTREVISION=	1
CATEGORIES=	x11 haskell

MAINTAINER=	haskell@FreeBSD.org
COMMENT=	A minimalistic text based status bar

LICENSE=	BSD

USE_CABAL=	mtl parsec stm X11>=1.3.0
USE_XORG=	x11 xrandr

EXECUTABLE=	xmobar
STANDALONE=	yes

INSTALL_PORTDATA=	${INSTALL_DATA} ${WRKSRC}/samples/xmobar.config ${DATADIR}

OPTIONS=	XFT   "Use Xft to render text (UTF-8 support included)" off \
		UTF8  "UTF-8 support" on \
		MPD   "mpd support" off

.include "${.CURDIR}/../../lang/ghc/bsd.cabal.options.mk"
.include <bsd.port.options.mk>

# Disable Linux-only options
CONFIGURE_ARGS+=	--flags="-with_inotify -with_iwlib"

.if defined(WITH_XFT)
CONFIGURE_ARGS+=	--flags="with_xft"
USE_CABAL+=		utf8-string X11-xft>=0.2
.else
CONFIGURE_ARGS+=	--flags="-with_xft"
.endif

.if defined(WITH_UTF8)
CONFIGURE_ARGS+=	--flags="with_utf8"
.if !defined(WITH_XFT)
USE_CABAL+=		utf8-string
.endif
.else
CONFIGURE_ARGS+=	--flags="-with_utf8"
.endif

.if defined(WITH_MPD)
CONFIGURE_ARGS+=	--flags="with_mpd"
USE_CABAL+=		libmpd
.else
CONFIGURE_ARGS+=	--flags="-with_mpd"
.endif

.include "${.CURDIR}/../../lang/ghc/bsd.cabal.mk"
.include <bsd.port.mk>
