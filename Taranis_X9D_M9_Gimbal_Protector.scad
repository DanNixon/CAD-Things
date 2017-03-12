$fn = 32;
EPSILON = 0.001;

STICK_HEIGHT = 32;
STICK_DIAM = 10;
STICK_GUARD_DIAM = 15;
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

difference()
{
  union()
  {
    minkowski()
    {
      cylinder(d=GIMBAL_DIAM-LARGE_ROUNDING_DIAM, h=5-LARGE_ROUNDING_DIAM);

      Cap(d=LARGE_ROUNDING_DIAM, $fn=8);
    }

    minkowski()
    {
      difference()
      {
        cylinder(d=STICK_GUARD_DIAM-SMALL_ROUNDING_DIAM, h=STICK_HEIGHT-SMALL_ROUNDING_DIAM);
        cylinder(d=STICK_DIAM+SMALL_ROUNDING_DIAM, h=STICK_HEIGHT-SMALL_ROUNDING_DIAM+EPSILON);
      }

      Cap(d=SMALL_ROUNDING_DIAM, $fn=8);
    }
  }

  union()
  {
    cylinder(d=STICK_DIAM, h=STICK_HEIGHT);

    translate([0, 0, CENTER_SQUARE_DIMS[2] / 2])
      cube(CENTER_SQUARE_DIMS + [0, 0, EPSILON], center=true);
  }
}
