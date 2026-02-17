board_size = [96.5, 81.2];
height = 8;
tray_depth = 4;
pcb_thickness = 1.6;

screw_positions = [
  [(85 / 2) + 0.5, 2.5],
  [(-85 / 2) + 1.5, 2.5],
];

board_supports = [
  [-45, 37],
  [45, -37],
];

difference() {
  union() {
    difference() {
      translate([0, 0, -height]) {
        linear_extrude(height) {
          square([96.5 + 5, 81.5 + 5], center = true);
        }
      }

      translate([0, 0, 0.01 - tray_depth]) {
        linear_extrude(tray_depth) {
          square(board_size, center = true);
        }
      }
    }

    translate([0, 0, -tray_depth]) {
      for(p = screw_positions) {
        translate(p) {
          cylinder(d = 8, h = abs(tray_depth) - pcb_thickness - 0.5);
        }
      }
      for(p = board_supports) {
        translate(p) {
          cylinder(d = 8, h = abs(tray_depth) - pcb_thickness);
        }
      }
    }
  }

  translate([0, 0, -height - 1]) {
    for(p = screw_positions) {
      translate(p) {
        cylinder(d = 4, h = height + 2);
      }
    }
  }
}
