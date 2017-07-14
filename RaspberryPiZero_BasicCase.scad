use <SCAD_Lib/parts/RaspberryPiZero.scad>;
use <SCAD_Lib/Shapes.scad>;
use <SCAD_Lib/Washers.scad>;

panel_dims = RaspberryPiZeroBoardDimensions() + [3, 3];
mounting_hole_diam = 3.1;
washer_outer = 6;

module Panel()
{
  difference()
  {
    RoundedRectangle(panel_dims, r=RaspberryPiZeroBoardCornerRadius(), center=true, $fn=32);

    RaspberryPiZeroPlaceMountingHoles()
      circle(d=mounting_hole_diam, $fn=16);
  }
}

Panel();

translate([0, panel_dims[1] + 1])
  Panel();

translate([(panel_dims[0] / 2) + washer_outer, 0])
  WasherMatrix(1, 8, mounting_hole_diam, washer_outer, $fn=16);

/* RaspberryPiZero(); */
