include <../config.scad>
include <../common/macros.scad>

module KeyboardSide()
{
  half_sep = keyboard_outer_dims()[1] / 2;

  difference()
  {
    hull()
    {
      translate([0, half_sep + hinge_radius()])
        circle(r=keyboard_side_radius());

      translate([0, -half_sep])
        circle(r=keyboard_side_radius());
    }

    /* Hinge hole */
    translate([0, half_sep + hinge_radius()])
      circle(d=HINGE_SCREW_DIAM, $fn=16);

    /* Bottom and top layer fixings */
    for(x = [-keyboard_z_offset(), keyboard_z_offset()])
    {
      /* Tabs */
      for(y = keyboard_tab_y_positions_a())
        translate([x, y])
          square([MATERIAL_THICKNESS + MACHINE_TOLERANCE, TAB_WIDTH + MACHINE_TOLERANCE], center=true);

      /* Screws */
      for(y = keyboard_screw_y_positions_a())
        translate([x, y])
          circle(d=ASSEMBLY_SCREW_DIAM, $fn=16);
    }

    /* Centre layer tab holes */
    for(y = keyboard_tab_y_positions_b())
      translate([0, y])
        square([MATERIAL_THICKNESS + MACHINE_TOLERANCE, TAB_WIDTH + MACHINE_TOLERANCE], center=true);
  }
}

KeyboardSide();
