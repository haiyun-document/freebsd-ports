# New ports collection makefile for:	pure-mpfr
# Date created:		2011-10-19
# Whom:			Zhihao Yuan <lichray@gmail.com>
#
# $FreeBSD$
#

PORTNAME=	pure-mpfr
PORTVERSION=	0.4
CATEGORIES=	math

MAINTAINER=	lichray@gmail.com
COMMENT=	Multiprecision floats for Pure

USE_PURE=	yes

PLIST_FILES=	lib/pure/mpfr.pure \
		lib/pure/mpfr.so

MAKE_ARGS+=	libdir="${PREFIX}/lib"

.include <bsd.port.pre.mk>
.include "${PORTSDIR}/lang/pure/bsd.pure.mk"
.include <bsd.port.post.mk>
