# New ports collection makefile for:	p5-Mail-Graph
# Date created:				Nov 4 2003
# Whom:					Cheng-Lung Sung <clsung@dragon2.net>
#
# $FreeBSD$
#

PORTNAME=	Mail-Graph
PORTVERSION=	0.14
PORTREVISION=	7
CATEGORIES=	mail perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	perl@FreeBSD.org
COMMENT=	Perl module for drawing graphical stats for mails/spams

RUN_DEPENDS=	p5-GD>=0:${PORTSDIR}/graphics/p5-GD \
		p5-GD-Graph>=0:${PORTSDIR}/graphics/p5-GD-Graph \
		p5-GD-TextUtil>=0:${PORTSDIR}/graphics/p5-GD-TextUtil \
		p5-Date-Calc>=0:${PORTSDIR}/devel/p5-Date-Calc
BUILD_DEPENDS:=	${RUN_DEPENDS}

PERL_CONFIGURE=	yes
EXAMPLESCRIPT=	samples/*pl
EXAMPLEDUMMY=	samples/index/dummy.txt
EXAMPLEOUTPUT=	samples/output/w3c.png samples/output/spam.css
EXAMPLEARCHIVE=	samples/archive/*.gz

MAN3=	Mail::Graph.3

post-install:
	@${MKDIR} ${EXAMPLESDIR}
	@${MKDIR} ${EXAMPLESDIR}/archive
	@${MKDIR} ${EXAMPLESDIR}/index
	@${MKDIR} ${EXAMPLESDIR}/output
	cd ${WRKSRC} && \
	${INSTALL_SCRIPT} ${EXAMPLESCRIPT} ${EXAMPLESDIR}  && \
	${INSTALL_SCRIPT} ${EXAMPLEDUMMY} ${EXAMPLESDIR}/index && \
	${INSTALL_SCRIPT} ${EXAMPLEOUTPUT} ${EXAMPLESDIR}/output && \
	${INSTALL_SCRIPT} ${EXAMPLEARCHIVE} ${EXAMPLESDIR}/archive

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 500903
RUN_DEPENDS+=	p5-IO-Compress>=2.017:${PORTSDIR}/archivers/p5-IO-Compress
.endif

.include <bsd.port.post.mk>
