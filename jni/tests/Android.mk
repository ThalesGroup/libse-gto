LOCAL_PATH := $(call my-dir)
TESTS_PATH := ../../tests
SRC_PATH := ../../src

include $(CLEAR_VARS)

LOCAL_MODULE     := se-gto-tests
LOCAL_CFLAGS     := $(my_CFLAGS)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/$(SRC_PATH)
LOCAL_SRC_FILES  :=                    \
        $(TESTS_PATH)/fake_transport.c \
        $(TESTS_PATH)/tapc.c           \
        $(TESTS_PATH)/check.c          \
        $(SRC_PATH)/iso7816_t1.c       \
        $(SRC_PATH)/checksum.c

ifeq ($(strip $(CODE_COVERAGE)),true)
LOCAL_CFLAGS  := $(LOCAL_CFLAGS) -fprofile-arcs -ftest-coverage
LOCAL_LDFLAGS := --coverage
endif

include $(BUILD_EXECUTABLE)
