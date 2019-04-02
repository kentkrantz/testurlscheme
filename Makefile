THEOS = /opt/theos
THEOS_DEVICE_IP = 192.168.2.233

include $(THEOS)/makefiles/common.mk

APPLICATION_NAME = testurlscheme
testurlscheme_FILES = main.m XXAppDelegate.m XXRootViewController.m
testurlscheme_FRAMEWORKS = UIKit CoreGraphics

include $(THEOS_MAKE_PATH)/application.mk

after-install::
	install.exec "killall \"testurlscheme\"" || true
