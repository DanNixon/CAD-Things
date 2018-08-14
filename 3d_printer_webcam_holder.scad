$fn = 16;

module TrianglePart(base_dim, length, angle)
{
  linear_extrude(base_dim, center=true)
  {
    hull()
    {
      circle(r=0.1);

      translate([base_dim, 0, 0])
      {
        circle(r=0.1);
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

base = 20;
length = 60;
angle = 8;

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
