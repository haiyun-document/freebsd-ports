# New ports collection makefile for:	moonlight
# Date created:				Feb 13 2009
# Whom:					Florent Thoumie <flz@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	moonlight
PORTVERSION=	2.2
PORTREVISION=	4
CATEGORIES=	multimedia www
MASTER_SITES=	http://ftp.novell.com/pub/mono/sources/moon/${PORTVERSION}/
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} \
		mono-${MONO_VERSION}${EXTRACT_SUFX} \
		mono-basic-${MONO_BASIC_VERSION}${EXTRACT_SUFX}

MAINTAINER=	mono@FreeBSD.org
COMMENT=	OpenSource Implementation of Silverlight

DEPRECATED=	BROKEN for more than 6 month
EXPIRATION_DATE=	2012-05-10

BROKEN=		Basically does not work

BUILD_DEPENDS=	bash:${PORTSDIR}/shells/bash
LIB_DEPENDS=	avcodec.1:${PORTSDIR}/multimedia/ffmpeg \
		execinfo.1:${PORTSDIR}/devel/libexecinfo

USE_BISON=	build
USE_GECKO=	libxul
USE_BZIP2=	yes
GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomedesktopsharp20
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
CONFIGURE_ARGS=	--with-cairo=system \
		--with-debug=yes \
		--with-ff2=no \
		--with-ff3=no \
		--with-ff36=yes \
		--with-mcspath=${MONODIR}/mcs/ \
		--with-mono-basic-path=${MONOBASICDIR}/

# LC_ALL is set in order to work around issues people are having when using
# other languages.  This has shown itself in build fails and possibly other
# strange crashes.
MAKE_ENV+=	LC_ALL=C

MONO_VERSION=	2.6.1
MONO_BASIC_VERSION=2.6

MONODIR=	${WRKDIR}/mono-${MONO_VERSION}
MONOBASICDIR=	${WRKDIR}/mono-basic-${MONO_BASIC_VERSION}

USE_WEBPLUGINS=		gecko19
WEBPLUGINS_DIR=		${PREFIX}/lib/moonlight/plugin
WEBPLUGINS_FILES=	libmoonloader.so \
			libmoonplugin.so \
			libmoonplugin-ff36bridge.so

OPTIONS=	PULSEAUDIO "Build with PA (needed for sound support)" on

MAN1=	mopen.1 mxap.1 respack.1 sockpol.1 svg2xaml.1 xamlg.1

# Restrict to stable (even) versions, indicated by the second component.
PORTSCOUT=	limitw:1,even

.include <bsd.port.pre.mk>
.include "${PORTSDIR}/www/firefox/Makefile.webplugins"

.if ${ARCH} == "sparc64"
IGNORE=		does not build: not yet ported to sparc64
.endif

.if ${OSVERSION} < 700000
IGNORE=		does not build: requires posix_memalign(3)
.endif

.if !defined(WITHOUT_PULSEAUDIO)
LIB_DEPENDS+=	pulse.0:${PORTSDIR}/audio/pulseaudio
CONFIGURE_ARGS+=--with-pulseaudio=yes
.else
CONFIGURE_ARGS+=--with-pulseaudio=no
.endif

# Building the .xpi doesn't actually require embedded cairo, but it's a safer option
# as there's no way for firefox to detect if cairo is already installed apparently.
.if defined(WITH_XPI_PLUGIN_ONLY)
CONFIGURE_ARGS+=--enable-user-plugin --with-cairo=embedded
PLIST=		${NONEXISTENT}
PLIST_FILES=	${WEBPLUGINS_DIR}/${PKGNAME}-freebsd-${OSREL}.xpi
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|^#!/bin/bash|#!/usr/bin/env bash|' \
			${MONODIR}/mcs/class/Mono.WebBrowser/build-csproj2k5
	@${REINPLACE_CMD} -e '/<malloc.h>/d' \
			${WRKSRC}/src/runtime.cpp \
			${WRKSRC}/src/xaml.cpp
	@${REINPLACE_CMD} -e 's|\(^LIBS\) =|\1 = -lexecinfo|' \
			${WRKSRC}/src/Makefile.in
	@${REINPLACE_CMD} -e 's|-ldl||' \
			${WRKSRC}/plugin/Makefile.in

pre-configure:
	@( cd ${MONODIR} && ${CONFIGURE_ENV} ./${CONFIGURE_SCRIPT} --with-profile2=no --with-moonlight=yes --with-profile4=no --with-monotouch=no --with-mcs-docs=no && ${SETENV} ${MAKE_ENV} ${GMAKE} ${MAKE_FLAGS} ${MAKEFILE} ${_MAKE_JOBS} ${MAKE_ARGS} ${ALL_TARGET})

.if defined(WITH_XPI_PLUGIN_ONLY)
do-install:
	${INSTALL_DATA} ${WRKSRC}/plugin/install/novell-moonlight.xpi \
		${WEBPLUGINS_DIR}/${PKGNAME}-freebsd-${OSREL}.xpi
.endif

.include <bsd.port.post.mk>
