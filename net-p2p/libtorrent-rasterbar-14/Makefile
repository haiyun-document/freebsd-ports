# New ports collection makefile for:	libtorrent-rasterbar-14
# Date created:				14 February 2010
# Whom:					dougb@FreeBSD.org
#
# $FreeBSD$
#

PORTNAME=	libtorrent-rasterbar
PORTVERSION=	0.14.12
PORTREVISION=	2
CATEGORIES=	net-p2p ipv6
MASTER_SITES=	${MASTER_SITE_GOOGLE_CODE}
PROJECTHOST=	libtorrent

MAINTAINER=	dougb@FreeBSD.org
COMMENT=	A C++ library implementing a BitTorrent client

DEPRECATED=	Upstream development stopped, time to move on
EXPIRATION_DATE=	2012-06-30

LIB_DEPENDS=	boost_date_time.4:${PORTSDIR}/devel/boost-libs \
		GeoIP.5:${PORTSDIR}/net/GeoIP

MAKE_JOBS_SAFE=	yes

CONFLICTS=	libtorrent-rasterbar-0.1[2356789].*

USE_GNOME=	gnomehack
USE_OPENSSL=	yes
USE_AUTOTOOLS=	aclocal automake autoconf libtool
ACLOCAL_ARGS=	-I m4
CONFIGURE_ARGS=	--disable-debug \
		--disable-python-binding \
		--disable-examples \
		--with-boost-regex=no \
		--with-boost-program-options=no \
		--with-boost=${LOCALBASE} \
		--with-boost-asio=boost_system \
		--with-boost-system=boost_system \
		--with-boost-filesystem=boost_filesystem \
		--with-boost-thread=boost_thread \
		--with-dht=on \
		--with-encryption=on \
		--with-libgeoip \
		--with-zlib=system
USE_LDCONFIG=	yes

CPPFLAGS+=	${PTHREAD_CFLAGS}
LDFLAGS+=	${PTHREAD_LIBS}

.if !defined(NOPORTDOCS)
PORTDOCS=	*
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|libdir)/pkgconfig|prefix)/libdata/pkgconfig|g' \
		${WRKSRC}/Makefile.am
	@${REINPLACE_CMD} -e 's|^AM_CFLAGS|AM_CPPFLAGS|g' \
		 ${WRKSRC}/src/Makefile.am
	@${CP} ${WRKSRC}/configure ${WRKSRC}/configure.Dist
	@${SED} -e 's#COMPILETIME_OPTIONS+="#COMPILETIME_OPTIONS="$$COMPILETIME_OPTIONS #g' \
		${WRKSRC}/configure.Dist > ${WRKSRC}/configure

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/docs/*.html ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/docs/*.css ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/docs/*.gif ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/docs/*.jpg ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/docs/*.png ${DOCSDIR}
.endif

.include <bsd.port.mk>
