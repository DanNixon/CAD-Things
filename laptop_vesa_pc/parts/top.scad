use <SCAD_Lib/BoltAndTabBox.scad>
include <../config.scad>

module TopPanel()
{
  difference()
  {
    XYPanel2D(box_config);

    /* Power switch cutout */
    translate([10, -140])
    {
      square([15, 15], center=true);
    }
  }
}

TopPanel();
