# New ports collection makefile for:	p5-CSS-DOM
# Date created:		2008-11-16
# Whom:			Gea-Suan Lin <gslin@gslin.org>
#
# $FreeBSD$
#

PORTNAME=	CSS-DOM
PORTVERSION=	0.14
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CSS
PKGNAMEPREFIX=	p5-

MAINTAINER=	perl@FreeBSD.org
COMMENT=	Document Object Model for Cascading Style Sheets

RUN_DEPENDS=	p5-Clone>=0.09:${PORTSDIR}/devel/p5-Clone
BUILD_DEPENDS:=	${RUN_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		CSS::DOM.3 \
		CSS::DOM::Array.3 \
		CSS::DOM::Constants.3 \
		CSS::DOM::Exception.3 \
		CSS::DOM::Interface.3 \
		CSS::DOM::MediaList.3 \
		CSS::DOM::Parser.3 \
		CSS::DOM::PropertyParser.3 \
		CSS::DOM::Rule.3 \
		CSS::DOM::Rule::Charset.3 \
		CSS::DOM::Rule::FontFace.3 \
		CSS::DOM::Rule::Import.3 \
		CSS::DOM::Rule::Media.3 \
		CSS::DOM::Rule::Page.3 \
		CSS::DOM::Rule::Style.3 \
		CSS::DOM::RuleList.3 \
		CSS::DOM::Style.3 \
		CSS::DOM::StyleSheetList.3 \
		CSS::DOM::Util.3 \
		CSS::DOM::Value.3 \
		CSS::DOM::Value::List.3 \
		CSS::DOM::Value::Primitive.3 \

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 500807
RUN_DEPENDS+=	p5-Encode>=2.1:${PORTSDIR}/converters/p5-Encode
.endif

.include <bsd.port.post.mk>
