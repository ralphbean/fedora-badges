#!/bin/python
from __future__ import print_function
import sys
import png

image = png.Reader(sys.argv[1])

width, height, pixels, metadata = image.asRGBA()

for row in pixels:
    for pixel in range(0, width*4, 4):
        gray = (row[pixel] + row[pixel+1] + row[pixel+2]) / 3
        norm = (gray-127.5)/255.0
        print(' ', end='')
        print(norm, end='')
    print()
