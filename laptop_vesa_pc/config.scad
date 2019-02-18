internal = [50, 375, 240];
material_thickness = 3;
outer_padding = 5;

screw_radius = 1.75;
xy_screws = [-160, -60, 60, 160];
xz_screws = [-100, 100];

xy_tab_width = 20;
xy_tabs = [-120, 0, 120];
xz_tab_width = 15;
xz_tabs = [-75, 0, 75];

box_config = [
    internal,
    [material_thickness, 0.1],
    outer_padding,
    [screw_radius, xy_screws, xz_screws],
    [[xy_tab_width, xy_tabs], [xz_tab_width, xz_tabs]]
  ];
