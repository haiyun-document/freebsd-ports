# New ports collection makefile for:	xlog
# Date created:		2002-11-05
# Whom:			Patrick Gardella <patrick@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	xlog
PORTVERSION=	2.0.5
PORTREVISION=	1
CATEGORIES=	comms hamradio
MASTER_SITES=	${MASTER_SITE_SAVANNAH} \
		http://www.chronos.org.uk/download/
MASTER_SITE_SUBDIR=	xlog

MAINTAINER=	matt@chronos.org.uk
COMMENT=	Amateur Radio logging application

USE_GETTEXT=	yes
USE_GNOME=	gtk20
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-mime-update \
		CFLAGS="-I${PREFIX}/include" \
		LDFLAGS="-L${PREFIX}/lib"

LIB_DEPENDS+=	hamlib:${PORTSDIR}/comms/hamlib

MAN1=		xlog.1
LICENSE=	GPLv3

.if defined(WITHOUT_NLS)
CONFIGURE_ARGS+=	--disable-nls
PLIST_SUB+=		NLS="@comment "
.else
PLIST_SUB+=		NLS=""
.endif

post-patch:
	@${FIND} ${WRKSRC} -name Makefile.in | ${XARGS} ${REINPLACE_CMD} -e \
		's|-D.*_DISABLE_DEPRECATED||g'
.if defined(NOPORTDOCS)
	@${REINPLACE_CMD} -e 's|desktop doc dxcc|desktop dxcc|g' \
	${WRKSRC}/data/Makefile.in
	@${REINPLACE_CMD} -e \
	's|install-data-am: install-glabelsDATA|install-data-am:|g' \
	${WRKSRC}/data/glabels/Makefile.in
.endif

.include <bsd.port.mk>
