# New ports collection Makefile for:	euchre
# Date created:				23 July 2002
# Whom:					Frank Laszlo <laszlof@freebsdmatrix.net>
#
# $FreeBSD$
#

PORTNAME=	euchre
PORTVERSION=	0.7
PORTREVISION=	4
CATEGORIES=	games
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Very popular card game with variable skill levels

PLIST_FILES=	bin/euchre
USE_AUTOTOOLS=	automake14 autoconf213
USE_GNOME=	gtk12
CFLAGS+=	-include "${FILESDIR}/std-namespace.h" -Werror
MAKE_JOBS_SAFE=	yes

post-patch:
	${REINPLACE_CMD} 's,char,const char,'	\
		${WRKSRC}/src/pixmaps/*.xpm	\
		${WRKSRC}/src/pixmaps/pixmaps.?pp

.include <bsd.port.mk>
