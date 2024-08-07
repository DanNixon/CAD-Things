include <config.scad>;

use <parts/front.scad>
use <parts/rear.scad>
use <parts/top.scad>
use <parts/bottom.scad>

$fn = 16;

explode = 0;
side_explode = 0;

half_thick = material_thickness / 2;
x = (internal[0] / 2) + half_thick + explode + side_explode;
y = (internal[1] / 2) + half_thick + explode;
z = (internal[2] / 2) + half_thick + explode;

module ExtrudeAndColour(c)
{
  color(c)
    linear_extrude(height=material_thickness, center=true)
      children();
}

rotate([90, 0, 0])
{
  translate([0, 0, x])
    ExtrudeAndColour("blue")
      FrontPanel();

  translate([0, 0, -x])
    ExtrudeAndColour("blue")
      RearPanel();
}

rotate([0, 0, 90])
{
  translate([0, 0, z])
    ExtrudeAndColour("red")
      TopPanel();

  translate([0, 0, -z])
    ExtrudeAndColour("red")
      BottomPanel();
}
