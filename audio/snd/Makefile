# New ports collection makefile for:	snd
# Date created:				2000-10-05
# Whom:					trevor
#
# $FreeBSD$
#

PORTNAME=	snd
PORTVERSION=	12.11
PORTREVISION=	1
CATEGORIES=	audio
MASTER_SITES=	ftp://ccrma-ftp.stanford.edu/pub/Lisp/ \
		http://mirror.mcx2.org/

MAINTAINER=	dhn@FreeBSD.org
COMMENT=	Multitracking sound editor and utilities

OPTIONS=	ESD	"Use Enlightened Sound Daemon"		on  \
		FFTW3	"Use FFTW"				on  \
		GSL	"Use GNU Scientific Library"		on  \
		GUILE	"Use Guile as the extension language"	on  \
		S7	"Use S7 as the extension language"	off  \
		LADSPA	"Include support for LADSPA plugins"	on  \
		MOTIF	"Make Snd with Motif graphics support"	off \
		GTK2	"Make Snd with Gtk+ graphics support"	on \
		X11	"Make Snd with GUI support"	on

WANT_GNOME=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-float-samples
MAKEFILE=	makefile
ALL_TARGET=	snd snd-info sndplay
MAKE_JOBS_UNSAFE=	yes

MAN1=		snd.1

CFLAGS+=	-I${LOCALBASE}/include
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

.include <bsd.port.pre.mk>

.if ${ARCH} == "sparc64"
BROKEN=		does not compile on sparc64
.endif

.if !defined(WITHOUT_ESD)
USE_GNOME+=	esound
CONFIGURE_ARGS+=	--with-esd
.endif

.if !defined(WITHOUT_FFTW3)
LIB_DEPENDS+=	fftw3:${PORTSDIR}/math/fftw3
.else
CONFIGURE_ARGS+=	--without-fftw
.endif

.if !defined(WITHOUT_GSL)
LIB_DEPENDS+=	gsl.16:${PORTSDIR}/math/gsl
.else
CONFIGURE_ARGS+=	--without-gsl
.endif

.if !defined(WITHOUT_GUILE)
CONFIGURE_ARGS+=	--with-guile
LIB_DEPENDS+=	guile.21:${PORTSDIR}/lang/guile
PLIST_SUB+=	SCHEME=""
.else
CONFIGURE_ARGS+=	--without-guile
.endif

.if !defined(WITHOUT_S7)
CONFIGURE_ARGS+=	--with-s7
PLIST_SUB+=	SCHEME=""
.else
CONFIGURE_ARGS+=	--without-s7
.endif

.if !defined(WITHOUT_LADSPA)
BUILD_DEPENDS+=	${LOCALBASE}/include/ladspa.h:${PORTSDIR}/audio/ladspa
RUN_DEPENDS+=	${LOCALBASE}/include/ladspa.h:${PORTSDIR}/audio/ladspa
.else
CONFIGURE_ARGS+=	--without-ladspa
.endif

.if defined(WITH_GTK2)
USE_GNOME+=	gtk20
CONFIGURE_ARGS+=	--with-gtk
PLIST_SUB+=	X11=""
.endif
.if defined(WITH_MOTIF)
USE_MOTIF=	yes
CONFIGURE_ARGS+=	--with-motif
PLIST_SUB+=	X11=""
.endif

.if defined(WITHOUT_X11)
CONFIGURE_ARGS+=	--with-no-gui
PLIST_SUB+=	X11="@comment "
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|^ _Complex| Vaiolate _Complex|g ; \
		 s|-O2 -I|-I|g ; \
		 s|LDFLAGS -ldl|LDFLAGS|g' ${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's|^sndinfo:|snd-info:|g ; \
		 s|-o sndinfo|-o snd-info|g' ${WRKSRC}/makefile.in

do-install:
.for i in snd snd-info sndplay
	${INSTALL_PROGRAM} ${WRKSRC}/${i} ${PREFIX}/bin
.endfor
	${INSTALL_MAN} ${WRKSRC}/snd.1 ${MANPREFIX}/man/man1/
.if !defined(WITHOUT_GUILE)
	@${MKDIR} ${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/*.scm ${DATADIR}
	@${MKDIR} ${DATADIR}/tools
	${INSTALL_DATA} ${WRKSRC}/tools/*.scm ${DATADIR}/tools
	@${MKDIR} ${DATADIR}/sndins/samples
	${INSTALL_DATA} ${WRKSRC}/sndins/samples/*.scm ${DATADIR}/sndins/samples
.endif
.if !defined(WITHOUT_GAUCHE)
	@${MKDIR} ${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/*.scm ${DATADIR}
	@${MKDIR} ${DATADIR}/tools
	${INSTALL_DATA} ${WRKSRC}/tools/*.scm ${DATADIR}/tools
	@${MKDIR} ${DATADIR}/sndins/samples
	${INSTALL_DATA} ${WRKSRC}/sndins/samples/*.scm ${DATADIR}/sndins/samples
.endif
.if !defined(WITHOUT_S7)
	@${MKDIR} ${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/*.scm ${DATADIR}
	@${MKDIR} ${DATADIR}/tools
	${INSTALL_DATA} ${WRKSRC}/tools/*.scm ${DATADIR}/tools
	@${MKDIR} ${DATADIR}/sndins/samples
	${INSTALL_DATA} ${WRKSRC}/sndins/samples/*.scm ${DATADIR}/sndins/samples
.endif
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for i in HISTORY.Snd README.Snd
	${INSTALL_DATA} ${WRKSRC}/${i} ${DOCSDIR}
.endfor
	${INSTALL_DATA} ${WRKSRC}/*.html ${DOCSDIR}
	@${MKDIR} ${DOCSDIR}/pix
	${INSTALL_DATA} ${WRKSRC}/pix/*.png ${DOCSDIR}/pix
	cd ${WRKSRC} && ${PAX} -r -w tutorial ${DOCSDIR}
.endif
.if !defined(NOPORTEXAMPLES)
	@${MKDIR} ${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/DotEmacs ${EXAMPLESDIR}
.endif

.include <bsd.port.post.mk>
