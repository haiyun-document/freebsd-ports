# New ports collection makefile for:	djview
# Date created:		2007-02-13
# Whom:			Stanislav Sedov <stas@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	djview
PORTVERSION=	4.9
PORTREVISION=	2
CATEGORIES=	graphics
MASTER_SITES=	SF/djvu/DjView/${PORTVERSION}

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Standalone Djvu viewer and plugin based on Qt4 toolkit

LICENSE=	GPLv2

LIB_DEPENDS=	djvulibre:${PORTSDIR}/graphics/djvulibre

GNU_CONFIGURE=	yes
USE_GNOME=	pkgconfig
USE_QT4=	gui network rcc_build uic_build moc_build qmake_build
QT_NONSTANDARD=	yes
CONFIGURE_ARGS=	--x-includes="${LOCALBASE}/include" \
		--x-libraries="${LOCALBASE}/lib"
CONFIGURE_ENV=	QMAKE="${LOCALBASE}/bin/qmake-qt4" \
		QMAKESPEC="${QMAKESPEC}"
LDFLAGS+=	-L${LOCALBASE}/lib
CFLAGS+=	-I${LOCALBASE}/include
CXXFLAGS+=	-I${LOCALBASE}/include
MAKE_ENV=	INSTALL_SCRIPT="${INSTALL_SCRIPT}"

WRKSRC=		${WRKDIR}/djview4-${PORTVERSION}

MAN1=	djview4.1 nsdejavu.1
MLINKS=	djview4.1 djview.1

USE_WEBPLUGINS=		gecko*
WEBPLUGINS_DIR=		${PREFIX}/lib/djview4/plugins
WEBPLUGINS_FILES=	nsdejavu.so

.include <bsd.port.pre.mk>
.include "${PORTSDIR}/www/firefox/Makefile.webplugins"

post-patch:
	@${REINPLACE_CMD} -e 's,/netscape/,/djview4/,' \
		${WRKSRC}/nsdejavu/Makefile.in ${WRKSRC}/nsdejavu/nsdejavu.1.in
	@${REINPLACE_CMD} -e 's,@NSDEJAVU_LIBS@,@NSDEJAVU_LIBS@ -lXt -lXext,g' \
		${WRKSRC}/nsdejavu/Makefile.in

post-install:
	@${FIND} -ds ${PREFIX}/share/djvu/djview4/ ! -type d | \
		${SED} 's,${PREFIX}/,,' >> ${TMPPLIST}

	@${ECHO_CMD} "@dirrm share/djvu/djview4/desktop" >> ${TMPPLIST}
	@${ECHO_CMD} "@dirrm share/djvu/djview4" >> ${TMPPLIST}
	@${ECHO_CMD} "@unexec ${RMDIR} %D/share/djvu 2>/dev/null || true" \
		>> ${TMPPLIST}

.include <bsd.port.post.mk>
