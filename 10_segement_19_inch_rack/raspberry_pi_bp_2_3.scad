use <blank_with_mounting_plate.scad>

board_size = [56, 85];
front_panel_recess = 3;

module PlaceMountingHoles()
{
  translate([-board_size[0]/2, -front_panel_recess])
  {
    translate([3.5, board_size[1] - 3.5])
    {
      for(x = [0, 49])
      {
        for(y = [0, -58])
        {
          translate([x, y])
          {
            children();
          }
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
      BlankWithMountingPlate(plate_depth=90, recess_depth=front_panel_recess, support_thickness=4, panel_support_length=50);

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
        cylinder(d=2, h=50, center=true);
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
          translate([10.25, 0, (15 / 2) + 2])
          {
            cube([17, 20, 15], center=true);
          }

          /* USB */
          for(x = [29, 47])
          {
            translate([x, 0, (16 / 2) + 2])
            {
              cube([16.5, 20, 16], center=true);
            }
          }
        }
      }
    }
  }
}

Segment();
