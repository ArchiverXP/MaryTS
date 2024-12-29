TARGET := iphone:clang:14.5:14.0

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = STChanger

STChanger_FILES = SMSRootListController.m
STChanger_FRAMEWORKS = UIKit
STChanger_PRIVATE_FRAMEWORKS = Preferences
STChanger_INSTALL_PATH = /Library/PreferenceBundles
STChanger_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk
