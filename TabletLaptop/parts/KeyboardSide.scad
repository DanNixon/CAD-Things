include <../config.scad>
include <../common/macros.scad>

module KeyboardSide()
{
  half_sep = keyboard_outer_dims()[1] / 2;

  hull()
  {
    translate([0, half_sep + hinge_radius()])
      circle(r=keyboard_side_radius());

    translate([0, -half_sep])
      circle(r=keyboard_side_radius());
  }

  // TODO
}

KeyboardSide();
