# ex:ts=8
# Ports collection makefile for:	XML::Catalog
# Date created:			Jan 24, 2002
# Whom:				ijliao
#
# $FreeBSD$
#

PORTNAME=	XML-Catalog
PORTVERSION=	0.02
PORTREVISION=	1
CATEGORIES=	textproc perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Resolve public identifiers and remap system identifiers

BUILD_DEPENDS=	p5-XML-Parser>=0:${PORTSDIR}/textproc/p5-XML-Parser \
		p5-libwww>=0:${PORTSDIR}/www/p5-libwww \
		p5-URI>=0:${PORTSDIR}/net/p5-URI
RUN_DEPENDS:=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		XML::Catalog.3

post-patch:
	${PERL} -pi -e 's/\r//' ${WRKSRC}/Catalog.pm

.include <bsd.port.mk>
