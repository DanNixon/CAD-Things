$fn = 32;
EPSILON = 0.001;

LARGE_ROUNDING_DIAM = 3;
BOTTOM_SECTION_HEIGHT = 5;
SUPPORT_WIDTH = 4;
STICK_HEIGHT = 32;
STICK_DIAM = 10;
STICK_GUARD_DIAM = 18;
GIMBAL_DIAM = 46;
CENTER_SQUARE_DIMS = [10, 10, 5];


module Cap(d)
{
  intersection()
  {
    sphere(d=d);
    cylinder(d=d, h=d/2);
  }
}

module Cutout(h, d1, d2, d3)
{
  difference()
  {
    intersection()
    {
      cylinder(h=h, d=d2);

      translate([d1 / 2, d1 / 2, 0])
        cube([d2, d2, h]);
    }

    cylinder(h=h, d=d3);
  }
}


difference()
{
  minkowski()
  {
    difference()
    {
      hull()
      {
        cylinder(h=BOTTOM_SECTION_HEIGHT, d=GIMBAL_DIAM - LARGE_ROUNDING_DIAM);

        translate([0, 0, STICK_HEIGHT - 5 - (LARGE_ROUNDING_DIAM / 2)])
          cylinder(h=BOTTOM_SECTION_HEIGHT, d=STICK_GUARD_DIAM - LARGE_ROUNDING_DIAM);
      }

      union()
      {
        cylinder(h=STICK_HEIGHT, d=STICK_DIAM + LARGE_ROUNDING_DIAM);

        for(a=[0, 90, 180, 270])
        {
          rotate([0, 0, a])
          {
            Cutout(100, SUPPORT_WIDTH - (LARGE_ROUNDING_DIAM / 2), GIMBAL_DIAM * 0.8, STICK_GUARD_DIAM - (LARGE_ROUNDING_DIAM / 2));

            translate([0, 0, BOTTOM_SECTION_HEIGHT])
              Cutout(100, SUPPORT_WIDTH - (LARGE_ROUNDING_DIAM / 2), GIMBAL_DIAM, STICK_GUARD_DIAM - (LARGE_ROUNDING_DIAM / 2));
          }
        }
      }
    }

    Cap(LARGE_ROUNDING_DIAM);
  }

  translate([0, 0, CENTER_SQUARE_DIMS[2] / 2])
    cube(CENTER_SQUARE_DIMS, center=true);
}


/* Markers */
color("cyan", alpha=0.5)
{
  /* cylinder(d=STICK_DIAM, h=STICK_HEIGHT); */

  /* translate([0, 0, -2]) */
  /* cylinder(d=GIMBAL_DIAM, h=1); */

  /* translate([0, 0, STICK_HEIGHT + 1]) */
  /* cylinder(d=STICK_GUARD_DIAM, h=1); */
}
