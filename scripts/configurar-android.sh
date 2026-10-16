#!/usr/bin/env bash
set -euo pipefail
M=android/app/src/main/AndroidManifest.xml
test -f "$M"
grep -q 'android.permission.CAMERA' "$M" || \
  sed -i 's#<application#<uses-permission android:name="android.permission.CAMERA" />\n\n    <application#' "$M"
grep -q 'com.google.mlkit.vision.DEPENDENCIES' "$M" || \
  sed -i 's#</application>#    <meta-data android:name="com.google.mlkit.vision.DEPENDENCIES" android:value="barcode_ui" />\n    </application>#' "$M"
echo "AndroidManifest configurado:"
grep -n 'CAMERA\|mlkit' "$M"
