use <SCAD_Lib/Shapes.scad>
use <SCAD_Lib/Utils.scad>
include <../config.scad>

module Panel()
{
  difference()
  {
    RoundedRectangle(PANEL_DIMENSIONS, r=PANEL_CORNER_RAD, center=true);

    PlaceSquareMountingHoles(ASSEMBLY_HOLE_CENTRES)
      circle(d=ASSEMBLY_HOLE_DIAMETER);
  }
}
