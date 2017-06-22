include <config.scad>

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

translate([0, -100, 0])
  Keyboard();

rotate([angle, 0, 0])
  translate([0, 100, 0])
    Tablet();
