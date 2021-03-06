# New ports collection makefile for:	libstatgrab
# Date created:		30 March 2003
# Whom:			Tim Bishop <tim@bishnet.net>
#
# $FreeBSD$
#

PORTNAME=	libstatgrab
PORTVERSION=	0.17
CATEGORIES=	devel
MASTER_SITES=	ftp://ftp.uk.i-scream.org/pub/i-scream/%SUBDIR%/ \
		http://ftp.uk.i-scream.org/pub/i-scream/%SUBDIR%/ \
		http://dl.ambiweb.de/mirrors/ftp.i-scream.org/%SUBDIR%/ \
		ftp://ftp.i-scream.org/pub/i-scream/%SUBDIR%/ \
		http://ftp.i-scream.org/pub/i-scream/%SUBDIR%/
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	tdb@FreeBSD.org
COMMENT=	Provides a useful interface to system statistics

DIST_SUBDIR=	i-scream
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
USE_GNOME=	gnomehack pkgconfig

MAN3=		sg_get_cpu_percents.3 sg_get_cpu_stats.3 \
		sg_get_cpu_stats_diff.3 sg_get_disk_io_stats.3 \
		sg_get_disk_io_stats_diff.3 sg_get_fs_stats.3 \
		sg_get_host_info.3 sg_get_load_stats.3 sg_get_mem_stats.3 \
		sg_get_network_iface_stats.3 sg_get_network_io_stats.3 \
		sg_get_network_io_stats_diff.3 sg_get_page_stats.3 \
		sg_get_page_stats_diff.3 sg_get_process_count.3 \
		sg_get_process_stats.3 sg_get_swap_stats.3 \
		sg_get_user_stats.3 statgrab.3

CONFIGURE_ARGS+=	--disable-examples

.ifdef(WITHOUT_STATGRAB)
CONFIGURE_ARGS+=	--disable-statgrab
PLIST_SUB+=		STATGRAB="@comment "
.else
PLIST_SUB+=		STATGRAB=""
MAN1+=			statgrab.1 statgrab-make-mrtg-config.1 \
			statgrab-make-mrtg-index.1
.endif

.ifdef(WITHOUT_SAIDAR)
CONFIGURE_ARGS+=	--disable-saidar
PLIST_SUB+=		SAIDAR="@comment "
.else
PLIST_SUB+=		SAIDAR=""
MAN1+=			saidar.1
.endif

.include <bsd.port.mk>
