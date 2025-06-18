$fn = 128;

h1 = 30;
hm = 25;
h2 = 40;

do1 = 8;
do2 = 5;
d1 = 98;
d2 = 63 + do2;

difference() {
  union() {
    cylinder(h = h1, d = d1);

    translate([0, 0, h1]) {
      cylinder(h = hm, d1 = d1, d2 = d2);
    }

    translate([0, 0, h1 + hm]) {
      cylinder(h = h2, d = d2);
    }
  }

  union() {
    translate([0, 0, -0.01]) {
      cylinder(h = h1 + 0.02, d = d1 - do1);
    }

    translate([0, 0, h1 - 0.01]) {
      cylinder(h = hm + 0.02, d1 = d1 - do1, d2 = d2 - do2);
    }

    translate([0, 0, h1 + hm - 0.01]) {
      cylinder(h = h2 + hm + 0.02, d = d2 - do2);
    }
  }

  translate([0, 0, h1 + hm + 50 + 5]) {
    cube([2, 100, 100], center = true);
  }
}
