use <blank_with_mounting_plate.scad>

board_size = [56, 85];
front_panel_recess = 3;

module PlaceMountingHoles()
{
  /* TODO */
  centres = 65;

  translate([0, -front_panel_recess])
  {
    for(x = [centres / 2, -centres / 2])
    {
      /* TODO */
      translate([x, 10])
      {
        children();
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
      BlankWithMountingPlate(plate_depth=70, recess_depth=front_panel_recess, support_thickness=4, panel_support_length=50);

      /* Board standoffs */
      color("cyan")
      {
        rotate([0, -90, 0])
        {
          PlaceMountingHoles()
          {
            Standoff(12, 4, board_offset);
          }
        }
      }
    }

    /* Board mounting holes */
    rotate([0, -90, 0])
    {
      PlaceMountingHoles()
      {
        cylinder(d=2.5, h=50, center=true);
      }
    }

    /* Port cutouts */
    translate([-board_offset, 0, 0])
    {
      rotate([0, -90, 0])
      {
        /* TODO */
        translate([-board_size[0] / 2, 0, 0])
        {
          /* Ethernet */
          translate([40, 0, 13.5 / 2])
          {
            cube([30, 20, 13.5], center=true);
          }

          /* USB */
          translate([15, 0, 16 / 2])
          {
            cube([8, 20, 16], center=true);
          }

          /* Micro USB */
          translate([0, 0, 5 / 2])
          {
            cube([8, 20, 5], center=true);
          }
        }
      }
    }
  }
}

Segment();
