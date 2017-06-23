include <../config.scad>
include <../common/macros.scad>

module TabletSide()
{
  half_sep = tablet_outer_dims()[1] / 2;

  difference()
  {
    union()
    {
      hull()
      {
        translate([0, half_sep])
          circle(r=tablet_side_radius());

        translate([0, -half_sep])
          circle(r=tablet_side_radius());
      }

      hull()
      {
        translate([0, -half_sep])
          circle(r=tablet_side_radius());

        translate([-tablet_z_assy_offset(), -tablet_y_assy_offset()])
          circle(r=tablet_side_radius());
      }
    }

    /* Hinge hole */
    translate([-tablet_z_assy_offset(), -tablet_y_assy_offset()])
      circle(d=HINGE_SCREW_DIAM, $fn=16);

    /* Bottom and top layer fixings */
    for(x = [-tablet_z_offset(), tablet_z_offset()])
    {
      /* Tabs */
      for(y = tablet_tab_y_positions_a())
        translate([x, y])
          square([MATERIAL_THICKNESS + MACHINE_TOLERANCE, TAB_WIDTH + MACHINE_TOLERANCE], center=true);

      /* Screws */
      for(y = tablet_screw_y_positions_a())
        translate([x, y])
          circle(d=ASSEMBLY_SCREW_DIAM, $fn=16);
    }

    /* Centre layer tab holes */
    for(y = tablet_tab_y_positions_b())
      translate([0, y])
        square([MATERIAL_THICKNESS + MACHINE_TOLERANCE, TAB_WIDTH + MACHINE_TOLERANCE], center=true);
  }
}

TabletSide();
