include <../config.scad>
include <../common/macros.scad>

module TabletLayer1()
{
  difference()
  {
    square(tablet_outer_dims(), center=true);

    square(tablet_middle_inner_dims(), center=true);

    translate([0, tablet_middle_inner_dims()[1] / 2])
      square(tablet_middle_inner_dims(), center=true);
  }

  /* Tabs */
  for(x = tablet_assy_x_positions())
    for(y = tablet_tab_y_positions_b())
      translate([x, y])
        square([INNER_MATERIAL_THICKNESS, TAB_WIDTH], center=true);
}

TabletLayer1();
