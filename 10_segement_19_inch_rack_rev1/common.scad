segment_width = 44;
segment_height = 83.5;

mounting_hole_centres = 75.5;

module MountingHolesProjection(clearence)
{
  for(y = [-mounting_hole_centres/2, mounting_hole_centres/2])
  {
    translate([0, y])
    {
      if(clearence)
      {
        circle(d=3.1, $fn=32);
      }
      else
      {
        circle(d=3.0);
      }
    }
  }
}

module FrontProjection(mounting_clearence_holes)
{
  difference()
  {
    square([segment_width, segment_height], center=true);
    MountingHolesProjection(mounting_clearence_holes);
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
