include <config.scad>

use <parts/front.scad>
use <parts/rear.scad>
use <parts/top.scad>
use <parts/bottom.scad>
use <parts/left.scad>
use <parts/right.scad>
use <parts/power_jack_mount.scad>

use <modules/motherboard.scad>

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
  {
    linear_extrude(height=material_thickness, center=true)
    {
      children();
    }
  }
}

rotate([90, 0, 0])
{
  translate([0, 0, x])
  {
    ExtrudeAndColour("blue")
    {
      FrontPanel(panel=true);
    }
  }

  translate([0, 0, -x])
  {
    ExtrudeAndColour("blue")
    {
      RearPanel();
    }
  }
}

rotate([0, 0, 90])
{
  translate([0, 0, z])
  {
    ExtrudeAndColour("red")
    {
      TopPanel();
    }
  }

  translate([0, 0, -z])
  {
    ExtrudeAndColour("red")
    {
      BottomPanel();
    }
  }

  rotate([90, 0, 0])
  {
    translate([0, 0, y])
    {
      ExtrudeAndColour("green")
      {
        RightPanel();
      }
    }

    translate([0, 0, -y])
    {
      ExtrudeAndColour("green")
      {
        LeftPanel();
      }
    }
  }
}

translate(motherboard_pos)
{
  rotate([90, 0, 0])
  {
    difference()
    {
      square([285, 210], center=true);
      MotherboardDifference();
    }
  }
}

translate([110, 40, 90])
{
  rotate([-90, 90, 0])
  {
    PowerJack();
  }
}
