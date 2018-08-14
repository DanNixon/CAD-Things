$fn = 16;

module TrianglePart(base, length, angle)
{
  linear_extrude(base, center=true)
  {
    hull()
    {
      circle(r=1);

      translate([base, 0, 0])
      {
        circle(r=1);
      }

      rotate([0, 0, -angle])
      {
        translate([0, length, 0])
        {
          circle(r=1);
        }
      }
    }
  }
}

module Thing(base, length, angle)
{
  difference()
  {
    TrianglePart(base, length, angle);

    translate([2, 2, 0])
    {
      TrianglePart(base - 2, length, angle);
    }

    translate([base / 2, 2, 0])
    {
      rotate([90, 0, 0])
      {
        cylinder(h=4, d=4);
      }
    }

    rotate([0, 0, -angle])
    {
      for(y = [5, 25, 45])
      {
        translate([3, y, 0])
        {
          cylinder(h=base+2, d=3, center=true);
        }
      }
    }
  }
}

rotate([0, -90, 0])
{
  rotate([0, 0, 8])
  {
    Thing(20, 60, 8);
  }
}
