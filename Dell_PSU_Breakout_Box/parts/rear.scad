use <SCAD_Lib/BoltAndTabBox.scad>
include <../config.scad>

module RearPanel()
{
  difference()
  {
    YZPanel2D(box_config);
	
	translate(CABLE_OFFSET)
	  circle(d=CABLE_DIAMETER);
  }
}

RearPanel();
