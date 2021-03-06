# New ports collection makefile for:   kvirc
# Date created:        05 January 2004
# Whom:                Michael Ranner
#
# $FreeBSD$
#

PORTNAME=	kvirc
PORTVERSION=	4.0.4
PORTREVISION=	3
CATEGORIES=	irc kde
MASTER_SITES=	ftp://ftp.kvirc.de/pub/kvirc/%SUBDIR%/ \
		http://kvirc.gmake.de/pub/kvirc/%SUBDIR%/ \
		http://kvirc-ftp.visualscripts.com/%SUBDIR%/ \
		ftp://dedimarbo.ath.cx/pub/kvirc/%SUBDIR%/ \
		ftp://kvirc.eban-meban.com/%SUBDIR%/ \
		http://kvirc.tradebit.com/%SUBDIR%/ \
		http://kvirc.imsam.info/%SUBDIR%/ \
		http://kvirc.bcoos.net/%SUBDIR%/
MASTER_SITE_SUBDIR=	${PORTVERSION}/source

MAINTAINER=	makc@FreeBSD.org
COMMENT?=	IRC client for KDE4

.if !defined(PKGNAMESUFFIX)
CONFLICTS=	kvirc-qt4-4.*
.endif

USE_BZIP2=	yes
USE_GETTEXT=	yes
USE_OPENSSL=	yes
USE_PERL5_BUILD=	yes
USE_QT4=	moc_build qmake_build rcc_build uic_build \
		dbus gui network sql xml
USE_CMAKE=	yes
CMAKE_ARGS=	-DWITHOUT_ESD=yes -DWITHOUT_DOXYGEN=yes \
		-DMANDIR=${MANPREFIX}
INSTALLS_ICONS=	yes
USE_LDCONFIG=	yes
MAKE_JOBS_SAFE=	yes

MAN1=		kvirc.1
MANLANG=	"" de fr it

OPTIONS=	AUDIOFILE "Support for various audio formats" off \
		DEBUG "Build with debug support" off \
		GSM "u-law to gsm audio converter support" off \
		PERL "Perl scripting support" off \
		PYTHON "Python scripting support" off
.if defined(PKGNAMESUFFIX)
OPTIONS+=	PHONON "Build with Phonon support" off \
		WEBKIT "Build with QtWebkit support" off
.endif

PLIST_SUB+=	VER="${PORTVERSION:R}"

.include <bsd.port.options.mk>

.if defined(PKGNAMESUFFIX)
CMAKE_ARGS+=	-DWITHOUT_KDE4=yes
PLIST_SUB+=	QT="" KDE="@comment "
. if defined(WITH_PHONON)
USE_QT4+=	phonon
. else
CMAKE_ARGS+=	-DWITHOUT_PHONON=yes
. endif
. if defined(WITH_WEBKIT)
USE_QT4+=	webkit
. else
CMAKE_ARGS+=	-DWITHOUT_QTWEBKIT=yes
. endif
.else #defined(PKGNAMESUFFIX)
USE_KDE4=	kdelibs automoc4 kdeprefix
PLIST_SUB+=	QT="@comment " KDE=""
.endif #defined(PKGNAMESUFFIX)

.if defined(WITH_DEBUG)
CMAKE_ARGS+=	-DWITH_DEBUG=yes -DVERBOSE=yes
.endif

#audio support
.if defined(WITH_AUDIOFILE)
LIB_DEPENDS+=	audiofile.0:${PORTSDIR}/audio/libaudiofile
.else
CMAKE_ARGS+=	-DWITHOUT_AUDIOFILE=yes
.endif

.if defined(WITH_GSM)
LIB_DEPENDS+=	gsm.1:${PORTSDIR}/audio/gsm
.else
CMAKE_ARGS+=	-DWITHOUT_GSM=yes
.endif

#scripting support
.if defined(WITH_PYTHON)
USE_PYTHON=	yes
PLIST_SUB+=	PYTHON=""
.else
CMAKE_ARGS+=	-DWITHOUT_PYTHON=yes
PLIST_SUB+=	PYTHON="@comment "
.endif

.if defined(WITH_PERL)
USE_PERL5_RUN=	yes
PLIST_SUB+=	PERL=""
.else
CMAKE_ARGS+=	-DWITHOUT_PERL=yes
PLIST_SUB+=	PERL="@comment "
.endif

.if defined(WITH_PERL)
pre-everything::
	@${ECHO_CMD} "====================================================="
	@${ECHO_CMD} "     To enable perl scripting you need to rebuild"
	@${ECHO_CMD} "     perl with multiplicity support!"
	@${ECHO_CMD} "====================================================="
.endif

.include <bsd.port.mk>
