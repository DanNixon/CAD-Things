use <Suwako/BoltAndTabBox.scad>
include <../config.scad>

module BottomPanel()
{
  difference()
  {
    XYPanel2D(box_config);

    screw_centres = [70, 118] / 2;
    for(x = [-screw_centres[0], screw_centres[0]])
      for(y = [-screw_centres[1], screw_centres[1]])
        translate([x, y])
          circle(d = 3.2);
  }
}

BottomPanel();
