#!/bin/sh

ifeq (,$(wildcard $(DART_SDK_ROOT)/chromium/chrome))
$(error DART_SDK_ROOT is set to an invalid location: $(DART_SDK_ROOT))
endif

export CHROME_PATH=$DART_SDK_ROOT/chromium/chrome

$CHROME_PATH --user-data-dir=/home/rwl/.dartium \
  --enable-experimental-web-platform-features --enable-html-imports \
  --no-first-run --no-default-browser-check --no-process-singleton-dialog \
  --flag-switches-begin --enable-nacl --disable-gpu --flag-switches-end \
  chrome://version/
