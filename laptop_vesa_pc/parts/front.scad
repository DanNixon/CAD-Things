use <SCAD_Lib/BoltAndTabBox.scad>
use <../modules/display.scad>
include <../config.scad>

module FrontPanel()
{
  difference()
  {
    YZPanel2D(box_config);

    translate([0, 6])
    {
      Display(panel=true);
    }
  }
}

FrontPanel();
