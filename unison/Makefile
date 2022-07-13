BUILD_DIR=build
PLIST_NAME=camenisch.nicolas.unison.plist

OUT_PLIST=$(BUILD_DIR)/$(PLIST_NAME)
INSTALL_PATH=~/Library/LaunchAgents/$(PLIST_NAME)

UNISONPATH=$(shell which unison)

ifeq ($(UNISONPATH),)
$(error ERROR: Unison not installed)
endif

.PHONY: install
install: $(OUT_PLIST)
	cp $(OUT_PLIST) $(INSTALL_PATH)
	launchctl unload $(INSTALL_PATH)
	launchctl load $(INSTALL_PATH)

$(OUT_PLIST): launchd_template.plist
	mkdir -p $(BUILD_DIR)
	sed "s|###UNISONPATH###|$(UNISONPATH)|g" $^ > $@

