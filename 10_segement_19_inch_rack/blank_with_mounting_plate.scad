include <common.scad>
use <blank.scad>

module BlankWithMountingPlate(front_thickness=5, plate_thickness=5, plate_depth=120, recess_size=[segment_width - 10, segment_height - 16], recess_depth=3, support_thickness=5, front_support_length=segment_width*0.75, panel_support_length=50, rear_support_thickness=0, rear_support_width=5)
{
  a = [-(segment_width / 2) + plate_thickness, 0, 0];

  difference()
  {
    union()
    {
      translate(a)
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

      color("blue")
      {
        dz = (segment_height / 2);
        for(z = [-dz, dz - support_thickness])
        {
          translate([0, 0, z])
          {
            hull()
            {
              cube([plate_thickness, panel_support_length, support_thickness]);

              rotate([0, 0, 180])
                cube([front_support_length, front_thickness, support_thickness]);
            }
          }
        }
      }

      color("magenta")
      {
        dz = (segment_height / 2);
        for(z = [-dz, dz - rear_support_thickness])
        {
          translate([0, 0, z])
          {
            hull()
            {
              translate([0, plate_depth - rear_support_width, 0])
              {
                cube([plate_thickness, rear_support_width, rear_support_thickness]);
              }

              rotate([0, 0, 180])
              {
                translate([segment_width - plate_thickness - rear_support_width, 0, 0])
                {
                  cube([rear_support_width, front_thickness, rear_support_thickness]);
                }
              }
            }
          }
        }
      }
    }

    translate(a)
    {
      rotate([90, 0, 0])
      {
        linear_extrude(20, center=true)
        {
          MountingHolesProjection();
        }
      }
    }
  }
}

BlankWithMountingPlate();
