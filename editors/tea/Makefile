# New ports collection makefile for:	TEA
# Date created:				13 Jul 2004
# Whom:					Jean-Yves Lefort <jylefort@brutele.be>
#
# $FreeBSD$
#

PORTNAME=	tea
DISTVERSION=	33.1.0
CATEGORIES=	editors
MASTER_SITES=	SF/${PORTNAME}-editor/${PORTNAME}-editor/${PORTVERSION} \
		http://semiletov.ho.ua/${PORTNAME}-releases/

MAINTAINER=	davide.italiano@gmail.com
COMMENT=	A simple and powerful Qt4-based text editor

LICENSE=	GPLv3

USE_BZIP2=	yes
USE_QT4=	qmake_build moc_build rcc_build gui xml

PLIST_FILES=	bin/${PORTNAME}

OPTIONS=	ASPELL	"Build with GNU Aspell support"	on

.include <bsd.port.pre.mk>

.if defined(WITH_ASPELL)
LIB_DEPENDS=	aspell:${PORTSDIR}/textproc/aspell
QMAKEFLAGS=	USE_ASPELL=true
.else
QMAKEFLAGS=	USE_ASPELL=false
.endif

post-patch:
	@${REINPLACE_CMD} -e '/aspell/s,/usr,${LOCALBASE},' ${WRKSRC}/src.pro

do-configure:
	@cd ${BUILD_WRKSRC} && ${SETENV} ${MAKE_ENV} ${QMAKE} ${QMAKEFLAGS}

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/bin/${PORTNAME} ${PREFIX}/bin

.include <bsd.port.post.mk>
