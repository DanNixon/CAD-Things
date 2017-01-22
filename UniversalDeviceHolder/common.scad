include <config.scad>
use <Suwako/PanelNutFixing.scad>

module SideTabs(yMax)
{
  dy = yMax - TAB_OFFSET;
  for(pos = [[-HALF_WIDTH, -dy], [-HALF_WIDTH, dy], [HALF_WIDTH, -dy], [HALF_WIDTH, dy]])
    translate(pos)
      square([MATERIAL_THICKNESS + MACHINE_TOLERANCE, TAB_WIDTH], center=true);
}

module SideNutFixings()
{
  for(a = [-90, 90])
    rotate([0, 0, a])
      translate([0, -HALF_WIDTH, 0])
        PanelNutFixing_M3();
}
