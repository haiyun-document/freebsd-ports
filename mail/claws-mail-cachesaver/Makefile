# New ports collection makefile for:	sylpheed-claws-cachesaver
# Date created:	3 April 2006
# Whom:	Pawel Pekala <c0rn@o2.pl>
#
# $FreeBSD$
#

PORTNAME=	cachesaver
PORTVERSION=	0.10.9
PORTREVISION=	15
CATEGORIES=	mail
MASTER_SITES=	http://www.claws-mail.org/downloads/plugins/
PKGNAMEPREFIX=	claws-mail-

MAINTAINER=	pawel@FreeBSD.org
COMMENT=	Cache saving plugin for claws-mail

LICENSE=	GPLv3

BUILD_DEPENDS=	claws-mail>=3.8.0:${PORTSDIR}/mail/claws-mail
RUN_DEPENDS=	claws-mail>=3.8.0:${PORTSDIR}/mail/claws-mail

USE_GMAKE=	yes
USE_AUTOTOOLS=	autoconf
MAKE_JOBS_SAFE=	yes

PLIST_FILES=	lib/claws-mail/plugins/cachesaver.a \
		lib/claws-mail/plugins/cachesaver.la \
		lib/claws-mail/plugins/cachesaver.so

.include <bsd.port.mk>
