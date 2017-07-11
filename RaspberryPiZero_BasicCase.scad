use <SCAD_Lib/parts/RaspberryPiZero.scad>;
use <SCAD_Lib/Shapes.scad>;
use <SCAD_Lib/Washers.scad>;

panel_dims = RaspberryPiZeroBoardDimensions() + [3, 3];
washer_outer = 5;

module Panel()
{
  difference()
  {
    RoundedRectangle(panel_dims, r=RaspberryPiZeroBoardCornerRadius(), center=true);

    RaspberryPiZeroPlaceMountingHoles()
      circle(d=RaspberryPiZeroMountDiameter(), $fn=16);
  }
}

Panel();

translate([0, panel_dims[1] + 1])
  Panel();

translate([(panel_dims[0] / 2) + washer_outer, 0])
  WasherMatrix(1, 8, RaspberryPiZeroMountDiameter(), washer_outer, $fn=16);

/* RaspberryPiZero(); */
