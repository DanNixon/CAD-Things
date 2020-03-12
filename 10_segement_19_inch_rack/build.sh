#!/bin/bash

set -ex

mkdir -p 'build/'

openscad 'blank.scad' -o 'build/blank.stl'
openscad 'blank_2d.scad' -o 'build/blank_2d.dxf'
openscad 'raspberry_pi_bp_2_3.scad' -o 'build/raspberry_pi_bp_2_3.stl'
