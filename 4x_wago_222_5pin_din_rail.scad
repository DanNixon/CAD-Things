use </home/dan/git/SCAD_Lib/din_rail/clip.scad>;
use </home/dan/git/SCAD_Lib/wago_222_mount/mount.scad>;

width = 17;

base_padding = 3;

translate([0, width / 2, 0]) {
  rotate([90, 0, 0]) {
    linear_extrude(width) {
      DinRailClip();
    } 
  }
}

for(x = [-15.5 * 3, -15.5, 15.5, 15.5 * 3]) {
  translate([x, 0, base_padding + 0.5]) {
    Wago222Mount_5pin();
  }
}

translate([0, 0, base_padding / 2]) {
  cube([124.4, width, base_padding], center = true);
}
