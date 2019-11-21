difference()
{
  /* Body */
  cube([35, 19, 13], center=true);

  /* Barrel jack cutout */
  translate([0, 1.6, -1.1])
  {
    difference()
    {
      cube([16, 16, 11], center=true);

      translate([8, 8, 5.5])
      {
        cube([6, 1, 6], center=true);
      }
    }
  }

  /* Mounting holes */
  for (x = [-12.5, 12.5])
  {
    translate([x, 0, 0])
    {
      cylinder(d=3.5, h=100, center=true, $fn=32);
    }
  }
}
