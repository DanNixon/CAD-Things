plate_thickness = 2;
plate_corner_radius = 5;

//// Board
// Pi 3, 4, 5
//plate_size = [80, 110];
//plate_hole_centres = [70, 100];
//board_standoff_height = 3.5;
//board_standoff_diameter_top = 5;
//board_standoff_diameter_base = 8;
//board_mounting_hole_centres = [49, 58];
//board_mounting_hole_offset = [0, -10];
//board_mounting_hole_diameter = 2;
// Pi Pico
plate_size = [40, 70];
plate_hole_centres = [30, 60];
board_standoff_height = 5.5;
board_standoff_diameter_top = 3;
board_standoff_diameter_base = 3.8;
board_mounting_hole_centres = [11.4, 47];
board_mounting_hole_offset = [0, 0];
board_mounting_hole_diameter = 2;

//// Plate mounting hole type
// Clearance
//plate_hole_diam = 3.5;
//plate_hole_edges = 16;
// Tapping
plate_hole_diam = 3;
plate_hole_edges = 5;

module LayoutCentres(centres) {
  d = centres / 2;
  for(x = [-d[0], d[0]]) {
    for(y = [-d[1], d[1]]) {
      translate([x, y]) {
        children();
      }
    }
  }
}

difference() {
  union() {
    linear_extrude(height = plate_thickness) {
      difference() {
        // Plate
        hull() {
          padding = plate_corner_radius * 2;
          LayoutCentres(centres = plate_size - [padding, padding]) {
            circle(r = plate_corner_radius);
          }
        }

        // Plate mounting holes
        padding = 10;
        LayoutCentres(centres = plate_hole_centres) {
          circle(d = plate_hole_diam, $fn = plate_hole_edges);
        }
      }
    }

    // Board standoffs
    translate(board_mounting_hole_offset) {
      translate([0, 0, plate_thickness]) {
        LayoutCentres(centres = board_mounting_hole_centres) {
          cylinder(h = board_standoff_height, d1 = board_standoff_diameter_base, d2 = board_standoff_diameter_top, $fn = 32);
        }
      }
    }
  }

  // Board mounting holes
  translate(board_mounting_hole_offset) {
    LayoutCentres(centres = board_mounting_hole_centres) {
      cylinder(h = plate_thickness + board_standoff_height, d = board_mounting_hole_diameter, $fn = 5);
    }
  }
}
