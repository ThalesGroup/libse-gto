
Android:
    $ ndk-build

    Check if warnings exist on other architecture: ndk-build APP_ABI=all

Android using clang compilers:
    $ ndk-build NDK_TOOLCHAIN_VERSION=clang

Android using clang analyzer:
    $ ndk-build NDK_TOOLCHAIN_VERSION=clang NDK_ANALYZER=1 APP_ABI=armeabi

    APP_ABI avoid to run analyzer for each architecture. This is the same
    analyzer each time.

Running shared library on host:

    $ ./autogen.sh && ./configure
    $ make check
	$ cp src/.libs/libse-gto.so