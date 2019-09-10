
Android:
    $ ndk-build

    Check if warnings exist on other architecture: ndk-build APP_ABI=all

Android using clang compilers:
    $ ndk-build NDK_TOOLCHAIN_VERSION=clang

Android using clang analyzer:
    $ ndk-build NDK_TOOLCHAIN_VERSION=clang NDK_ANALYZER=1 APP_ABI=armeabi

    APP_ABI avoid to run analyzer for each architecture. This is the same
    analyzer each time.


Running tests on host:

    $ ./autogen.sh && ./configure
    $ make check

Running tests on host with code coverage

    $ ./autogen.sh && ./configure --enable-gcov
    $ make check

    If lcov is installed:

    $ make coverage-html

    Because gcov accumulate coverage, run tests again cleaning previous
    coverage:

    $ lcov -z -d . && make check; make coverage-html

Running tests on Android device:

    $ ndk-build APP_MODULES=se-gto-tests APP_OPTIM=debug APP_ABI=arm64-v8a
    $ adb push libs/arm64-v8a/se-gto-tests /data/local/tmp
    $ adb shell /data/local/tmp/se-gto-tests

Running tests with code coverage on Android device
(host installation of LLVM 3.9 used):

    $ ndk-build APP_MODULES=se-gto-tests APP_OPTIM=debug APP_ABI=arm64-v8a CODE_COVERAGE=true
    $ adb push libs/arm64-v8a/se-gto-tests /data/local/tmp
    $ adb shell rm -fr /data/local/tmp/cov
    $ adb shell GCOV_PREFIX=/data/local/tmp/cov /data/local/tmp/se-gto-tests
    $ adb pull /data/local/tmp/cov /
    $ echo -e '#!/bin/sh\nexec llvm-cov-3.9 gcov $*' >/tmp/llvm-gcov
    $ chmod a+x /tmp/llvm-gcov
    $ lcov --capture --directory obj/local/arm64-v8a/objs-debug/se-gto-tests/__/__/src \
            --gcov-tool /tmp/llvm-gcov \
            -o /tmp/coverage.info
    $ genhtml -o cov-aarch64 -t "SE GTO Code coverage AARCH64" /tmp/coverage.info
