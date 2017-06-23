include <../config.scad>
include <../common/macros.scad>

module KeyboardLayer1()
{
  difference()
  {
    square(keyboard_outer_dims(), center=true);
    square(keyboard_middle_inner_dims(), center=true);
  }

  // TODO
}

KeyboardLayer1();
