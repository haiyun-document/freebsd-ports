# New ports collection makefile for:	npadmin
# Date created:		13 Nov 1998
# Whom:			Dom Mitchell <dom@happygiraffe.net>
#
# $FreeBSD$
#

PORTNAME=	npadmin
PORTVERSION=	0.8.7
PORTREVISION=	1
CATEGORIES=	sysutils print
MASTER_SITES=	SF

MAINTAINER=	ports@FreeBSD.org
COMMENT=	An SNMP based command line network printer management tool

MAN1=		npadmin.1
PLIST_FILES=	bin/npadmin

GNU_CONFIGURE=	yes

pre-patch:
	@${REINPLACE_CMD} -e 's|-lpthread|${PTHREAD_LIBS}|g' ${WRKSRC}/configure

pre-configure:
	${RM} ${WRKSRC}/getopt.h ${WRKSRC}/getopt1.c

.include <bsd.port.mk>
