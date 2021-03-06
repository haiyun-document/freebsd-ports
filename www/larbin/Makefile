# New ports collection makefile for: 	larbin
# Date Created:		26 March 2002
# Whom:			Hiten Pandya <hiten@uk.FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	larbin
PORTVERSION=	2.6.3
PORTREVISION=	1
CATEGORIES=	www
MASTER_SITES=	SF

MAINTAINER=	ports@FreeBSD.org
COMMENT=	A powerful HTTP crawler with an easy interface

BUILD_DEPENDS=	bash:${PORTSDIR}/shells/bash \
		makedepend:${PORTSDIR}/devel/makedepend

USE_GMAKE=	yes
GNU_CONFIGURE=	yes
MAKE_ARGS=	CXX=${CXX}

.include <bsd.port.pre.mk>

post-patch:
	@${SED} -e 's,CC=,CC?=,' -e 's,CFLAGS=-O3,CFLAGS+=,' < \
		${WRKSRC}/adns/Makefile > ${WRKSRC}/adns/Makefile.new
	@${MV} ${WRKSRC}/adns/Makefile.new ${WRKSRC}/adns/Makefile
	${REINPLACE_CMD} -e 's,/bin/bash,${LOCALBASE}/bin/bash,' ${WRKSRC}/configure
	${REINPLACE_CMD} -e 's,CFLAGS:=-O3,CFLAGS+=,g ; s,CXXFLAGS:=-Wall -O3,CXXFLAGS+=,g' \
		${WRKSRC}/src/larbin.make

do-install:
	@${INSTALL_PROGRAM} ${WRKSRC}/larbin ${PREFIX}/bin/
	@${INSTALL_DATA} ${WRKSRC}/larbin.conf ${PREFIX}/etc/larbin.conf.sample
	@${MKDIR} ${PREFIX}/share/larbin
	@${INSTALL_DATA} ${WRKSRC}/doc/* ${PREFIX}/share/larbin/

pre-configure: config-message

config-message:
	@${ECHO} "====================================================================="
	@${ECHO} ""
	@${ECHO} "Make sure you have a look at the larbin documentation available at:"
	@${ECHO} "  http://larbin.sourceforge.net/custom-eng.html."
	@${ECHO} ""
	@${ECHO} "====================================================================="

post-install:
	@${ECHO} "====================================================================="
	@${ECHO} ""
	@${ECHO} "You must invoke larbin with the name of the configuration file, e.g:"
	@${ECHO} "larbin -c config-file"
	@${ECHO} ""
	@${ECHO} "Documentation: ${PREFIX}/share/larbin"
	@${ECHO} "Sample Configuration file: ${PREFIX}/etc/larbin.conf.sample"
	@${ECHO} ""
	@${ECHO} "====================================================================="

.include <bsd.port.post.mk>
