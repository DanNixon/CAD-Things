include <../config.scad>
include <../common/macros.scad>

module KeyboardLayer1()
{
  difference()
  {
    square(keyboard_outer_dims(), center=true);
    square(keyboard_middle_inner_dims(), center=true);
  }

  for(x = keyboard_tab_x_positions())
    for(y = keyboard_tab_y_positions_b())
      translate([x, y])
        square([MATERIAL_THICKNESS, TAB_WIDTH], center=true);
}

KeyboardLayer1();
