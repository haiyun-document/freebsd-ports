# New ports collection makefile for:	rubygem-visage
# Date created:				17 January 2012
# Whom:					Brad Davis <brd@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	visage-app
PORTVERSION=	2.1.0
CATEGORIES=	net-mgmt rubygems
MASTER_SITES=	RG

MAINTAINER=	brd@FreeBSD.org
COMMENT=	Graph tool for Collectd

RUN_DEPENDS=	rubygem-tilt>=1.3.3:${PORTSDIR}/devel/rubygem-tilt \
		rubygem-haml>=3.1.4:${PORTSDIR}/www/rubygem-haml \
		rubygem-sinatra>=1.3.2:${PORTSDIR}/www/rubygem-sinatra \
		rubygem-errand>=0.7.3:${PORTSDIR}/devel/rubygem-errand \
		rubygem-yajl-ruby>=1.1.0:${PORTSDIR}/devel/rubygem-yajl-ruby

USE_RUBY=	yes
USE_RUBYGEMS=	yes
RUBYGEM_AUTOPLIST=	yes

PLIST_FILES=	bin/visage-app

.include <bsd.port.mk>
