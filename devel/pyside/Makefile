# New ports collection makefile for:	pyside
# Date created:		2011-03-22
# Whom:			Nicola Vitale <nivit@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	pyside
PORTVERSION=	1.1.0
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	http://www.pyside.org/files/
PKGNAMESUFFIX=	${PYTHON_PKGNAMESUFFIX}
DISTNAME=	${PORTNAME}-qt4.7+${PORTVERSION}

MAINTAINER=	nivit@FreeBSD.org
COMMENT=	Python bindings for the Qt applications and UI framework

LICENSE=	LGPL21

LIB_DEPENDS=	apiextractor.0:${PORTSDIR}/devel/apiextractor \
		shiboken-${PYTHON_VERSION}.1:${PORTSDIR}/devel/shiboken

CMAKE_ARGS=	-DGL_H:FILEPATH="${LOCALBASE}/include/GL/gl.h" \
		-DGL_INCLUDE_DIR:FILEPATH="${LOCALBASE}/include"

# QT4_OPTIONS=QGTKSTYLE in /etc/make.conf removes some warnings
USE_QT4=	declarative designer gui help qmake_build \
		moc_build multimedia network opengl \
		phonon rcc_build script scripttools \
		svg uic_build webkit

PLIST_SUB=	PORTVERSION=${PORTVERSION} \
		PYTHON_VERSION=${PYTHON_VERSION}

USE_BZIP2=	yes
USE_CMAKE=	yes
USE_LDCONFIG=	yes
USE_PYTHON=	2.5-2.7

# API documentation requires graphics/graphviz and Qt4 src to build

.include <bsd.port.mk>
