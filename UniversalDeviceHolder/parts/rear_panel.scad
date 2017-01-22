include <../config.scad>
use <../common.scad>

module RearPanel()
{
  difference()
  {
    union()
    {
      square([WIDTH, HEIGHT - MATERIAL_THICKNESS], center=true);
      SideTabs(HALF_HEIGHT);
    }

    SideNutFixings();
  }
}

RearPanel();
