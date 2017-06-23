include <../config.scad>
include <../common/macros.scad>

module KeyboardLayer2()
{
  difference()
  {
    square(keyboard_outer_dims(), center=true);
    square(keyboard_top_inner_dims(), center=true);
  }

  // TODO
}

KeyboardLayer2();
