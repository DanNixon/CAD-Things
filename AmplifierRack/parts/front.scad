use <SCAD_Lib/BoltAndTabBox.scad>
use <SCAD_Lib/Label.scad>
use <SCAD_Lib/parts/RapidDPDTSwitch.scad>
include <../config.scad>

label_offset = [0, -14];
names = ["L1", "R1", "L2", "R2"];

module Switch(name, offset, size=4)
{
  translate([offset, 0])
    Label(name, offset=label_offset, size=size)
      RapidDPDTSwitch();
}

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
      Label("8-16V", offset=label_offset, size=4)
        square([10, 12], center=true);
    }

    // Power switch
    Switch("Power", -155);

    // Audio input
    translate([-120, 0])
    {
      Label("L", offset=label_offset)
        circle(d=10);

      translate([20, 0])
        Label("R", offset=label_offset)
          circle(d=10);
    }

    // Amp power switches
    translate([-65, 0])
    {
      for (i = [0 : 3])
        Switch(names[i], i * 12);
    }

    // Gain pots
    translate([25, 0])
    {
      pot_diam = 11;
      offset = 10;

      for (i = [0 : 3])
      {
        x = -1 + 2 * (i % 2);
        y = -1 + 2 * ((i - (i % 2)) / 2); // No integer division in OpenSCAD

        translate([x * offset, y * offset])
          Label(names[i], offset=[x * 15, 0])
            circle(d=pot_diam);
      }
    }

    // Audio out 1
    translate([100, 0])
      OutputJacks(9);

    // Audio out 2
    translate([160, 0])
      OutputJacks(13);
  }
}

FrontPanel();
