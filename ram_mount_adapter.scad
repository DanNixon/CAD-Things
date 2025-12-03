plate_thickness = 8;

difference() {
  union() {
    translate([0, 0, -20 - (plate_thickness / 2)]) {
      cube([80, 80, plate_thickness], center = true);
    }

    translate([0, 0, -20]) {
      cylinder(d1 = 25, d2 = 11, h = 10);
    }

    sphere(d = 25.5, $fn = 32);
  }

  translate([0, 0, -20 - plate_thickness - 0.1]) {
    cylinder(d = 3, h = 25, $fn = 5);
    cylinder(d = 10, h = 3, $fn = 16);

    for(p = [
      [32.5, -32.5],
      [-32.5, 32.5],
      [-32.5, -32.5],
      [32.5, 32.5],
    ]) {
      translate(p) {
        cylinder(d = 3, h = plate_thickness + 0.2, $fn = 5);
      }
    }
  }
}
