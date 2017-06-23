include <../config.scad>
include <../common/macros.scad>

module TabletLayer2()
{
  difference()
  {
    square(tablet_outer_dims(), center=true);
    square(tablet_top_inner_dims(), center=true);
  }

  // TODO
}

TabletLayer2();
