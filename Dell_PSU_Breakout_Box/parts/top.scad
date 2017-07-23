use <SCAD_Lib/BoltAndTabBox.scad>
include <../config.scad>

module TopPanel()
{
  difference()
  {
    XYPanel2D(box_config);
	
	translate(SWITCH_OFFSET)
	  square(SWITCH_HOLE_DIMS, center=true);
	  
	translate(TERMINALS_OFFSET)
	{
      for(y=[-10, 10])
	    translate([0, y])
          circle(d=13);
	}
  }
}

TopPanel();
