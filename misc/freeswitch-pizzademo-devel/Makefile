# Ports collection makefile for:	freeswitch-pizzademo-devel
# Date created:				September 2012
# Whom:					Richard Neese <r.neese@gmail.com>
#
# $FreeBSD$
#

PORTNAME=	freeswitch
DISTVERSION=	1.2.rc2
CATEGORIES=	misc
MASTER_SITES=	http://files.freeswitch.org/
PKGNAMESUFFIX=	-pizzademo-devel
DISTFILES=	${PORTNAME}-${DISTVERSION}.tar.bz2 \
		pizza_gram.tar.gz \
		pizza_sounds.tar.gz
DIST_SUBDIR=	${PORTNAME}

MAINTAINER=	r.neese@gmail.com
COMMENT=	FreeSwitch pizza demo

RUN_DEPENDS=	freeswitch:${PORTSDIR}/net/freeswitch-core-devel

CONFLICTS=	freeswitch-pizzademo-[0-9]*

NO_BUILD=	yes

WRKSRC=	${WRKDIR}/${PORTNAME}-${DISTVERSION}/scripts/javascript

SHAREOWN=	${PORTNAME}
SHAREGRP=	${SHAREOWN}

pre-install:
	@${REINPLACE_CMD} -e 's|include("js_modules/SpeechTools.jm")|include("javascript/js_modules/SpeechTools.jm")|g' ${WRKSRC}/ps_pizza.js
	@${REINPLACE_CMD} -e 's|asr.setAudioBase("/root/pizza)|asr.setAudioBase("${DATADIR}/sounds/pizza-demo/8000")|g' ${WRKSRC}/ps_pizza.js

do-install:
	${MKDIR} ${ETCDIR}/grammar ${DATADIR}/sounds/pizza-demo/8000
	${INSTALL_DATA} ${WRKDIR}/*.gram ${ETCDIR}/grammar/
	${INSTALL_DATA} ${WRKDIR}/pizza/*.wav ${DATADIR}/sounds/pizza-demo/8000/
	${TOUCH} ${DATADIR}/sounds/.pizza
	${MKDIR} ${ETCDIR}/scripts/javascript
	${INSTALL_DATA} ${WRKSRC}/ps_pizza.js \
		${ETCDIR}/scripts/javascript
	(cd ${WRKSRC} && ${COPYTREE_SHARE} js_modules \
		${ETCDIR}/scripts/javascript)

.include <bsd.port.mk>
