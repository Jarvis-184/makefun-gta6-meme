#!/bin/bash
set -euo pipefail
# Render wrapped.html (ghost embedded) to wrapped.png with headless Chrome
google-chrome --headless=new --no-sandbox --disable-gpu --hide-scrollbars --force-device-scale-factor=1 --window-size=1080,1080 --screenshot="$PWD/wrapped.png" "file://$PWD/wrapped.html"
identify wrapped.png
