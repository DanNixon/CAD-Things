#!/bin/bash

set -ex

mkdir -p 'build/'

openscad '2.5_inch_hdd.scad' -o 'build/2.5_inch_hdd.stl'
openscad 'blank.scad' -o 'build/blank.stl'
openscad 'blank_2d.scad' -o 'build/blank_2d.dxf'
openscad 'glinet_ar750.scad' -o 'build/glinet_ar750.stl'
openscad 'raspberry_pi_bp_2_3.scad' -o 'build/raspberry_pi_bp_2_3.stl'
