include <config.scad>

use <parts/bottom_panel.scad>
use <parts/side_panel.scad>
use <parts/rear_panel.scad>

module ExtrudeAndColour(c)
{
  color(c)
    linear_extrude(height=MATERIAL_THICKNESS, center=true)
      children();
}

ExtrudeAndColour("red")
  BottomPanel();

translate([-HALF_WIDTH, 0, 0])
  rotate([90, 0, -90])
    ExtrudeAndColour("green")
      SidePanel();

translate([HALF_WIDTH, 0, 0])
  rotate([90, 0, -90])
    ExtrudeAndColour("green")
      SidePanel();

translate([0, HALF_DEPTH, HALF_HEIGHT])
  rotate([90, 0, 0])
    ExtrudeAndColour("blue")
      RearPanel();
