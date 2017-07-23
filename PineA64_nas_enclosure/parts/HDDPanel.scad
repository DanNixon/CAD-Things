use <SCAD_Lib/Utils.scad>
use <../common/HDD.scad>
use <../common/Panel.scad>
include <../config.scad>

module HDDPanel()
{
  difference()
  {
    Panel();

    PlaceSquareMountingHoles(HDDMountingScrewCentres())
      circle(d=HDD_MOUNTING_HOLE_DIAMETER);
  }
}

HDDPanel();
