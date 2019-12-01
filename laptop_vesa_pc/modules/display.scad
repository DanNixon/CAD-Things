module Display(panel=false)
{
  $fn = 32;

  display_height = 210;

  /* Display area */
  if (panel)
  {
    square([363, display_height], center=true);
  }

  hole_diameter = 3.8;

  /* Top holes */
  translate([0, (display_height / 2) + 4])
  {
    dx = 340 / 2;

    for (a = [0, 180])
    {
      rotate(a)
      {
        translate([dx, 0])
        {
          circle(d=hole_diameter);

          translate([5, 0])
          {
            circle(d=hole_diameter);
          }
        }
      }
    }
  }

  /* Bottom holes */
  translate([0, -(display_height / 2) - 8])
  {
    dx = 335 / 2;

    for (x = [-dx, dx])
    {
      translate([x, 0])
      {
        circle(d=hole_diameter);

        translate([0, -7])
        {
          circle(d=hole_diameter);
        }
      }
    }
  }
}

Display(panel=true);
