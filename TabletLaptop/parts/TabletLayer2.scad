include <../config.scad>
include <../common/macros.scad>

module TabletLayer2()
{
  difference()
  {
    square(tablet_outer_dims(), center=true);
    square(tablet_top_inner_dims(), center=true);
  }

  for(x = tablet_tab_x_positions())
    for(y = tablet_tab_y_positions_a())
      translate([x, y])
        square([MATERIAL_THICKNESS, TAB_WIDTH], center=true);
}

TabletLayer2();
