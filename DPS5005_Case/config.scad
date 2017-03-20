machine_tolerance = 0.05;

internal = [100, 80, 40];
material_thickness = 3;
outer_padding = 5;

screw_radius = 1.75;
xy_screws = [];
xz_screws = [0];

xy_tab_width = 25;
xy_tabs = [-20, 20];
xz_tab_width = 10;
xz_tabs = [-15, 15];

box_config = [
    internal,
    [material_thickness, machine_tolerance],
    outer_padding,
    [screw_radius, xy_screws, xz_screws],
    [[xy_tab_width, xy_tabs], [xz_tab_width, xz_tabs]]
  ];

PSU_OFFSET = [0, -15];
PSU_DIMS = [75, 39];

TERMINALS = [["INPUT", [-25, 30]],
             ["OUTPUT", [25, 30]]];
