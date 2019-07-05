# libse-gto
Thales Secure Element – APDU T=1 over SPI library

This library is designed to be used with Thales Secure Element. It encapsulates SPI communication protocol used between a device application and the Secure Element, allowing an easy integration of Thales eSE into devices.


## Build

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
  
  ## License
  
This product includes software developed at Gemalto a Thales Company (http://www.gemalto.com)
Source code is covered by Gemalto License described in LICENSE file.

NOTICE and LICENSE files shall remain with source code of Gemalto a Thales Company.
