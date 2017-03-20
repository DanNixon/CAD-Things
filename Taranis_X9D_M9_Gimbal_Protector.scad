$fn = 32;
EPSILON = 0.001;

STICK_HEIGHT = 32;
STICK_DIAM = 10;
STICK_GUARD_DIAM = 16;
GIMBAL_DIAM = 46;
CENTER_SQUARE_DIMS = [9, 9, 4];

SMALL_ROUNDING_DIAM = 2;
LARGE_ROUNDING_DIAM = 3;


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


//minkowski()
{
  difference()
  {
    hull()
    {
      cylinder(h=5, d=GIMBAL_DIAM);

      translate([0, 0, STICK_HEIGHT-5])
        cylinder(h=5, d=STICK_GUARD_DIAM);
    }

    union()
    {
      cylinder(h=STICK_HEIGHT, d=STICK_DIAM);

      for(a=[0, 90, 180, 270])
      {
        rotate([0, 0, a])
        {
          Cutout(100, 5, GIMBAL_DIAM * 0.8, STICK_GUARD_DIAM);

          translate([0, 0, 5])
            Cutout(100, 5, GIMBAL_DIAM, STICK_GUARD_DIAM);
        }
      }
    }
  }

  //Cap(LARGE_ROUNDING_DIAM);
}
