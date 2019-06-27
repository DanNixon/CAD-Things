/* Hacky mount for a 2.5" HDD on my already hacky laptop hinges. */

use <SCAD_Lib/Utils.scad>;

$fn = 16;

mount_offset = [-50, -40];

difference()
{
  hull()
  {
    /* HDD outline */
    PlaceSquareMountingHoles([85, 70])
    {
      circle(d=15);
    }

    /* Laptop mounting hole outline */
    translate(mount_offset)
    {
      circle(d=15);
    }
  }

  /* Mounting holes for HDD */
  PlaceSquareMountingHoles([76.6, 61.72])
  {
    circle(d=3.2);
  }

  /* Mountng hole for laptop */
  translate(mount_offset)
  {
    circle(d=5.2);
  }
}
