# New ports collection makefile for:	safecat
# Date created:		27 November 2000
# Whom:			roam@FreeBSD.org
#
# $FreeBSD$
#

PORTNAME=	safecat
PORTVERSION=	1.13
CATEGORIES=	sysutils mail
MASTER_SITES=	http://jeenyus.net/~budney/linux/software/safecat/ \
		${MASTER_SITE_LOCAL:S/local-distfiles/local-distfiles\/roam/} \
		${MASTER_SITE_SUNSITE} \
		http://people.FreeBSD.org/~roam/ports/sysutils/safecat/
MASTER_SITE_SUBDIR=	utils/file

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Safely write data to a directory using D. J. Bernstein's Maildir ideology

MAN1=		safecat.1 maildir.1

do-configure:
		${REINPLACE_CMD} -e "s,/usr/local,${PREFIX}," ${WRKSRC}/conf-root
		${REINPLACE_CMD} -e "s,cc -O2,${CC} ${CFLAGS}," ${WRKSRC}/conf-cc
		${REINPLACE_CMD} -e "s,cc -s,${CC} ${CFLAGS} ${STRIP}," ${WRKSRC}/conf-ld

ALL_TARGET=	it
INSTALL_TARGET=	setup check

.include <bsd.port.mk>
