include <../config.scad>
include <../common/macros.scad>

module TabletLayer1()
{
  difference()
  {
    square(tablet_outer_dims(), center=true);
    square(tablet_middle_inner_dims(), center=true);
  }

  // TODO
}

TabletLayer1();
