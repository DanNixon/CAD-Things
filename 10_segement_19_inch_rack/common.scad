segment_width = 42;
segment_height = 83.5;

mounting_hole_centres = 75.5;
mounting_hole_diameter = 3.5;

module FrontProjection()
{
  difference()
  {
    square([segment_width, segment_height], center=true);

    for(y = [-mounting_hole_centres/2, mounting_hole_centres/2])
    {
      translate([0, y])
      {
        circle(d=mounting_hole_diameter);
      }
    }
  }
}

module Standoff(lower_diameter, upper_diameter, height)
{
  hull()
  {
    translate([0, 0, -1])
    {
      cylinder(d=lower_diameter, h=1, $fn=32);
    }

    translate([0, 0, height - 1])
    {
      cylinder(d=upper_diameter, h=1, $fn=32);
    }
  }
}
