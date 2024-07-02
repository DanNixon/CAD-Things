use <blank_with_mounting_plate.scad>

module PlaceMountingHoles()
{
  centres = [61.5, 76.5];

  translate([0, (centres[1] / 2) + 32, 0])
  {
    for(x = [centres[0] / 2, -centres[0] / 2])
    {
      for(y = [centres[1] / 2, -centres[1] / 2])
      {
        translate([x, y])
        {
          children();
        }
      }
    }
  }
}

module Segment()
{
  board_offset = 5;

  difference()
  {
    union()
    {
      BlankWithMountingPlate(
          plate_depth=120,
          recess_depth=0,
          support_thickness=3,
          panel_support_length=75);

      /* Board standoffs */
      color("cyan")
      {
        rotate([0, -90, 0])
        {
          PlaceMountingHoles()
          {
            Standoff(12, 6, board_offset);
          }
        }
      }
    }

    /* Board mounting holes */
    rotate([0, -90, 0])
    {
      PlaceMountingHoles()
      {
        cylinder(d=3.1, h=50, center=true, $fn=32);
      }
    }

    /* Cable exit cutout */
    translate([-board_offset, 0, 0])
    {
      rotate([0, -90, 0])
      {
        translate([0, 0, 14 / 2])
        {
          cube([18, 20, 14], center=true);
        }
      }
    }
  }
}

Segment();
