include <common.scad>
use <blank.scad>

module BlankWithMountingPlate(front_thickness=5, plate_thickness=5, plate_depth=120, recess_size=[segment_width - 10, segment_height - 16], recess_depth=3)
{
  translate([-(segment_width / 2) + plate_thickness, 0, 0])
  {
    Blank(front_thickness, recess_size, recess_depth);
  }

  color("green")
  {
    translate([plate_thickness / 2, 0, 0])
    {
      rotate([-90, 0, 0])
      {
        linear_extrude(plate_depth)
        {
          square([plate_thickness, segment_height], center=true);
        }
      }
    }
  }
}

BlankWithMountingPlate();
