include <config.scad>
include <common/macros.scad>

use <common/external_parts.scad>

use <parts/KeyboardLayer0.scad>
use <parts/KeyboardLayer1.scad>
use <parts/KeyboardLayer2.scad>
use <parts/KeyboardSide.scad>
use <parts/TabletLayer0.scad>
use <parts/TabletLayer1.scad>
use <parts/TabletLayer2.scad>
use <parts/TabletSide.scad>

angle = 60;

module ExtrudeAndColour(c)
{
  color(c)
    linear_extrude(height=MATERIAL_THICKNESS, center=true)
      children();
}

keyboard_y = (keyboard_outer_dims()[1] / 2) + hinge_radius();

translate([0, -keyboard_y, 0])
{
  Keyboard();

  translate([0, 0, -keyboard_z_offset()])
    ExtrudeAndColour("red")
      KeyboardLayer0();

  ExtrudeAndColour("blue")
    KeyboardLayer1();

  translate([0, 0, keyboard_z_offset()])
    ExtrudeAndColour("red")
      KeyboardLayer2();

  x_offset = (keyboard_outer_dims()[0] + MATERIAL_THICKNESS) / 2;

  for(x=[-x_offset, x_offset])
    translate([x, 0, 0])
      rotate([0, 90, 0])
        ExtrudeAndColour("green")
          KeyboardSide();
}

rotate([angle, 0, 0])
{
  translate([0, 110, 0])
  {
    Tablet();

    translate([0, 0, -tablet_z_offset()])
      ExtrudeAndColour("red")
        TabletLayer0();

    ExtrudeAndColour("blue")
      TabletLayer1();

    translate([0, 0, tablet_z_offset()])
      ExtrudeAndColour("red")
        TabletLayer2();

    x_offset = (tablet_outer_dims()[0] + MATERIAL_THICKNESS) / 2;

    for(x=[-x_offset, x_offset])
      translate([x, 0, 0])
        rotate([0, 90, 0])
          ExtrudeAndColour("green")
            TabletSide();
  }
}
