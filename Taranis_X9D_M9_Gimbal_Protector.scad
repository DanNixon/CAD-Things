$fn = 32;
EPSILON = 0.001;

STICK_HEIGHT = 32;
STICK_DIAM = 10;
STICK_GUARD_DIAM = 16;
GIMBAL_DIAM = 46;
CENTER_SQUARE_DIMS = [9, 9, 4];

SMALL_ROUNDING_DIAM = 2;
LARGE_ROUNDING_DIAM = 3;
D = 5;

BASE_HEIGHT = 5 - 1.5;

module Cap(d)
{
  intersection()
  {
    sphere(d=d);
    cylinder(d=d, h=d/2);
  }
}

module Support()
{    
    translate([0, D / 2, D / 2])
    {
    hull()
    {
        sphere(d=D);
        
        translate([0, ((GIMBAL_DIAM - STICK_DIAM) / 2) - D - 1, 0])
            sphere(d=D);
        
        translate([0, 0, STICK_HEIGHT - 1.5 * D])
            sphere(d=D);
    }
}
}

module Cutouts()
{
    //intersection()
    {
        //cylinder(d=GIMBAL_DIAM, h=5);
        
        translate([0, 0, BASE_HEIGHT / 2])
        union()
        {
            for(a=[0, 180])
                rotate([0, 0, a])
                   cube([D, GIMBAL_DIAM * 1.5, BASE_HEIGHT], center=true);
        }
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
    
    for(a=[0, 90, 180, 270])
        rotate([0, 0, a])
            translate([0, STICK_DIAM * 0.4, 0])
                Support();
  }

  union()
  {
    cylinder(d=STICK_DIAM, h=STICK_HEIGHT);

    translate([0, 0, CENTER_SQUARE_DIMS[2] / 2])
      cube(CENTER_SQUARE_DIMS + [0, 0, EPSILON], center=true);
      
      #  Cutouts();
  }
}