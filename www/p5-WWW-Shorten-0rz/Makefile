# New ports collection makefile for:	p5-WWW-Shorten-0rz
# Date created:				2006-07-16
# Whom:					Tsung-Han Yeh <snowfly@yuntech.edu.tw>
#
# $FreeBSD$
#

PORTNAME=	WWW-Shorten-0rz
PORTVERSION=	0.07
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	snowfly@yuntech.edu.tw
COMMENT=	Shorten URL using 0rz.net

BUILD_DEPENDS=	p5-WWW-Shorten>=0:${PORTSDIR}/www/p5-WWW-Shorten \
		p5-WWW-Mechanize>=0:${PORTSDIR}/www/p5-WWW-Mechanize
RUN_DEPENDS:=	${BUILD_DEPENDS}
TEST_DEPENDS=	p5-Test-Exception>=0:${PORTSDIR}/devel/p5-Test-Exception

PERL_CONFIGURE=	yes

MAN3=		WWW::Shorten::0rz.3

.include <bsd.port.mk>
