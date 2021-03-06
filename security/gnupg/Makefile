# New ports collection makefile for:	gnupg
# Date created:		Sep 30, 1998
# Whom:			kuriyama@FreeBSD.org
#
# $FreeBSD$
#

PORTNAME=	gnupg
PORTVERSION=	2.0.19
CATEGORIES=	security
MASTER_SITES=	${MASTER_SITE_GNUPG}
MASTER_SITE_SUBDIR=	gnupg
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} ${DISTNAME}${EXTRACT_SUFX}.sig
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	kuriyama@FreeBSD.org
COMMENT=	The GNU Privacy Guard

LIB_DEPENDS=	assuan.0:${PORTSDIR}/security/libassuan \
		gcrypt.18:${PORTSDIR}/security/libgcrypt \
		gpg-error:${PORTSDIR}/security/libgpg-error \
		ksba.19:${PORTSDIR}/security/libksba \
		pth.20:${PORTSDIR}/devel/pth

LICENSE=	GPLv3 LGPL3
LICENSE_COMB=	multi
LICENSE_FILE_GPLv3=	${WRKSRC}/COPYING
LICENSE_FILE_LGPL3=	${WRKSRC}/COPYING.LIB
USE_BZIP2=	YES
USE_GMAKE=	YES
GNU_CONFIGURE=	YES
USE_ICONV=	YES
USE_LDCONFIG=	YES
CONFIGURE_ARGS+=	--enable-symcryptrun
.if defined(NOPORTDOCS)
CONFIGURE_ARGS+=	--disable-doc
.else
MAN1=		gpg2.1 gpgsm.1 gpgv2.1 gpg-agent.1 scdaemon.1 watchgnupg.1 \
		gpgconf.1 gpg-preset-passphrase.1 gpg-connect-agent.1 \
		gpgparsemail.1 symcryptrun.1 gpgsm-gencert.sh.1 gpg-zip.1
MAN8=		addgnupghome.8 applygnupgdefaults.8
INFO=		gnupg
.endif

OPTIONS=	PINENTRY "Use pinentry" off \
		LDAP "LDAP keyserver interface" off \
		SCDAEMON "Enable Smartcard daemon (with libusb)" off \
		CURL "Use the real curl library (worked around if no)" on \
		GPGSM "Enable GPGSM (requires LDAP)" off \
		KDNS "Use DNS CERT helper" off \
		STD_SOCKET "Use standard socket for agent" off \
		NLS "National Language Support" off

.include <bsd.port.pre.mk>

.if defined(WITH_PINENTRY)
RUN_DEPENDS+=	pinentry>0:${PORTSDIR}/security/pinentry
.endif

.if defined(WITHOUT_GPGSM)
CONFIGURE_ARGS+=--disable-gpgsm
PLIST_SUB+=	GPGSM="@comment "
.else
RUN_DEPENDS+=	dirmngr:${PORTSDIR}/security/dirmngr
WITH_LDAP=	YES
.undef WITHOUT_LDAP
PLIST_SUB+=	GPGSM=""
.endif

.if defined(WITH_LDAP)
USE_OPENLDAP=	YES
CONFIGURE_ARGS+=--with-ldap=${LOCALBASE}
PLIST_SUB+=	LDAP=""
.else
CONFIGURE_ARGS+=--disable-ldap
PLIST_SUB+=	LDAP="@comment "
.endif

.if defined(WITH_KDNS) && !defined(WITHOUT_KDNS)
LIB_DEPENDS+=	adns:${PORTSDIR}/dns/adns
PLIST_SUB+=	ADNS=""
.else
CONFIGURE_SUB=	-e '/GPGKEYS_KDNS=/s/".*"/""/'
PLIST_SUB+=	ADNS="@comment "
.endif

.if defined(WITH_STD_SOCKET) && !defined(WITHOUT_STD_SOCKET)
CONFIGURE_ARGS+=--enable-standard-socket
.endif

.if defined(WITH_NLS) && !defined(WITHOUT_NLS)
USE_GETTEXT=	YES
CONFIGURE_ARGS+=--enable-nls
PLIST_SUB+=	NLS=""
.else
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+=	NLS="@comment "
.endif

.if defined(WITH_SCDAEMON)
CONFIGURE_ARGS+=--enable-scdaemon
. if ${OSVERSION} < 800069
LIB_DEPENDS+=	usb-0.1:${PORTSDIR}/devel/libusb
. endif
PLIST_SUB+=	SCDAEMON=""
.else
CONFIGURE_ARGS+=--disable-scdaemon
PLIST_SUB+=	SCDAEMON="@comment "
.endif

.if defined(WITHOUT_CURL)
CONFIGURE_ARGS+=--without-libcurl
.else
LIB_DEPENDS+=	curl:${PORTSDIR}/ftp/curl
CONFIGURE_ARGS+=--with-libcurl=${LOCALBASE}
.endif

verify:	checksum
	gpg2 --verify ${DISTDIR}/${DISTNAME}${EXTRACT_SUFX}.sig

post-patch:
	@${REINPLACE_CMD} -e "s@-lpthread@${PTHREAD_LIBS}@g" ${CONFIGURE_SUB} \
		${WRKSRC}/acinclude.m4 ${WRKSRC}/aclocal.m4 ${WRKSRC}/configure
	@${REINPLACE_CMD} -e "/#include <utmp.h>/d" \
		${WRKSRC}/tools/symcryptrun.c

post-install:
	PKG_PREFIX=${PREFIX} ${SH} ${PKGINSTALL} ${PKGNAME} POST-INSTALL
.if defined(WITH_SUID_GPG)
	${CHMOD} u+s ${PREFIX}/bin/gpg2
.endif
	@${CAT} ${PKGMESSAGE}

.include <bsd.port.post.mk>
