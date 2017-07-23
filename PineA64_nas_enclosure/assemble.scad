include <config.scad>

use <SCAD_Lib/parts/PineA64.scad>

use <common/HDD.scad>

use <parts/BlankPanel.scad>
use <parts/HDDPanel.scad>
use <parts/Pine64Panel.scad>

$fn = 16;

module ExtrudeAndColour(c)
{
  color(c)
    linear_extrude(height=MATERIAL_THICKNESS, center=true)
      children();
}

ExtrudeAndColour("blue")
  Pine64Panel();

translate([0, 0, 5])
  ExtrudeAndColour("green")
    PineA64();

translate([0, 0, 15])
  ExtrudeAndColour("blue")
    HDDPanel();

translate([0, 0, 20])
  color("grey")
    cube(HDDDimensions(), center=true);

translate([0, 0, 30])
  ExtrudeAndColour("blue")
    BlankPanel();
