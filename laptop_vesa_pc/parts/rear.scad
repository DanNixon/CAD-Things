use <SCAD_Lib/BoltAndTabBox.scad>
use <SCAD_Lib/Utils.scad>

include <../config.scad>

module VesaD()
{
  /* VESA D: 100x100 centres, M4 thread */
  PlaceSquareMountingHoles([100, 100])
  {
    circle(d=4.5);
  }
}

module RearPanel()
{
  difference()
  {
    YZPanel2D(box_config);

    VesaD();
  }
}

RearPanel();
