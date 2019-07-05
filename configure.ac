AC_PREREQ(2.60)
AC_INIT([GEMALTO libse-gto],
        [1.7],
        [support@gemalto.com],
        [libse-gto],
        [http://gemalto.com])
AC_CONFIG_SRCDIR([src/log.c])
AC_CONFIG_AUX_DIR([build-aux])
AM_INIT_AUTOMAKE([
        check-news
        foreign
        1.11
        -Wall
        -Wno-portability
        silent-rules
        subdir-objects
])
AC_PROG_CC_C99
AC_CONFIG_MACRO_DIR([m4])
AM_SILENT_RULES([yes])
LT_INIT
AC_PREFIX_DEFAULT([/usr/local])

dnl Check if compiler is clang
AC_MSG_CHECKING([if compiling with clang])
AC_COMPILE_IFELSE(
[AC_LANG_PROGRAM([], [[
#ifndef __clang__
       not clang
#endif
]])],
[CLANG=yes], [CLANG=no])
AC_MSG_RESULT([$CLANG])

AC_LINK_HAVE_VERSION_SCRIPT
AS_IF([test "x$CLANG" = "xyes"], [
       AC_LINK_LDFLAGS_OPTION([-Wl,-dead_strip])
], [
       AC_LINK_LDFLAGS_OPTION([-Wl,--gc-sections])
       AC_LINK_LDFLAGS_OPTION([-Wl,--as-needed])
])

dnl offsetof() defined in stddef.h
AC_MSG_CHECKING([offsetof defined in stddef.h])
AC_COMPILE_IFELSE(
[AC_LANG_PROGRAM([], [[
#include <stddef.h>
struct u { int a; };
(void)offsetof(struct u, a);
]])],
[offsetof=yes], [offsetof=no])
AC_MSG_RESULT([$offsetof])
AS_IF([test "x$offsetof" = "xyes"], [
        AC_DEFINE(HAVE_OFFSETOF, [1], [offsetof defined in stddef.h])
])

AC_LINK_HAVE_VERSION_SCRIPT
AS_IF([test "x$CLANG" = "xyes"], [
       AC_LINK_LDFLAGS_OPTION([-Wl,-dead_strip])
], [
       AC_LINK_LDFLAGS_OPTION([-Wl,--gc-sections])
       AC_LINK_LDFLAGS_OPTION([-Wl,--as-needed])
])

AC_PROG_SED
AC_PROG_MKDIR_P

AC_ARG_ENABLE([logging],
        AS_HELP_STRING([--disable-logging], [disable system logging @<:@default=enabled@:>@]),
        [], enable_logging=yes)
AS_IF([test "x$enable_logging" = "xyes"], [
        AC_DEFINE(ENABLE_LOGGING, [1], [System logging.])
])

AC_ARG_ENABLE([debug],
        AS_HELP_STRING([--disable-debug], [disable debug messages @<:@default=enabled@:>@]),
        [], [enable_debug=yes])
AS_IF([test "x$enable_debug" = "xyes"], [
        AC_DEFINE(ENABLE_DEBUG, [1], [Debug messages.])
])

AC_ARG_ENABLE([gcov],
        AS_HELP_STRING([--enable-gcov], [enable GCC coverage support @<:@default=disable@:>@]),
        [],[enable_gcov=no])
AS_IF([test "x$enable_gcov" = "xyes"], [
       [LIBS+=" -lgcov"]
       [CFLAGS="-g -O0 --no-inline -fprofile-arcs -ftest-coverage"]
       [CXXFLAGS="-g -O0 --no-inline -fprofile-arcs -ftest-coverage"]
])

AC_ARG_VAR(GTODEV, [se_gto device node name @<:@default=/dev/gto@:>@])
AS_IF([test "x$GTODEV" == "x"], [GTODEV=/dev/gto])

AC_DEFINE_UNQUOTED(SE_GTO_GTODEV, ["${GTODEV}"], [Device node to use for se-gto])

my_CFLAGS="\
-Wall \
-Wchar-subscripts \
-Wformat-security \
-Wmissing-declarations \
-Wmissing-prototypes \
-Wnested-externs \
-Wpointer-arith \
-Wshadow \
-Wsign-compare \
-Wstrict-prototypes \
-Wtype-limits \
"
AC_SUBST([my_CFLAGS])

AC_CONFIG_HEADERS(config.h jni/android/config.h) 
AC_CONFIG_FILES([
        Makefile
        src/Makefile
])
AC_REQUIRE_AUX_FILE([tap-driver.sh])
AC_PROG_AWK

AC_OUTPUT
AC_MSG_RESULT([
        $PACKAGE $VERSION
        =====

        prefix:                 ${prefix}
        sysconfdir:             ${sysconfdir}
        libdir:                 ${libdir}
        includedir:             ${includedir}

        compiler:               ${CC}
        cflags:                 ${CFLAGS}
        ldflags:                ${LDFLAGS}

        logging:                ${enable_logging}
        debug:                  ${enable_debug}
        gcov coverage:          ${enable_gcov}
        se-gto node:            ${GTODEV}
])
