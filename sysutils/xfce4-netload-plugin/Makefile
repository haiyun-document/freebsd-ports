# New ports collection makefile for:	xfce-netload-plugin
# Date created:				3 September 2003
# Whom:					Dmitry Sivachenko <demon@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	xfce4-netload-plugin
PORTVERSION=	1.1.0
PORTREVISION=	2
CATEGORIES=	sysutils xfce
MASTER_SITES=	${MASTER_SITE_XFCE}
MASTER_SITE_SUBDIR=	src/panel-plugins/${PORTNAME}/${PORTVERSION:R}
DIST_SUBDIR=	xfce4

MAINTAINER=	demon@FreeBSD.org
COMMENT=	Network Load plugin for XFce4

GNU_CONFIGURE=	yes
USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomehack intltool intlhack pkgconfig
USE_XFCE=	configenv libmenu panel
INSTALLS_ICONS=	yes

OPTIONS=	NLS "Enable Native Language Support" on

.include <bsd.port.pre.mk>

.if !defined(WITHOUT_NLS)
USE_GETTEXT=  yes
CONFIGURE_ARGS+=--enable-nls
PLIST_SUB+= NLS=""
.else
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+= NLS="@comment "
.endif

do-patch:
	@${REINPLACE_CMD} -e 's|#  include <net/if_ppp.h>||' \
		${WRKSRC}/panel-plugin/os.h
	@${REINPLACE_CMD} -e 's, || __FreeBSD_kernel__,,' \
		${WRKSRC}/panel-plugin/net.c \
		${WRKSRC}/panel-plugin/net.h \
		${WRKSRC}/panel-plugin/os.h

.include <bsd.port.post.mk>
