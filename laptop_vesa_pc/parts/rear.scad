use <SCAD_Lib/BoltAndTabBox.scad>
use <SCAD_Lib/Utils.scad>

use <../modules/motherboard.scad>

include <../config.scad>

module VesaD()
{
  /* VESA D: 100x100 centres, M4 thread */
  PlaceSquareMountingHoles([100, 100])
  {
    circle(d=4.5);
  }
}

module PowerJackCutout()
{
  for (x = [-12.5, 12.5])
  {
    translate([x, 0, 0])
    {
      circle(d=3.5);
    }
  }

  translate([0, -4])
  {
    square([16, 10], center=true);
  }
}

module RearPanel()
{
  difference()
  {
    YZPanel2D(box_config);

    VesaD();

    translate([110, 90])
    {
      rotate([0, 0, 90])
      {
        PowerJackCutout();
      }
    }

    translate(motherboard_pos)
    {
      MotherboardDifference();
    }
  }
}

RearPanel();
