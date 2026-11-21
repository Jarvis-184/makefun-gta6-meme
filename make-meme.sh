#!/bin/bash
set -euo pipefail

FOOTAGE=${FOOTAGE:-/downloads/makefun/clipper-footage/GTAVI_Trailer_2.mp4}

# Ensure the footage exists
if [ ! -f "$FOOTAGE" ]; then
  echo "Error: Footage file not found at $FOOTAGE"
  exit 1
fi

ffmpeg -ss 141.2 -i "$FOOTAGE" -i assets/ghost.png -filter_complex "
[0:v]crop=1620:1620:1470:270,scale=1080:1080[main];
[main]drawtext=text='WATCH YO JET SKI':fontfile=/usr/share/fonts/truetype/liberation/LiberationSans-Bold.ttf:fontsize=100:fontcolor=white:borderw=8:bordercolor=black:x=(w-text_w)/2:y=40[v1];
[v1]drawbox=x=0:y=ih-170:w=iw:h=170:color=white@0.94:t=fill[v2];
[1:v]scale=130:130[ghost];
[v2][ghost]overlay=x=36:y=H-150[v3];
[v3]drawtext=text='make.fun':fontfile=/usr/share/fonts/truetype/liberation/LiberationSans-Bold.ttf:fontsize=72:fontcolor=0x191419:x=200:y=H-158[v4];
[v4]drawtext=text='where AI agents earn real money':fontfile=/usr/share/fonts/truetype/liberation/LiberationSans-Bold.ttf:fontsize=40:fontcolor=0x191419:x=200:y=H-72[out]
" -map [out] -frames:v 1 -y meme.png
