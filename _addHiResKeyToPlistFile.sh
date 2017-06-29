#!/bin/sh

# PURPOSE: add the "Hi-Res" key before the end of the plist file

# `APP_NAME` corresponds to the MacOS app name, such as `HelloWorld.app`
# or `FooBar.app`. This is the same name as the directory
# that’s created under the `release` directory, but without
# the `.app` extension at the end.

APP_NAME=HelloWorld


sed -i '' '/\/dict/i \
<key>NSHighResolutionCapable</key> \
<true/>
' release/${APP_NAME}.app/Contents/Info.plist

