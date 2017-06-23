use <SCAD_Lib/PanelNutFixing.scad>

module ScrewFixing(side)
{
  module Fixing()
  {
    PanelNutFixing(
      width=3.5,
      length=8,
      nut_thickness=2.5,
      nut_width=6,
      nut_dist=4,
      thickness=0);
  }

  if (side > 0)
    rotate([0, 0, 90])
      Fixing();
  else
    rotate([0, 0, -90])
      Fixing();
}
