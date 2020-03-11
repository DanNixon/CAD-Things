include <common.scad>

module Blank(front_thickness=5)
{
  color("red")
  {
    rotate([90, 0, 0])
    {
      linear_extrude(front_thickness)
      {
        FrontProjection();
      }
    }
  }
}

Blank();
