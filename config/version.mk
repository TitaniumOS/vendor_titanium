# Versioning System
TITANIUM_BUILD_VERSION = 3.0
TITANIUM_CODENAME = Ionizer
TITANIUM_BUILD_TYPE ?= UNOFFICIAL
TITANIUM_BUILD_VARIANT ?= VANILLA
TITANIUM_BUILD_MAINTAINER ?= Unofficial maintainer
TITANIUM_BUILD_DONATE_URL ?= https://www.paypal.me/Sonal18
TITANIUM_BUILD_SUPPORT_URL ?= https://t.me/TitaniumOS_Chat

# Titanium Release
ifeq ($(TITANIUM_BUILD_TYPE), OFFICIAL)
  OFFICIAL_DEVICES = $(shell cat vendor/titanium/titanium.devices)
  FOUND_DEVICE =  $(filter $(TITANIUM_BUILD), $(OFFICIAL_DEVICES))
    ifeq ($(FOUND_DEVICE),$(TITANIUM_BUILD))
      TITANIUM_BUILD_TYPE := OFFICIAL
    else
      TITANIUM_BUILD_TYPE := UNOFFICIAL
      $(error Device is not official "$(TITANIUM_BUILD)")
    endif
endif

ifeq ($(WITH_GMS), true)
TITANIUM_BUILD_VARIANT := GAPPS
endif

# System version
TARGET_PRODUCT_SHORT := $(subst titanium_,,$(TITANIUM_BUILD_TYPE))

TITANIUM_DATE_YEAR := $(shell date -u +%Y)
TITANIUM_DATE_MONTH := $(shell date -u +%m)
TITANIUM_DATE_DAY := $(shell date -u +%d)
TITANIUM_DATE_HOUR := $(shell date -u +%H)
TITANIUM_DATE_MINUTE := $(shell date -u +%M)

TITANIUM_BUILD_DATE := $(TITANIUM_DATE_YEAR)$(TITANIUM_DATE_MONTH)$(TITANIUM_DATE_DAY)-$(TITANIUM_DATE_HOUR)$(TITANIUM_DATE_MINUTE)
TITANIUM_BUILD_FINGERPRINT := TitaniumOS/$(TITANIUM_VERSION)/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(TITANIUM_BUILD_DATE)
TITANIUM_VERSION := TitaniumOS-$(PLATFORM_VERSION)-$(TITANIUM_CODENAME)-v$(TITANIUM_BUILD_VERSION)-$(TITANIUM_BUILD)-$(TITANIUM_BUILD_VARIANT)-$(TITANIUM_BUILD_TYPE)-$(TITANIUM_BUILD_DATE)

PRODUCT_GENERIC_PROPERTIES += \
  ro.titanium.device=$(TITANIUM_BUILD) \
  ro.titanium.version=$(TIANIUM_VERSION) \
  ro.titanium.build.version=$(TITANIUM_BUILD_VERSION) \
  ro.titanium.build.variant=$(TITANIUM_BUILD_VARIANT) \
  ro.titanium.build.type=$(TITANIUM_BUILD_TYPE) \
  ro.titanium.build.date=$(TITANIUM_BUILD_DATE) \
  ro.titanium.build.fingerprint=$(TITANIUM_BUILD_FINGERPRINT) \
  ro.titanium.build.maintainer=$(TITANIUM_BUILD_MAINTAINER) \
  ro.titanium.build.donate_url=$(TITANIUM_BUILD_DONATE_URL) \
  ro.titanium.build.support_url=$(TITANIUM_BUILD_SUPPORT_URL) \
  ro.titanium.build_codename=$(TITANIUM_CODENAME)
