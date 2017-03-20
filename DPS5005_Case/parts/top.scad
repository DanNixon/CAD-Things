use <Suwako/BoltAndTabBox.scad>
use <../modules/Terminals.scad>
include <../config.scad>

module TopPanel()
{
  difference()
  {
    XYPanel2D(box_config);
	
	translate(PSU_OFFSET)
      square(PSU_DIMS, center=true);
	  
	for(t=TERMINALS)
      translate(t[1])
        Terminals(t[0]);
  }
}

TopPanel();
