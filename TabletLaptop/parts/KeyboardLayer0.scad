include <../config.scad>
include <../common/macros.scad>

module KeyboardLayer0()
{
  square(keyboard_outer_dims(), center=true);

  for(x = keyboard_tab_x_positions())
    for(y = keyboard_tab_y_positions_a())
      translate([x, y])
        square([MATERIAL_THICKNESS, TAB_WIDTH], center=true);
}

KeyboardLayer0();
