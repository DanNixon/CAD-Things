use <CAD-Library/dxf_import.scad>;

include <CAD-Library/parametric_enclosures/basic_bolt_jointed/basic_bolt_jointed.scad>;
include <../config.scad>

module Display()
{
  projection()
    DXFImport("/home/dan/git_repos/CAD-Library/DXF/Displays/eBay_7inch_TFT.dxf",
              subtraction_layers=["TFT_Cutout"]);
}

module FrontPanel()
{
  difference()
  {
    YZPanel2D();
    Display();
  }
}

FrontPanel();
