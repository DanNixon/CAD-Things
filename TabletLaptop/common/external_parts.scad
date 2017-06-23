include <../config.scad>

module Tablet()
{
  color("lightgrey")
    cube(TABLET_DIMENSIONS, center=true);

  translate([0, 0, 0.1])
    color("slategrey")
      linear_extrude(height=TABLET_DIMENSIONS[2], center=true)
        translate(TABLET_SCREEN_POSITION)
          square(TABLET_SCREEN_DIMENSIONS, center=true);
}

module TabletCameraCutout()
{
  translate(TABLET_REAR_CAMERA_CUTOUT_POS)
  {
    minkowski()
    {
      square(TABLET_REAR_CAMERA_CUTOUT_DIMS - [5, 5], center=true);
      circle(r=5, $fn=16);
    }
  }
}

module TabletButtonsCutout()
{
  translate([-35, 100])
  {
    minkowski()
    {
      square([130, 10], center=true);
      circle(r=5, $fn=16);
    }
  }
}

module Keyboard()
{
  color("dimgrey")
    cube(KEYBOARD_DIMENSIONS, center=true);

  translate([0, 0, 1])
  {
    color("black")
      linear_extrude(height=KEYBOARD_DIMENSIONS[2], center=true)
        translate(KEYBOARD_KEYS_POSITION)
          square(KEYBOARD_KEYS_DIMENSIONS, center=true);

    color("darkgrey")
      linear_extrude(height=KEYBOARD_DIMENSIONS[2], center=true)
        translate(KEYBOARD_TRACKPAD_POSITION)
          square(KEYBOARD_TRACKPAD_DIMENSIONS, center=true);
  }
}
