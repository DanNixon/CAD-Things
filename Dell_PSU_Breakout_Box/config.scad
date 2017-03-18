internal = [60, 40, 50];
material_thickness = 3;
outer_padding = 5;

screw_radius = 1.75;
xy_screws = [];
xz_screws = [0];

xy_tab_width = 5;
xy_tabs = [-15, 15];
xz_tab_width = 5;
xz_tabs = [-15, 15];

box_config = [
    internal,
    [material_thickness, 0.1],
    outer_padding,
    [screw_radius, xy_screws, xz_screws],
    [[xy_tab_width, xy_tabs], [xz_tab_width, xz_tabs]]
  ];
  
SWITCH_OFFSET = [12, 0];
SWITCH_HOLE_DIMS = [22.5, 28];

TERMINALS_OFFSET = [-16, 0];

CABLE_OFFSET = [0, -18];
CABLE_DIAMETER = 12;