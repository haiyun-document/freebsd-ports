# New ports collection makefile for:	py-demjson
# Date created:		2008-12-17
# Whom:			Wen Heping <wenheping@gmail.com>
#
# $FreeBSD$
#

PORTNAME=	demjson
PORTVERSION=	1.6
PORTREVISION=	1
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP \
		http://deron.meranda.us/python/demjson/dist/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	wen@FreeBSD.org
COMMENT=	Encoder, Decoder, and Lint/Validator for JSON

USE_PYTHON=	yes
USE_PYDISTUTILS=	yes

.include <bsd.port.pre.mk>

post-install:
	${INSTALL_SCRIPT} ${WRKSRC}/jsonlint ${PREFIX}/bin

.include <bsd.port.post.mk>
