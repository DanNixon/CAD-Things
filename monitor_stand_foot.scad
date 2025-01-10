$fn = 32;

screw_d = 10;
screw_bottom_offset = 4;

h1 = 3;
h2 = 7;
d1 = 55;
d2 = screw_d + 2;

difference() {
  union() {
    translate([0, 0, -h1]) {
      cylinder(h = h1, d = d1);
    }

    cylinder(h = h2, d1 = d1, d2 = d2);
  }

  sh = (h1 + h2) - screw_bottom_offset + 0.01;
  echo(sh);
  so = -h1 + screw_bottom_offset;

  translate([0, 0, so]) {
    cylinder(h = sh, d = screw_d);
  }
}
