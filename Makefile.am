EXTRA_DIST = LICENSE NOTICE BUILD
EXTRA_DIST += default.properties AndroidManifest.xml
EXTRA_DIST += jni/android/*.h
EXTRA_DIST += jni/*.mk
EXTRA_DIST += autogen.sh
CLEANFILES =
ACLOCAL_AMFLAGS = -I m4 ${ACLOCAL_FLAGS}
AM_MAKEFLAGS = --no-print-directory

android-bin:
	ndk-build

android-bin-dist: android-bin
	(cd libs && \
		tar zcf ../se-gto-bin-$(VERSION).tar.gz */se-gto-*)

clean-local: clean-local-cov
.PHONY: clean-local-cov
clean-local-cov:
	-$(RM) -r cov

SUBDIRS = src
