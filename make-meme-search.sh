#!/bin/bash
set -euo pipefail
# Render search.html (ghost embedded) to search.png with headless Chrome
google-chrome --headless=new --no-sandbox --disable-gpu --hide-scrollbars --force-device-scale-factor=1 --window-size=1080,1080 --screenshot="$PWD/search.png" "file://$PWD/search.html"
identify search.png
