# New ports collection makefile for:    p5-XML-RSS-JavaScript
# Date created:				31 Oct 2003
# Whom:					Foxfair Hu <foxfair@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	XML-RSS-JavaScript
PORTVERSION=	0.63
CATEGORIES=	textproc www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	sahil@FreeBSD.org
COMMENT=	Perl extension to serialize your RSS as JavaScript

RUN_DEPENDS=	p5-XML-RSS>=1.31:${PORTSDIR}/textproc/p5-XML-RSS
BUILD_DEPENDS:=	${RUN_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		XML::RSS::JavaScript.3

.include <bsd.port.mk>
