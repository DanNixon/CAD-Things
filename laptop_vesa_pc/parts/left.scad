use <SCAD_Lib/BoltAndTabBox.scad>
use <../modules/motherboard.scad>
include <../config.scad>

module LeftPanel()
{
  difference()
  {
    XZPanel2D(box_config);

    d = 3;

    translate([-3 + d, 0])
    {
      square([12, 190], center=true);
    }

    translate([5 + d, 65])
    {
      square([15, 60], center=true);
    }
  }
}


LeftPanel();
