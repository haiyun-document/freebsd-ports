# New ports collection makefile for:	pvpgn
# Date created:				19 January 2005
# Whom:					mek
#
# $FreeBSD$
#

PORTNAME=	pvpgn
PORTVERSION=	1.8.5
CATEGORIES=	games
MASTER_SITES=	${MASTER_SITE_BERLIOS}
MASTER_SITE_SUBDIR=	pvpgn
DISTFILES=	${EXTRACT_ONLY} pvpgn-support-1.2.tar.gz
DIST_SUBDIR=	pvpgn
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	mek@mek.uz.ua
COMMENT=	Free Blizzard Battle.net emulation software

PKGINSTALL?=	${WRKDIR}/pkg-install
PKGDEINSTALL?=	${WRKDIR}/pkg-deinstall
USE_BZIP2=	yes
USE_GMAKE=	yes
SED_SCRIPT=	-e 's|%%PREFIX%%|${PREFIX}|g'

USERS=		bnetd
GROUPS=		${USERS}

RC_DIR=		${PREFIX}/etc/rc.d
RC_SUFX=	.sh
SED_SCRIPT+=	-e 's|%%RC_DIR%%|${RC_DIR}|g' \
		-e 's|%%RC_SUFX%%|${RC_SUFX}|g'

PLIST_SUB+=	RC_SUFX=${RC_SUFX}

WRKSRC=		${WRKDIR}/${DISTNAME}/src

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--sysconfdir=${PREFIX}/etc/pvpgn \
		--localstatedir=${DATADIR} \
		--with-libraries=${LOCALBASE}/lib

USE_RC_SUBR=	bnetd.sh

MAN1=		bnbot.1 bnchat.1 bnetd.1 bnftp.1 bni2tga.1 bnibuild.1 \
		bniextract.1 bnilist.1 bnpass.1 bnstat.1 bntrackd.1 tgainfo.1
MAN5=		bnetd.conf.5 bntext.5

OPTIONS=	MYSQL "Include MySQL user accounts support" off \
		PGSQL "Include PostgreSQL user accounts support" off \
		SQLITE3 "Include SQLite3 user accounts support" off \
		D2 "Enable Diablo II server (D2CS/D2DBS)" on

.include <bsd.port.pre.mk>

.if defined(WITH_MYSQL)
USE_MYSQL=	yes
CONFIGURE_ARGS+=--with-mysql
.endif

.if defined(WITH_PGSQL)
USE_PGSQL=	yes
CONFIGURE_ARGS+=--with-pgsql
.endif

.if defined(WITH_SQLITE3)
USE_SQLITE=	3
CONFIGURE_ARGS+=--with-sqlite3
.endif

.if defined(WITHOUT_D2)
CONFIGURE_ARGS+=	--disable-d2cs --disable-d2dbs
PLIST_SUB+=	WITH_D2="@comment "
.else
PLIST_SUB+=	WITH_D2=""
.endif

## support files

SUPPORT_SUFFX=	.tar.gz
SUPPORT_FILES=	pvpgn-support-1.2

post-extract:
	@${MKDIR} ${WRKSRC}/${SUPPORT_FILES}
	@${TAR} -C ${WRKSRC} -xzf ${DISTDIR}/${DIST_SUBDIR}/${SUPPORT_FILES}${SUPPORT_SUFFX}

post-build:
	@${SED} "s|%%PVPGN_DIR%%|${DATADIR}|g" ${PKGDIR}/pkg-install > ${WRKDIR}/pkg-install
	@${SED} "s|%%PVPGN_DIR%%|${DATADIR}|g" ${PKGDIR}/pkg-deinstall > ${WRKDIR}/pkg-deinstall

post-install:
	@${ECHO_MSG} ">>>   installing support files ..."
.for i in IX86ver1.mpq PMACver1.mpq XMACver1.mpq bnserver-D2DV.ini \
	bnserver-D2XP.ini bnserver-WAR3.ini bnserver.ini icons-WAR3.bni \
	icons.bni icons_STAR.bni ver-ix86-1.mpq

	${INSTALL_DATA} ${WRKSRC}/${SUPPORT_FILES}/${i} ${DATADIR}/files
.endfor

## Additional documentation

.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
.for i in INSTALL.unix PORTS README.fdwatch README.storage bnmotd.txt
	${INSTALL_MAN} ${WRKSRC}/../docs/${i} ${DOCSDIR}
.endfor
.endif

	@${SH} ${PKGINSTALL} ${PKGNAME} POST-INSTALL

.include <bsd.port.post.mk>
