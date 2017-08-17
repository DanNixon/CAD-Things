use <SCAD_Lib/Washers.scad>
include <../config.scad>

module Washers()
{
  WasherMatrix(5, 3, ASSEMBLY_HOLE_DIAMETER, ASSEMBLY_HOLE_DIAMETER * 1.8);
}

Washers();
