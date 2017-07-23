use <SCAD_Lib/parts/PineA64.scad>
use <../common/Panel.scad>

module Pine64Panel()
{
  difference()
  {
    Panel();

    PineA64PlaceMountingHoles()
      circle(d=3.2);
  }
}

Pine64Panel();
