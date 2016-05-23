use <Suwako/BoltAndTabBox.scad>
use <Suwako/Label.scad>
include <../config.scad>

label_offset = [0, -14];

module OutputJacks(hole_d, offset=12)
{
  positions = [[offset, "L"], [-offset, "R"]];

  for (pos = positions)
  {
    translate([0, pos[0]])
    {
      Label(pos[1], offset=[-14, 0])
        circle(d=hole_d);

      translate([18, 0])
        circle(d=hole_d);
    }
  }
}

module FrontPanel()
{
  difference()
  {
    Rack19InchPanel2D(box_config);

    // Power input
    translate([-180, 0])
    {
      Label("Power", offset=label_offset)
        square([10, 12], center=true);
    }

    // Audio input
    translate([-120, 0])
    {
      Label("L", offset=label_offset)
        circle(d=10);

      translate([20, 0])
        Label("R", offset=label_offset)
          circle(d=10);
    }

    // Audio out 1
    translate([80, 0])
      OutputJacks(9);

    // Audio out 2
    translate([150, 0])
      OutputJacks(13);

    // TODO: switches

    // TODO: power LEDs

    // TODO: gain pots
  }
}

FrontPanel();
