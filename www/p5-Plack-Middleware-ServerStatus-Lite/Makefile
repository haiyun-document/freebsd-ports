# New ports collection makefile for:	Plack::Middleware::ServerStatus::Lite
# Date created:		29 Jan 2012
# Whom:			Jun Kuriyama <kuriyama@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	Plack-Middleware-ServerStatus-Lite
PORTVERSION=	0.07
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	kuriyama@FreeBSD.org
COMMENT=	Plack middleware to show server status like Apache mod_status

RUN_DEPENDS=	\
	p5-JSON>0:${PORTSDIR}/converters/p5-JSON \
	p5-Net-CIDR-Lite>0:${PORTSDIR}/net/p5-Net-CIDR-Lite \
	p5-Parallel-Scoreboard>=0.02:${PORTSDIR}/devel/p5-Parallel-Scoreboard \
	p5-Plack>0:${PORTSDIR}/www/p5-Plack \
	p5-Try-Tiny>=0.09:${PORTSDIR}/lang/p5-Try-Tiny
BUILD_DEPENDS:=	${RUN_DEPENDS}
# Tests will fail if not root or 80/tcp is used.
TEST_DEPENDS=	\
	p5-Starlet>0:${PORTSDIR}/www/p5-Starlet \
	p5-Test-TCP>0:${PORTSDIR}/devel/p5-Test-TCP

PERL_CONFIGURE=	yes

MAN3=	Plack::Middleware::ServerStatus::Lite.3

.include <bsd.port.mk>
