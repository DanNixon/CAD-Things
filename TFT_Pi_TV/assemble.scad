include <config.scad>;
use <CAD-Library/parametric_enclosures/basic_bolt_jointed/basic_bolt_jointed.scad>;
use <parts/front.scad>
use <parts/rear.scad>

$fn = 16;

explode = 0;
side_explode = 0;

half_thick = material_thickness / 2;
x = (internal_x / 2) + half_thick + explode + side_explode;
y = (internal_y / 2) + half_thick + explode;
z = (internal_z / 2) + half_thick + explode;

color("red")
{
  translate([0, 0, z])
    XYPanel();

  translate([0, 0, -z])
    XYPanel();
}

color("green")
{
  rotate([90, 0, 0])
  {
    translate([0, 0, y])
      XZPanel();

    translate([0, 0, -y])
      XZPanel();
  }
}

color("blue")
{
  rotate([90, 0, 90])
  {
    translate([0, 0, x])
      linear_extrude(height=3, center=true)
        FrontPanel();

    translate([0, 0, -x])
      linear_extrude(height=3, center=true)
        RearPanel();
  }
}
