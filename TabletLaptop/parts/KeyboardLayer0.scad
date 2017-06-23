include <../config.scad>
include <../common/macros.scad>
use <../common/ScrewFixing.scad>

module KeyboardLayer0()
{
  difference()
  {
    union()
    {
      square(keyboard_outer_dims(), center=true);

      /* Tabs */
      for(x = keyboard_assy_x_positions())
        for(y = keyboard_tab_y_positions_a())
          translate([x, y])
            square([MATERIAL_THICKNESS, TAB_WIDTH], center=true);
    }

    /* Screws */
    for(x = keyboard_assy_x_positions())
      for(y = keyboard_screw_y_positions_a())
        translate([x, y])
          ScrewFixing(x);
  }
}

KeyboardLayer0();
