# New ports collection makefile for:	p5-String-ShowDiff
# Date created:				April 26, 2003
# Whom:					Mathieu Arnold <m@absolight.net>
#
# $FreeBSD$
#

PORTNAME=	String-ShowDiff
PORTVERSION=	0.03
CATEGORIES=	textproc perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	perl@FreeBSD.org
COMMENT=	Perl extension to help visualize differences between strings

BUILD_DEPENDS=	p5-Algorithm-Diff>=0:${PORTSDIR}/devel/p5-Algorithm-Diff \
		p5-Term-ANSIColor>=0:${PORTSDIR}/devel/p5-Term-ANSIColor
RUN_DEPENDS:=	${BUILD_DEPENDS}

PERL_CONFIGURE=	YES

MAN3=		String::ShowDiff.3

.include <bsd.port.mk>
