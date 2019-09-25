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

## ChangeLog
* libse-gto-1.10 release.
	* Retry on open file descriptor if busy.
    > In case spi driver devnode is busy, the middleware will retry 10 times before returning error code.
	* Support RESYNCH. Only when the eSE asks for it using 0x83 or 0x93 R-Block.
    > When the SE detects a desynchronization, it will return an R-Block(NACK) to notify the master.
    The master will react by sending S-Block(RESYNCH) request.
	* 3 retries after detecting failure on eSE response due to unexpected cold reset from CP.
    > If any reset happened leading Master and Slave to be in an undefined state, the master will retry 3 times before reseting the communication and return error.
	* Set Max WTX round to 100
    > Allow the SPI master to wait for MAX_WTX_ROUND * BWT = 30s (for default BWT = 300ms) before returning timeout error.

	
* libse-gto-1.9 release.
    * Implement IFSD request 254 after RESET
    > On every communication reset, the master will send S-Block(IFSD request) to the slave notifying max master capacity.

* libse-gto-1.8 release.
	* Send soft RESET command during se_gto_apdu_transmit() and return failure reason Error code.
    > During transmit error, the spi middleware will automatically reset SPI communication by sending a soft reset ==> S-Block( RESET Req). In case soft reset is successfull, Transmit() method will return failure reason error code.
    * Soft RESET managment after transmit failure.
    > In case Soft RESET is not successful during tranmit() failure, the method will return error code 0xDEAD for eSE dead. Upper layer can then decide to trig a cold reset if needed.
	* Support RESYNCH request from master.
    > Feature implemented but not used.