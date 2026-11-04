#!/bin/sh
set -e
cd "$(dirname "$0")"
mkdir -p pwa

# Usage: render <output> <canvas size> <logo size>
render() {
  rsvg-convert -w "$3" -h "$3" runelink_logo_white.svg |
    magick png:- -background black -alpha remove -alpha off \
      -gravity center -extent "$2x$2" "PNG24:pwa/$1"
}

render icon-192.png 192 164
render icon-512.png 512 436
render apple-touch-icon.png 180 154
# Android launchers can crop maskable icons as tight as the center 80% circle, so keep the logo well inside it.
render icon-maskable-512.png 512 346
