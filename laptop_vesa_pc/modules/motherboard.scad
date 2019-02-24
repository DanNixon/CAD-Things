/* TODO: test hole positions */

module MotherboardDifference()
{
  holes = [
    [0, 0],
    [85, 0],
    [5, 100],
    [188, 85],
    [242, 170],
  ];

  dx = -128;

  for(h = holes)
  {
    translate([dx, -100] + h)
    {
      circle(d=4);
    }
  }

  /* Connectors cutout */
  translate([dx - 20, 0, 3])
  {
    cube([20, 190, 12], center=true);
  }

  /* Fan cutout */
  translate([dx - 20, 65, -5])
  {
    cube([20, 60, 15], center=true);
  }
}


difference()
{
  union()
  {
    square([285, 210], center=true);

    translate([-145, 0, 0])
    {
      rotate([0, 90, 0])
      {
        square([50, 250], center=true);
      }
    }
  }

  MotherboardDifference();
}
