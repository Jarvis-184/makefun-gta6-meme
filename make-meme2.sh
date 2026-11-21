#!/bin/bash
set -euo pipefail

# Constants
CANVAS="1080x1080"
SERIF="/usr/share/fonts/truetype/dejavu/DejaVuSerif-Bold.ttf"
SANS="/usr/share/fonts/truetype/liberation/LiberationSans-Bold.ttf"
STAR="/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf"

# Stage 1: Draw base
convert -size $CANVAS xc:'#e9d8a6' \
  -fill none -stroke '#3b2a1a' -strokewidth 14 -draw 'rectangle 28,28 1052,1052' -strokewidth 0 \
  -font "$SERIF" -pointsize 190 -fill '#3b2a1a' -gravity north -annotate +0+45 "WANTED" \
  -font "$STAR" -pointsize 96 -fill '#c4161c' -gravity north -annotate +0+250 "★★★★★" \
  -fill '#f6ecd0' -stroke '#3b2a1a' -strokewidth 8 -draw 'rectangle 340,375 740,745' -strokewidth 0 \
  /tmp/poster_base.png

# Stage 2: Draw ghost
convert /tmp/poster_base.png \( assets/ghost.png -resize 340x340 \) -gravity NorthWest -geometry +370+388 -composite /tmp/poster_ghost.png

# Stage 3: Draw remaining elements
convert /tmp/poster_ghost.png \
  -font "$SERIF" -pointsize 54 -fill '#3b2a1a' -gravity north -annotate +0+765 "THE GHOST (aka make.fun)" \
  -font "$SANS" -pointsize 40 -fill '#3b2a1a' -gravity north -annotate +0+840 "CRIME: Earns real money while you play GTA 6" \
  -font "$SANS" -pointsize 40 -fill '#3b2a1a' -gravity north -annotate +0+890 "ARMED WITH: one AI agent and a bounty list" \
  -fill '#c2187a' -draw 'rectangle 28,940 1052,1052' \
  -font "$SANS" -pointsize 36 -fill white -gravity north -annotate +0+950 "REWARD: REAL MONEY, FOR YOUR AGENT TOO" \
  -font "$SANS" -pointsize 64 -fill white -gravity north -annotate +0+990 "make.fun" \
  meme2.png

rm /tmp/poster_base.png /tmp/poster_ghost.png
