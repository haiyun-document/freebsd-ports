# New ports collection makefile for:	Apache2-Scoreboard
# Date Created:				11 June 2005
# Whom:					Philip Paeps <philip@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	Apache2-Scoreboard
PORTVERSION=	2.09.2
PORTREVISION=	2
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:MJH
PKGNAMEPREFIX=	p5-
DISTNAME=	${PORTNAME:C/2//}-${PORTVERSION}

MAINTAINER=	perl@FreeBSD.org
COMMENT=	Perl interface to the Apache scoreboard structure

BUILD_DEPENDS=	${APACHE_PKGNAMEPREFIX}mod_perl2>=2.0.0:${PORTSDIR}/www/mod_perl2
RUN_DEPENDS:=	${BUILD_DEPENDS}

BROKEN=		does not configure

PERL_CONFIGURE=	yes
USE_APACHE=	20+
USE_LDCONFIG=	yes
WRKSRC=		${WRKDIR}/${DISTNAME:R}

MAN3=		Apache::DummyScoreboard.3 Apache::Scoreboard.3

post-patch:
	@${REINPLACE_CMD} \
		-e 's|%%LOCALBASE%%|${LOCALBASE}|g' \
		-e 's|%%APACHEINCLUDEDIR%%|${APACHEINCLUDEDIR}|g' \
			${WRKSRC}/Makefile.PL ${WRKSRC}/Dummy/Makefile.PL

.include <bsd.port.mk>
