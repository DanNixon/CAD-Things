use <Suwako/BoltAndTabBox.scad>
include <../config.scad>

module Amp1Mount()
{
  positions = [130, 92];
  inv_positions = [-130, 92];

  hole = 6;

  translate(positions/2) circle(d=hole);
  translate(-positions/2) circle(d=hole);
  translate(inv_positions/2) circle(d=hole);
  translate(-inv_positions/2) circle(d=hole);
}

module Amp2Mount()
{
  dist = 63;
  hole = 5;

  translate([dist/2, 0]) circle(d=hole);
  translate([-dist/2, 0]) circle(d=hole);
}

module BottomPanel()
{
  difference()
  {
    XYPanel2D(box_config);

    translate([0, 120])
      rotate([0, 0, 90])
        Amp1Mount();

    translate([-30, -30])
      rotate([0, 0, 90])
        Amp2Mount();

    translate([-30, -140])
      rotate([0, 0, 90])
        Amp2Mount();
  }
}

BottomPanel();
