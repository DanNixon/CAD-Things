h1 = 5;
h2 = 25;
h3 = 50;

d_outer = 100;
d_inner = 75;
d_hole = 50;

slot_1_width = 10;
slot_2_width = 14;

$fn = 64;

module Slot(w, z, y)
{
  translate([0, y, 50 + z])
  {
    cube([100, w, 100], center=true);
  }
}

difference()
{
  union()
  {
    hull()
    {
      cylinder(d=d_outer, h=h1);
      cylinder(d=d_inner, h=h2);
    }

    cylinder(d=d_inner, h=h3);
  }

  translate([0, 0, -1])
  {
    cylinder(d=d_hole, h=h3 + 2);
  }

  Slot(slot_1_width, 5, -11);
  Slot(slot_2_width, 5, 11);
}
