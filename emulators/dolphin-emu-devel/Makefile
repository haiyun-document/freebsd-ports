# New ports collection makefile for:	dolphin-emu
# Date created:		2011-10-03
# Whom:			Ganael Laplanche <ganael.laplanche@martymac.org>
#
# $FreeBSD$
#

PORTNAME=	dolphin-emu
PORTVERSION=	3.0.r${REVDATE}
PORTREVISION=	3
CATEGORIES=	emulators
MASTER_SITES=	http://contribs.martymac.org/FreeBSD-ports/distfiles/ \
		LOCAL/martymac
PKGNAMESUFFIX=	-devel
EXTRACT_SUFX=	.tgz

MAINTAINER=	martymac@FreeBSD.org
COMMENT=	Gamecube and Wii Emulator

LICENSE=	GPLv2

LIB_DEPENDS=	avformat:${PORTSDIR}/multimedia/ffmpeg \
		execinfo:${PORTSDIR}/devel/libexecinfo \
		freetype:${PORTSDIR}/print/freetype2 \
		lzo2:${PORTSDIR}/archivers/lzo2 \
		sfml-network:${PORTSDIR}/devel/sfml

REVDATE=	20120307

USE_ICONV=	yes
USE_GNOME=	pkgconfig
USE_SDL=	sdl
USE_OPENAL=	yes
USE_XORG=	ice xext x11 xrandr
USE_WX=	2.8
USE_GL=	gl glew glu

# XXX Has only been tested with clang and gcc
.if ${CC} != "clang" && ${CXX} != "clang++"
USE_GCC=	4.6+
.endif

USE_CMAKE=	yes
CMAKE_BUILD_TYPE=	Release
# Disable ao (seems buggy) and ALSA (emulated)
CMAKE_ARGS+=	-DDISABLE_AO:BOOL=ON \
		-DDISABLE_ALSA:BOOL=ON \
		-DDISABLE_BLUEZ:BOOL=ON \
		-DCMAKE_INSTALL_RPATH_USE_LINK_PATH:BOOL=ON

SUB_FILES=	pkg-message
SUB_LIST+=	MAINTAINER=${MAINTAINER}

OPTIONS_DEFINE=	PULSEAUDIO PORTAUDIO DEBUG
PORTAUDIO_DESC=	Enable PortAudio (mic) support
OPTIONS_DEFAULT=	PORTAUDIO

.include <bsd.port.pre.mk>

.if ${PORT_OPTIONS:MNLS}
USE_GETTEXT=	yes
PLIST_SUB+=	NLS=""
.else
CMAKE_ARGS+=	-DDISABLE_NLS:BOOL=ON
PLIST_SUB+=	NLS="@comment "
.endif

.if ${PORT_OPTIONS:MDEBUG}
CMAKE_ARGS+=	-DFASTLOG:BOOL=ON
INSTALL_TARGET=	install
CFLAGS+=	-ggdb
CXXFLAGS+=	-ggdb
MAKE_ENV+=	VERBOSE=yes
.endif

# XXX Needs spawn.h header to build
.if ${OSVERSION} < 800041
BROKEN=	requires FreeBSD 8.0 or newer
.endif
.if ${ARCH} == "powerpc"
BROKEN=		Does not compile on powerpc: uses i386-specific option
.endif

.if ${PORT_OPTIONS:MPULSEAUDIO}
LIB_DEPENDS+=	pulse:${PORTSDIR}/audio/pulseaudio
.else
CMAKE_ARGS+=	-DDISABLE_PULSEAUDIO:BOOL=ON
.endif

.if ${PORT_OPTIONS:MPORTAUDIO}
LIB_DEPENDS+=	portaudio:${PORTSDIR}/audio/portaudio2
.else
CMAKE_ARGS+=	-DDISABLE_PORTAUDIO:BOOL=ON
.endif

post-install:
	@${CAT} ${PKGMESSAGE}

.include <bsd.port.post.mk>
