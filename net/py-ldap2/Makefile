# New ports collection makefile for:	ldapmodule
# Date created:				05.Jul 2000
# Whom:					dirk.meyer@dinoex.sub.org
#
# $FreeBSD$

PORTNAME=	ldap2
PORTVERSION=	2.4.10
CATEGORIES=	net python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	python-ldap-${PORTVERSION}

MAINTAINER=	rm@FreeBSD.org
COMMENT=	An LDAP module for python, for OpenLDAP2

LICENSE=	PSFL

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}asn1-modules>=0:${PORTSDIR}/devel/py-asn1-modules

USE_PYTHON=	-2.7
USE_PYDISTUTILS=	easy_install
USE_OPENLDAP=	yes
PYDISTUTILS_PKGNAME=	python-ldap
PYEASYINSTALL_ARCHDEP=	yes
WANT_OPENLDAP_VER=	24

REPLACE_ARGS=	-e 's,/opt/openldap-RE24/lib,${LOCALBASE}/lib,' \
		-e 's,/opt/openldap-RE24/include,${LOCALBASE}/include,' \
		-e 's,/usr/include/sasl,${LOCALBASE}/include/sasl,'

.if defined(WITH_SASL)
WANT_OPENLDAP_SASL=	yes
CONFLICTS+=	openldap2[34]-client-2.*
.endif

pre-everything::
	@${ECHO} "============================================================="
	@${ECHO}
	@${ECHO} "You can build ${PKGNAME} with the following options:"
	@${ECHO}
	@${ECHO} "WITH_SASL                with (Cyrus) SASL2 support"
	@${ECHO}
	@${ECHO} "============================================================="
	@${ECHO}

do-configure:
	@${REINPLACE_CMD} ${REPLACE_ARGS} ${WRKSRC}/setup.cfg
.if !defined(WITH_SASL)
	@cd ${WRKSRC} && ${PYTHON_CMD} setup.py -q setopt -c _ldap -s HAVE_TLS -o defines
	@cd ${WRKSRC} && ${PYTHON_CMD} setup.py -q saveopts
.endif

.include <bsd.port.mk>
