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
      /* Cutout for Cherry MX switch */
      square([16, 14], center=true);
    }
  }
}

TopPanel();
