# New ports collection makefile for:	libpinyin
# Date created:		6 Feb 2012
# Whom:			Zhihao Yuan <lichray@gmail.com>
#
# $FreeBSD$
#

PORTNAME=	libpinyin
PORTVERSION=	0.5.92
CATEGORIES=	chinese textproc
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}

MAINTAINER=	lichray@gmail.com
COMMENT=	Library to deal with pinyin

MAN1=		libpinyin.1 gen_binary_files.1 gen_unigram.1 \
		import_interpolation.1

USE_BDB=	yes
USE_GNOME=	glib20 gnomehack pkgconfig
USE_GETTEXT=	yes
GNU_CONFIGURE=	yes
USE_AUTOTOOLS=	libtool
USE_GMAKE=	yes
USE_LDCONFIG=	yes

CONFIGURE_ARGS+=CPPFLAGS="-I${LOCALBASE}/include \
		-I${BDB_INCLUDE_DIR} -D_WITH_GETLINE" \
		LDFLAGS="-L${LOCALBASE}/lib -l${BDB_LIB_NAME}"

.include <bsd.port.pre.mk>

.if ${OSVERSION} < 800107
IGNORE=		does not compile on FreeBSD 7.X
.endif

.include <bsd.port.post.mk>
