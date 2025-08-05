panel_size = [60, 80];
corner_radius = 5;

hole_diameter = 6.2;

cy = 38 / 2;
cx = 25 / 2;
hole_positions = [
  [-cx, cy],
  [-cx, -cy],
  [cx, cy],
  [cx, -cy],
];

difference() {
  minkowski() {
    square(panel_size - [corner_radius * 2, corner_radius * 2], center = true);
    circle(r = corner_radius);
  }

  for (p = hole_positions) {
    translate(p) {
      circle(d = hole_diameter, $fn = 16);
    }
  }
}
