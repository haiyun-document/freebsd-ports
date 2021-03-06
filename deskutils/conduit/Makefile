# New ports collection makefile for:	conduit
# Date created:		2006-10-10
# Whom:			Michael Johnson <ahze@FreeBSD.org>
#
# $FreeBSD$
#    $MCom: ports/deskutils/conduit/Makefile,v 1.7 2008/03/18 14:53:42 ahze Exp $

PORTNAME=	conduit
PORTVERSION=	0.3.17
PORTREVISION=	6
CATEGORIES=	deskutils
MASTER_SITES=	GNOME

MAINTAINER=	gnome@FreeBSD.org
COMMENT=	Synchronization application for GNOME

BUILD_DEPENDS=	${PYTHON_SITELIBDIR}/goocanvasmodule.so:${PORTSDIR}/graphics/py-goocanvas \
		${PYTHON_SITELIBDIR}/_sqlite3.so:${PORTSDIR}/databases/py-sqlite3 \
		xmlproc_parse:${PORTSDIR}/textproc/py-xml \
		${PYTHON_PKGNAMEPREFIX}vobject>=0.4.8:${PORTSDIR}/deskutils/py-vobject \
		${LOCALBASE}/libdata/pkgconfig/dbus-python.pc:${PORTSDIR}/devel/py-dbus
LIB_DEPENDS=	dbus-1.3:${PORTSDIR}/devel/dbus
RUN_DEPENDS=	${PYTHON_SITELIBDIR}/goocanvasmodule.so:${PORTSDIR}/graphics/py-goocanvas \
		${PYTHON_SITELIBDIR}/_sqlite3.so:${PORTSDIR}/databases/py-sqlite3 \
		xmlproc_parse:${PORTSDIR}/textproc/py-xml \
		${PYTHON_PKGNAMEPREFIX}vobject>=0.4.8:${PORTSDIR}/deskutils/py-vobject \
		${LOCALBASE}/libdata/pkgconfig/dbus-python.pc:${PORTSDIR}/devel/py-dbus \
		xdg-open:${PORTSDIR}/devel/xdg-utils

USE_PYTHON=	2.5+
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
USE_GETTEXT=	yes
INSTALLS_OMF=	yes
INSTALLS_ICONS=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
USE_GNOME=	pygnome2 gnomeprefix
OPTIONS=	NAUTILUS "Enable Nautilus Plugin" On \
		EOG "Enable Eye-Of-Gnome Plugin" On

.include <bsd.port.pre.mk>

.if defined(WITH_NAUTILUS)
USE_GNOME+=	nautilus2
CONFIGURE_ARGS+=	--enable-nautilus-extension
.endif

.if defined(WITH_EOG)
BUILD_DEPENDS+=	eog:${PORTSDIR}/graphics/eog
RUN_DEPENDS+=	eog:${PORTSDIR}/graphics/eog
CONFIGURE_ARGS+=	--enable-eog-plugin
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|$$(libdir)/pkgconfig|${PREFIX}/libdata/pkgconfig|' \
		${WRKSRC}/data/Makefile.in
	@${FIND} ${WRKSRC} -type f | ${XARGS} ${REINPLACE_CMD} -e 's|/bin/bash|${SH}|' \
		-e 's|/usr/bin/python|${LOCALBASE}/bin/python|' \
		-e 's|/usr/lib/firefox*|${LOCALBASE}/lib/firefox|'

.include <bsd.port.post.mk>
