#!/bin/bash -xe

if [ $# -ne 2 ]; then
  echo "Usage:  ./export.sh \$BADGE \$SIZE"
  exit 1
fi

badge=$1
size=$2


# cleanup from our last run
rm -f badge.png badge-shape.png badge.dat badge-shape.dat badge.stl

# Kick it off
inkscape --export-png=badge.png --export-width=$size --export-height=$size  ../svgs/$badge.svg
inkscape --export-png=badge-shape.png --export-width=$size --export-height=$size  ../svgs/badge-shape.svg
python png2heightmap.py badge.png > badge.dat
python png2heightmap.py badge-shape.png > badge-shape.dat
openscad badge.scad -o badge.stl
admesh --translate=0,0,0 --write-binary-stl=../stls/$badge.stl badge.stl
echo "Done with ../stls/$badge.stl"

# and.. cleanup.
rm -f badge.png badge-shape.png badge.dat badge-shape.dat badge.stl
