board_size = [96.5, 81.2];
mount_size = board_size + [5, 5];
height = 8;
tray_depth = 4;
pcb_thickness = 1.6;

screw_positions = [
  [(85 / 2) - 1.0, -2.5],
  [(-85 / 2) - 1.0, -2.5],
];

board_supports = [
  [-45, 37],
  [45, -37],
];

module Main() {
  difference() {
    union() {
      difference() {
        translate([0, 0, -height]) {
          linear_extrude(height) {
            square(mount_size, center = true);
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
}

module DinBracketMount() {
  h2 = 6;
  depth = 32;
  fw = 1.8;
  ho = 3.7;

  difference() {
    translate([0, 0, -height - h2]) {
      linear_extrude(h2) {
        square(mount_size, center = true);
      }
    }

    translate([0, 0, -height - h2 - 0.01]) {
      for(p = screw_positions) {
        translate(p) {
          cylinder(d = 4, h = h2 + 0.1);
        }
      }

      for(y = [-25, -25 + 38]) {
        translate([0, y, ho]) {
          for(a = [0, 180]) {
            rotate([0, 0, a]) {
              translate([(mount_size[0] / 2) - depth + 0.1, 0, 0]) {
                rotate([0, 90, 0])
                cylinder(d = 4, h = depth, $fn = 9);
              }
              translate([(mount_size[0] / 2) - depth + 0.1, -fw / 2, -ho]) {
                cube([depth, fw, ho]);
              }
            }
          }
        } 
      }
    }
  }
}

Main();
DinBracketMount();
