# New ports collection makefile for:	p5-MeCab
# Date created:		23 April 2003
# Whom:			Akinori MUSHA aka knu <knu@idaemons.org>
#
# $FreeBSD$
#

PORTNAME=	MeCab
PORTVERSION=	0.98
CATEGORIES=	japanese textproc perl5
MASTER_SITES=		SF/${PORTNAME:L}/${PORTNAME:L}-perl/${PORTVERSION}
DISTNAME=		${PORTNAME:L}-perl-${PORTVERSION}

MAINTAINER=	perl@FreeBSD.org
COMMENT=	MeCab library module for Perl5

LIB_DEPENDS=	mecab.1:${PORTSDIR}/japanese/mecab

PERL_CONFIGURE=	yes

.include <bsd.port.pre.mk>

PKGNAMEPREFIX:=	${PKGNAMEPREFIX}p5-

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/test.pl ${EXAMPLESDIR}
.endif

.include <bsd.port.post.mk>
