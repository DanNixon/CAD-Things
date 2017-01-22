include <../config.scad>

module SidePanel()
{
  half_depth = DEPTH / 2;

  hull()
  {
    translate([half_depth, 0])
      circle(r=SIDE_PANEL_CORNER_RADIUS);

    translate([-half_depth, 0])
    {
      circle(r=SIDE_PANEL_CORNER_RADIUS);

      translate([0, HEIGHT])
        circle(r=SIDE_PANEL_CORNER_RADIUS);
    }
  }
}

SidePanel();
