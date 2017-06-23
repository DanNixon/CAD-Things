include <../config.scad>
include <../common/macros.scad>
use <../common/external_parts.scad>
use <../common/ScrewFixing.scad>

module TabletLayer2()
{
  difference()
  {
    union()
    {
      square(tablet_outer_dims(), center=true);

      /* Tabs */
      for(x = tablet_assy_x_positions())
        for(y = tablet_tab_y_positions_a())
          translate([x, y])
            square([MATERIAL_THICKNESS, TAB_WIDTH], center=true);
    }

    square(tablet_top_inner_dims(), center=true);

    /* Screws */
    for(x = tablet_assy_x_positions())
      for(y = tablet_screw_y_positions_a())
        translate([x, y])
          ScrewFixing(x);

    TabletButtonsCutout();
  }
}

TabletLayer2();
