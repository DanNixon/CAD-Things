internal = [85, 128, 22];
material_thickness = 3;
outer_padding = 3;

screw_radius = 1.75;
xy_screws = [-40, 40];
xz_screws = [];

xy_tab_width = 5;
xy_tabs = [-60, 0, 60];
xz_tab_width = 10;
xz_tabs = [];

box_config = [
    internal,
    [material_thickness, 0.1],
    outer_padding,
    [screw_radius, xy_screws, xz_screws],
    [[xy_tab_width, xy_tabs], [xz_tab_width, xz_tabs]]
  ];
