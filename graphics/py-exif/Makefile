# New ports collection makefile for:	py-exif
# Date created:		30 January 2001
# Whom:	      		Johann Visagie <wjv@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	exif
PORTVERSION=	0.9
PORTREVISION=	1
CATEGORIES=	graphics python
MASTER_SITES=	SF/py${PORTNAME}/py${PORTNAME}/${PORTVERSION}
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	pyexif-${PORTVERSION}

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Python library to extract EXIF metadata from JPEG and TIFF image files

USE_PYTHON=	yes
WRKSRC=		${WRKDIR}/pyexif
DATADIR=	${PREFIX}/share/py-exif
DOCSDIR=	${PREFIX}/share/doc/py-exif

post-patch:
.for pyfile in exiftool exifinfo.py
	@ cd ${WRKSRC}/bin && ${MV} ${pyfile} ${pyfile}.orig && \
	  ${SED} -e '1s|.*|#!${PYTHON_CMD}|' ${pyfile}.orig > ${pyfile}
.endfor

do-build:
	@ ${PYTHON_CMD} ${PYTHON_LIBDIR}/compileall.py ${WRKSRC}/lib
	@ ${PYTHON_CMD} -O ${PYTHON_LIBDIR}/compileall.py ${WRKSRC}/lib

do-install:
	@ ${MKDIR} ${PREFIX}/bin
	@ cd ${WRKSRC}/lib && ${INSTALL_DATA} *.py *.pyc *.pyo \
	  ${PYTHON_SITELIBDIR}
	@ ${INSTALL_SCRIPT} ${WRKSRC}/bin/exiftool ${PREFIX}/bin/py-exiftool
	@ ${MKDIR} ${DATADIR}
	@ cd ${WRKSRC}/share/exiftool && ${INSTALL_DATA} *.html *.txt \
	  ${DATADIR}

post-install:
.if !defined(NOPORTDOCS)
	@ ${MKDIR} ${DOCSDIR}
	@ ${INSTALL_DATA} ${WRKSRC}/README* ${DOCSDIR}
.endif

.include <bsd.port.mk>
