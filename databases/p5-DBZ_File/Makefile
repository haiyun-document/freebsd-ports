# New ports collection makefile for:	p5-DBZ_File
# Date created:				May 26th 2000
# Whom:					Yen-Ming Lee <leeym@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	DBZ_File
PORTVERSION=	1.1
CATEGORIES=	databases perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-
DISTNAME=	${PORTNAME}_${PORTVERSION}

MAINTAINER=	leeym@FreeBSD.org
COMMENT=	Perl module to access a DBZ database

PERL_CONFIGURE=	yes
CONFIGURE_ARGS=	DEFINE="-I${FILESDIR}" POLLUTE=1

WRKSRC=		${WRKDIR}/DBZ_File

MAN3=		DBZ_File.3

.include <bsd.port.pre.mk>
.if ${PERL_LEVEL} > 501400
BROKEN=	POLLUTE=1 is gone, does not compile, has not been released since 1997
.endif
.include <bsd.port.post.mk>
