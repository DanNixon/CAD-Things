/* TODO: test hole positions */

module Motherboard()
{
  holes = [
    [0, 0],
    [85, 0],
    [5, 100],
    [188, 85],
    [242, 170]
  ];

  for(h = holes)
  {
    translate(-[136, 100] + h)
    {
      circle(d=4);
    }
  }
}


difference()
{
  square([285, 210], center=true);
  Motherboard();
}
