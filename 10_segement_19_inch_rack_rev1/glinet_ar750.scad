include <common.scad>
use <blank_with_mounting_plate.scad>

board_size = [80, 60];

module PlaceMountingHoles()
{
  centres = 74;

  for(x = [centres / 2, -centres / 2])
  {
    translate([x, 11])
    {
      children();
    }
  }
}

module Segment()
{
  board_offset = 3;

  difference()
  {
    union()
    {
      BlankWithMountingPlate(
          plate_depth=85,
          front_thickness=2.9,
          recess_depth=0,
          support_thickness=4,
          front_support_length=2.5,
          panel_support_length=15,
          rear_support_thickness=4);

      /* Board standoffs */
      color("cyan")
      {
        rotate([0, -90, 0])
        {
          PlaceMountingHoles()
          {
            Standoff(9.5, 4.5, board_offset);
          }
        }
      }
    }

    /* Board mounting holes */
    rotate([0, -90, 0])
    {
      PlaceMountingHoles()
      {
        cylinder(d=3, h=20, center=true);
      }
    }

    /* Port cutouts */
    translate([-board_offset, 0, 0])
    {
      rotate([0, -90, 0])
      {
        translate([-board_size[0] / 2, 0, 0])
        {
          /* Ethernet */
          translate([(47 / 2) + 5, 0, (13.5 / 2) + 1.5])
          {
            cube([47, 20, 13.5], center=true);
          }

          /* USB */
          translate([(7 / 2) + 54.5, 0, (14 / 2) + 1.5])
          {
            cube([7, 20, 14], center=true);
          }

          /* Micro USB */
          translate([(9 / 2) + 65.5, 0, 5 / 2])
          {
            cube([9, 20, 5], center=true);
          }
        }
      }
    }
  }
}

Segment();
