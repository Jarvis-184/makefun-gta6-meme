#!/bin/bash
set -euo pipefail
# Render loading.html (ghost embedded) to loading.png with headless Chrome
google-chrome --headless=new --no-sandbox --disable-gpu --hide-scrollbars --force-device-scale-factor=1 --window-size=1080,1170 --screenshot="$PWD/loading-raw.png" "file://$PWD/loading.html"
convert loading-raw.png -crop 1080x1080+0+0 +repage loading.png
identify loading.png
