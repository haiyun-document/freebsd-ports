# Ports collection makefile for:	mime4j
# Date created:			3 Sep 2008
# Whom:				Alex Dupre <ale@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	mime4j
PORTVERSION=	0.7.2
CATEGORIES=	mail java
MASTER_SITES=	${MASTER_SITE_APACHE}
MASTER_SITE_SUBDIR=	james/${PORTNAME}
DISTNAME=	apache-${PORTNAME}-${PORTVERSION}-bin

MAINTAINER=	ale@FreeBSD.org
COMMENT=	A Java parser for e-mail message streams

RUN_DEPENDS=	${JAVAJARDIR}/commons-logging.jar:${PORTSDIR}/java/jakarta-commons-logging

LICENSE=	AL2
LICENSE_FILE=	${WRKSRC}/LICENSE

USE_JAVA=	yes
JAVA_VERSION=	1.5+
NO_BUILD=	yes
WRKSRC=		${WRKDIR}/apache-${PORTNAME}-${PORTVERSION}

PLIST_FILES=	%%JAVAJARDIR%%/apache-${PORTNAME}-core.jar \
		%%JAVAJARDIR%%/apache-${PORTNAME}-dom.jar \
		%%JAVAJARDIR%%/apache-${PORTNAME}-storage.jar

PORTDOCS=	*

do-install:
	${INSTALL_DATA} ${WRKSRC}/apache-${PORTNAME}-core-${PORTVERSION}.jar \
		${JAVAJARDIR}/apache-${PORTNAME}-core.jar
	${INSTALL_DATA} ${WRKSRC}/apache-${PORTNAME}-dom-${PORTVERSION}.jar \
		${JAVAJARDIR}/apache-${PORTNAME}-dom.jar
	${INSTALL_DATA} ${WRKSRC}/apache-${PORTNAME}-storage-${PORTVERSION}.jar \
		${JAVAJARDIR}/apache-${PORTNAME}-storage.jar
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/RELEASE_NOTES.txt ${DOCSDIR}
.endif

.include <bsd.port.mk>
