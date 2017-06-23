include <../config.scad>
include <../common/macros.scad>

module TabletSide()
{
  half_sep = tablet_outer_dims()[1] / 2;

  hull()
  {
    translate([0, half_sep])
      circle(r=tablet_side_radius());

    translate([0, -half_sep])
      circle(r=tablet_side_radius());
  }

  // TODO
}

TabletSide();
