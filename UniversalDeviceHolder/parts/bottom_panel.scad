include <../config.scad>
use <../common.scad>

module BottomPanel()
{
  difference()
  {
    union()
    {
      square([WIDTH, DEPTH], center=true);
      SideTabs(HALF_DEPTH);
    }

    SideNutFixings();
  }
}

BottomPanel();
