use <SCAD_Lib/BoltAndTabBox.scad>
use <SCAD_Lib/parts/PineA64.scad>
include <../config.scad>

module BottomPanel()
{
  difference()
  {
    XYPanel2D(box_config);

    rotate([0, 0, 90])
      PineA64PlaceMountingHoles()
        circle(d = 3.2);
  }
}

BottomPanel();
