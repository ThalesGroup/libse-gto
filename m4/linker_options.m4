AC_DEFUN([AC_LINK_LDFLAGS_OPTION],
[AC_LANG_PUSH([C])
oldldflags="$LDFLAGS"
ldflags_option="$1"
LDFLAGS="$LDFLAGS $ldflags_option"
AC_MSG_CHECKING([for linker support $1])
AC_LINK_IFELSE([AC_LANG_PROGRAM([[]],[[]])],
        [AC_MSG_RESULT([yes])]
        [AM_LDFLAGS+=" $1"],
        [AC_MSG_RESULT([no])])
LDFLAGS="$oldldflags"
AC_LANG_POP([C])
AC_SUBST([AM_LDFLAGS])
])


AC_DEFUN([AC_LINK_HAVE_VERSION_SCRIPT],
[AC_CACHE_CHECK([for compiler -Wl,--version-script option],
                 [ac_cv_linker_option_version_script],
[ AC_LANG_PUSH([C])
  oldldflags="$LDFLAGS"
  : ${TMPDIR=/tmp}
  {
        tmp=`(umask 077 && mktemp -d "$TMPDIR/fooXXXXXX") 2>/dev/null` &&
          test -n "$tmp" && test -d "$tmp"
  } || {
        tmp=$TMPDIR/foo$$-$RANDOM
        (umask 077 && mkdir "$tmp")
  } || exit $?

  echo "{" > "$tmp/export.map"
  echo "  global: main;" >> "$tmp/export.map"
  echo "  local: *;" >> "$tmp/export.map"
  echo "};" >> "$tmp/export.map"

  LDFLAGS="$LDFLAGS -Wl,--version-script=$tmp/export.map"
  AC_LINK_IFELSE([AC_LANG_PROGRAM([[]],[[]])],
                 [ac_cv_linker_option_version_script=yes],
                 [ac_cv_linker_option_version_script=no])
        rm "$tmp/export.map"
        rmdir "$tmp"
  LDFLAGS="$oldldflags"
  AC_LANG_POP([C])
])
AM_CONDITIONAL(HAVE_LINK_VERSION_SCRIPT,
               [test x$ac_cv_linker_option_version_script = xtrue])
])
