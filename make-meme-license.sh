#!/bin/bash
set -euo pipefail
# Render license.html (ghost embedded) to license.png with headless Chrome
google-chrome --headless=new --no-sandbox --disable-gpu --hide-scrollbars --force-device-scale-factor=1 --window-size=1080,1080 --screenshot="$PWD/license.png" "file://$PWD/license.html"
identify license.png
