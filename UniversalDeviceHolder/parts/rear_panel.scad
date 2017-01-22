include <../config.scad>

module RearPanel()
{
  square([WIDTH, HEIGHT - MATERIAL_THICKNESS], center=true);
}

RearPanel();
