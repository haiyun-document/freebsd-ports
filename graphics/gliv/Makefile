# ports collection makefile for:	gliv
# Date created:				16 March 2001
# Whom:					Jeremy Norris <ishmael27@home.com>
#
# $FreeBSD$
#

PORTNAME=	gliv
PORTVERSION=	1.9.7
PORTREVISION=	1
CATEGORIES=	graphics
MASTER_SITES=	http://guichaz.free.fr/gliv/files/

MAINTAINER=	sylvio@FreeBSD.org
COMMENT=	An image viewer that uses Gdk-Pixbuf and OpenGL

LIB_DEPENDS=	gtkglext-x11-1.0.0:${PORTSDIR}/x11-toolkits/gtkglext

LICENSE=	GPLv2

USE_BZIP2=	yes
USE_GNOME=	gnomehack gnomeprefix gtk20
USE_GL=		yes
USE_GETTEXT=	yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
MAKE_ARGS=	ACLOCAL="${TRUE}" AUTOCONF="${TRUE}" AUTOMAKE="${TRUE}" \
		AUTOHEADER="${TRUE}"

MAN1=		gliv.1
MANLANG=	"" de fr ru

CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

post-install:
	${MKDIR} ${PREFIX}/share/applications
	${INSTALL_DATA} ${WRKSRC}/gliv.desktop \
		${PREFIX}/share/applications
	${INSTALL_DATA} ${WRKSRC}/gliv.png \
		${PREFIX}/share/pixmaps

.include <bsd.port.mk>
