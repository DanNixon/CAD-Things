include <../config.scad>
include <../common/macros.scad>

module KeyboardSide()
{
  base_dims = dim3_to_dim2(KEYBOARD_DIMENSIONS) + KEYBOARD_PADDING + KEYBOARD_MARGIN;
  half_sep = base_dims[1] / 2;

  hull()
  {
    translate([0, half_sep + 5])
      circle(r=5);

    translate([0, -half_sep])
      circle(r=5);
  }

  // TODO
}

KeyboardSide();
