use </home/dan/git/SCAD_Lib/din_rail/clip.scad>;

pcb_thickness = 1.6;
y_offset = 10;

module _Pcb() {
  include <./pcb.scad>;
}

module Pcb() {
  translate([-150, 102.7, pcb_thickness / 2]) {
    _Pcb();
  }
}

module AssemblyHoles() {
  for(x = [-33.5, 33.5]) {
    translate([x, -6]) {
      children();
    }
  }
}

x2 = 29.5;
x1 = x2 - 2;
x3 = x2 + 8;

y1 = 2.5;
y2 = 1.7;
y3 = -0.1;
y4 = -5;
y5 = -10;

module Profile() {
  difference() {
    polygon([
      [-x3, y5],
      [-x3, y1],
      [-x1, y1],
      [-x1, y2],
      [-x2, y2],
      [-x2, y3],
      [-x1, y3],
      [-x1, y4],
      [x1, y4],
      [x1, y3],
      [x2, y3],
      [x2, y2],
      [x1, y2],
      [x1, y1],
      [x3, y1],
      [x3, y5],
    ]);

    // Holes for brass inserts for end cap
    AssemblyHoles() {
      circle(d = 4.4, $fn = 8);
    }
  }
}

module ProfileEnd() {
  polygon([
    [-x3, y5],
    [-x3, y1],
    [x3, y1],
    [x3, y5],
  ]);
}

module ProfileDin() {
  translate([0, -10]) {
    DinRailClip();
  }
}

module Mount() {
  color("blue") {
    translate([-10.2, y_offset, 0]) {
      rotate([90, 0, 90]) {
        linear_extrude(1) {
          difference() {
            ProfileEnd();

            // Holes for brass inserts for end cap
            AssemblyHoles() {
              circle(d = 4.4, $fn = 8);
            }
          }
        }   
      }

      rotate([90, 0, 90]) {
        linear_extrude(19) {
          Profile();
        }   
      }
    }

    translate([-10.2, 0, 0]) {
      rotate([90, 0, 90]) {
        linear_extrude(19) {
          ProfileDin();
        }
      }
    }
  }
}

module EndCap() {
  color("red") {
    translate([9.2, y_offset, 0]) {
      rotate([90, 0, 90]) {
        linear_extrude(1.2) {
          difference() {
            ProfileEnd();

            // Holes for mounting screws
            AssemblyHoles() {
              circle(d = 3.2, $fn = 16);
            }
          }
        }   
      }
    }
  }
}

Mount();
EndCap();
translate([0, y_offset, 0]) {
  Pcb();
}
