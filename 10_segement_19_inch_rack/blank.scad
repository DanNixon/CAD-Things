include <common.scad>

module Blank(front_thickness=5, recess_size=[segment_width - 10, segment_height - 16], recess_depth=3)
{
  color("red")
  {
    rotate([90, 0, 0])
    {
      difference()
      {
        linear_extrude(front_thickness)
        {
          FrontProjection(mounting_clearence_holes=false);
        }

        translate([0, 0, -0.01])
        {
          linear_extrude(recess_depth)
          {
            square(recess_size, center=true);
          }
        }
      }
    }
  }
}

Blank();
