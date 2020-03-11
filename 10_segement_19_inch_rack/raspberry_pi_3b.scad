use <blank_with_mounting_plate.scad>

board_size = [56, 85];

module PlaceMountingHoles()
{
  translate([-board_size[0]/2, 0])
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

module RaspberyPi3B()
{
  board_offset = 5;

  difference()
  {
    union()
    {
      BlankWithMountingPlate(plate_depth=90);

      /* Board standoffs */
      color("blue")
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
        translate([-board_size[0] / 2, 0, 0])
        {
          /* Ethernet */
          translate([10.25, 0, 13.5 / 2])
          {
            cube([17, 20, 13.5], center=true);
          }

          /* USB */
          for(x = [29, 47])
          {
            translate([x, 0, 16 / 2])
            {
              cube([15, 20, 16], center=true);
            }
          }
        }
      }
    }
  }
}

RaspberyPi3B();
