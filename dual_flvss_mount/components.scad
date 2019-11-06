module FlvssCutout(extents)
{
  main_dimensions = [37, 26, 7.5];

  cube(main_dimensions, center=true);

  translate([-2, 2, (main_dimensions[2] + extents) / 2])
  {
    cube([24, 14, extents], center=true);
  }

  translate([(main_dimensions[0] + extents) / 2, 0, 0.5])
  {
    cube([extents, 8, 6], center=true);
  }

  translate([(main_dimensions[0]) / 2, 7.5, 0])
  {
    rotate([0, 90, 0])
    {
      cylinder(h=extents, d=3.8, $fn=16);
    }
  }

  translate([-(main_dimensions[0] + extents) / 2, -2.5, 0])
  {
    cube([extents, 18, 6], center=true);
  }
}

module PlaceAtCentres(centres, dz)
{
  dx = centres[0] / 2;
  dy = centres[1] / 2;

  for (x = [-dx, dx])
  {
    for (y = [-dy, dy])
    {
      translate([x, y, dz])
      {
        children();
      }
    }
  }
}

module Mount()
{
  difference()
  {
    mount_width = 39;
    mount_length = 80;
    mount_thickness = 10;
    mount_round = 10;
    mount_hole_diameter = 4;

    /* Mount body */
    hull()
    {
      PlaceAtCentres([mount_width - mount_round, mount_length - mount_round], -mount_thickness/2)
      {
        cylinder(h=10, d=mount_round, $fn=16);
      }
    }

    /* Labels */
    for (y = [-15, 15])
    {
      /* Balance connector ground indicator */
      translate([-18, y-10, 4.5])
      {
        linear_extrude(1)
        {
          text("-G", size=3, valign="center", halign="left");
        }
      }

      /* SBUS port pinout indicators */
      translate([18, y+0.5, 4.5])
      {
        linear_extrude(1)
        {
          /* Ground */
          translate([0, 4])
          {
            text("G-", size=3, valign="center", halign="right");
          }

          /* Power */
          text("V-", size=3, valign="center", halign="right");

          /* SBUS */
          translate([0, -4])
          {
            text("S-", size=3, valign="center", halign="right");
          }
        }
      }
    }

    /* Cutout for each FLVSS module */
    for (y = [-15, 15])
    {
      translate([0, y, 0])
      {
        FlvssCutout(10);
      }
    }

    /* Mounting holes */
    PlaceAtCentres([mount_width - 10, mount_length - 10], -10)
    {
      cylinder(h=20, d=mount_hole_diameter, $fn=16);
    }
  }
}

module MountHalf(dz)
{
  difference()
  {
    Mount();

    translate([0, 0, dz])
    {
      cube([100, 100, 20], center=true);
    }
  }
}
