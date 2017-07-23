use <SCAD_Lib/Label.scad>

module Terminals(name)
{
  sep = 10;
  
  Label(name, offset=[0, -12], size=5)
    for(x=[-sep, sep])
      translate([x, 0])
        circle(d=10);
}