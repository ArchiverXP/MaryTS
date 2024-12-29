THEOS_DEVICE_IP = 192.168.0.118

ifeq ($(THEOS_PACKAGE_SCHEME),rootless)
      ARCHS = arm64 arm64e
      TARGET = iphone:clang:latest:15.0
  else
      ARCHS = arm64 arm64e
      TARGET := iphone:clang:14.5:14.0
endif


INSTALL_TARGET_PROCESSES = Twitter X


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = MaryTS

MaryTS_FILES = Tweak.x
MaryTS_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += STChanger
include $(THEOS_MAKE_PATH)/aggregate.mk
