LOCAL_PATH := $(call my-dir)

# clock_gettime from rt library is a builtin in bionic libc

my_CFLAGS := \
      -include $(LOCAL_PATH)/android/config.h \
      -include $(LOCAL_PATH)/android/config.gto.h \
      -std=gnu99 \
      -Wall \
      -Wchar-subscripts \
      -Wformat-security \
      -Wmissing-declarations \
      -Wmissing-prototypes \
      -Wpointer-arith \
      -Wsign-compare \
      -Wstrict-prototypes \
      -Wtype-limits \
      -fvisibility=hidden \
      -ffunction-sections \
      -fdata-sections

libse_gto_SOURCES :=       \
      ../src/libse-gto.c   \
      ../src/iso7816_t1.c \
      ../src/checksum.c   \
      ../src/transport.c  \
      ../src/spi.c        \
      ../src/log.c

xtra_STATIC_LIBRARIES :=

include $(CLEAR_VARS)
LOCAL_MODULE     := se-gto
LOCAL_C_INCLUDES := $(LOCAL_PATH)/../src
LOCAL_SRC_FILES  := $(libse_gto_SOURCES)
LOCAL_CFLAGS     := $(my_CFLAGS)
LOCAL_STATIC_LIBRARIES := $(extra_STATIC_LIBRARIES)
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE     := se-gto-static
LOCAL_C_INCLUDES := $(LOCAL_PATH)/../src
LOCAL_SRC_FILES  := $(libse_gto_SOURCES)
LOCAL_CFLAGS     := $(my_CFLAGS)
LOCAL_STATIC_LIBRARIES := $(extra_STATIC_LIBRARIES)
include $(BUILD_STATIC_LIBRARY)

$(call import-module,android/cpufeatures)
