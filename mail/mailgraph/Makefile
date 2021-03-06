# New ports collection makefile for:	mailgraph
# Date created:			30 August 2002
# Whom:				Gea-Suan Lin (gslin@ccca.nctu.edu.tw)
#
# $FreeBSD$
#

PORTNAME=	mailgraph
PORTVERSION=	1.14
PORTREVISION=	5
CATEGORIES=	mail
MASTER_SITES=	http://mailgraph.schweikert.ch/pub/ \
		http://mailgraph.schweikert.ch/pub/old/

MAINTAINER=	rafan@FreeBSD.org
COMMENT=	A RRDtool frontend for Postfix statistics

RUN_DEPENDS=	${SITE_PERL}/RRDp.pm:${PORTSDIR}/databases/rrdtool	\
		${SITE_PERL}/File/Tail.pm:${PORTSDIR}/devel/p5-File-Tail

NO_BUILD=	yes
USE_PERL5=	yes

CGIDIR?=	${PREFIX}/www/cgi-bin
DATADIR?=	/var/db/mailgraph
WWWROOT?=	${PREFIX}/www/data
MAILGRAPH_USER?=	${WWWOWN}
MAILGRAPH_GROUP?=	${WWWGRP}

USE_RC_SUBR=	${PORTNAME}
SUB_LIST+=	MAILGRAPH_USER=${MAILGRAPH_USER} MAILGRAPH_GROUP=${MAILGRAPH_GROUP}
PLIST_SUB=	CGIDIR=${CGIDIR:S,${PREFIX}/,,} WWWROOT=${WWWROOT:S,${PREFIX}/,,}

DOCS=		README CHANGES
.if !defined(NOPORTDOCS)
PORTDOCS=	${DOCS}
.endif

pre-everything::
	@${ECHO_MSG} ""
	@${ECHO_MSG} "You may set following options:"
	@${ECHO_MSG} ""
	@${ECHO_MSG} "DATADIR=/var/db/mailgraph	Where do you put RRD databases?"
	@${ECHO_MSG} "CGIDIR=${PREFIX}/www/cgi-bin	Where do you put cgi?"
	@${ECHO_MSG} "WWWROOT=${PREFIX}/www/data	Where do you put httpd's document root?"
	@${ECHO_MSG} "MAILGRAPH_USER=www		User to run mailgraph (Default: ${WWWOWN})"
	@${ECHO_MSG} ""

post-patch:
	@${REINPLACE_CMD} -e "s,%%DATADIR%%,${DATADIR}," ${WRKSRC}/mailgraph.cgi

do-install:
	${MKDIR} ${CGIDIR}
	${MKDIR} ${WWWROOT}/mailgraph
	${MKDIR} ${DATADIR}
	@${CHOWN} -R ${MAILGRAPH_USER}:${MAILGRAPH_GROUP} ${DATADIR}
	@${INSTALL_SCRIPT} ${WRKSRC}/mailgraph.pl ${PREFIX}/sbin
	@${INSTALL_SCRIPT} ${WRKSRC}/mailgraph.cgi ${CGIDIR}
	@${INSTALL_DATA} ${WRKSRC}/mailgraph.css ${WWWROOT}/mailgraph
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	for f in ${DOCS}; do \
	  ${INSTALL_DATA} ${WRKSRC}/$$f ${DOCSDIR}; \
	done
.endif

post-install:
	@${ECHO_MSG} ""
	@${CAT} ${PKGMESSAGE}
	@${ECHO_MSG} ""

.include <bsd.port.mk>
