# New ports collection makefile for:	mpeglib_artsplug
# Date created:				July 09 2004
# Whom:					Michael Nottebrock <lofi@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	juk
PORTVERSION=	${KDE_VERSION}
PORTREVISION=	7
CATEGORIES=	audio kde
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	stable/${PORTVERSION:S/.0//}/src
PKGNAMEPREFIX=	kdemultimedia-
DISTNAME=	kdemultimedia-${PORTVERSION}
DIST_SUBDIR=	KDE

MAINTAINER=	ports@FreeBSD.org
COMMENT=	KDE audio player

LIB_DEPENDS=	akode:${PORTSDIR}/audio/akode \
		tag:${PORTSDIR}/audio/taglib

CONFLICTS=	kdemultimedia-3.3*

OPTIONS_DEFINE=	GSTREAMER

USE_KDELIBS_VER=3
PREFIX=		${KDE_PREFIX}

USE_BZIP2=	yes
USE_AUTOTOOLS=	libtool
USE_GMAKE=	yes
WRKSRC=		${WRKDIR}/kdemultimedia-${PORTVERSION}
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--without-musicbrainz

WANT_GSTREAMER=	yes

.include <bsd.port.pre.mk>

.if  ${PORT_OPTIONS:MGSTREAMER} || exists(${LOCALBASE}/lib/libgstreamer-0.10.so)
GSTREAMER_OVERRIDE=yes
USE_GSTREAMER=	yes
.endif


pre-everything::
.if defined(GSTREAMER_OVERRIDE)
	@${ECHO_MSG}
	@${ECHO_MSG} "*********************************************************"
	@${ECHO_MSG} "* gstreamer is installed and support has been enabled   *"
	@${ECHO_MSG} "* automatically (no additional files will be installed) *"
	@${ECHO_MSG} "*********************************************************"
	@${ECHO_MSG}
.endif

do-build:
	cd ${WRKSRC}/arts/runtime && ${SETENV} ${MAKE_ENV} ${GMAKE}
	cd ${WRKSRC}/juk && ${SETENV} ${MAKE_ENV} ${GMAKE}

do-install:
	cd ${WRKSRC}/juk && ${SETENV} ${MAKE_ENV} ${GMAKE} install

.include "${.CURDIR}/../../x11/kde3/Makefile.kde"
.include <bsd.port.post.mk>
