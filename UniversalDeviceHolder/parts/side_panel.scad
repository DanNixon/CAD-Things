include <../config.scad>

module SidePanel()
{
  half_depth = DEPTH / 2;

  difference()
  {
    union()
    {
      hull()
      {
        translate([half_depth, 0])
          circle(r=SIDE_PANEL_CORNER_RADIUS);

        translate([-half_depth, 0])
          circle(r=SIDE_PANEL_CORNER_RADIUS);

        translate([-half_depth, HEIGHT])
          circle(r=SIDE_PANEL_CORNER_RADIUS);
      }

      hull()
      {
        translate([half_depth, 0])
        {
          circle(r=SIDE_PANEL_CORNER_RADIUS);

          rotate([0, 0, -DEVICE_ANGLE])
            translate([0, DEVICE_THICKNESS])
              circle(r=SIDE_PANEL_CORNER_RADIUS);
        }
      }
    }

    circle(d=MOUNTING_HOLE_DIAM);

    dx = HALF_DEPTH - TAB_OFFSET;
    for(x = [-dx, dx])
      translate([x, 0])
        square([TAB_WIDTH + MACHINE_TOLERANCE, MATERIAL_THICKNESS + MACHINE_TOLERANCE], center=true);

    translate([-HALF_DEPTH, HALF_HEIGHT])
    {
      circle(d=MOUNTING_HOLE_DIAM);

      dy = HALF_HEIGHT - TAB_OFFSET;
      for(y = [-dy, dy])
        translate([0, y])
          square([MATERIAL_THICKNESS + MACHINE_TOLERANCE, TAB_WIDTH + MACHINE_TOLERANCE], center=true);
    }
  }
}

SidePanel();
