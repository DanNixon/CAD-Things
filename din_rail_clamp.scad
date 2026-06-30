use </home/dan/git/SCAD_Lib/din_rail/clip.scad>;

width = 4;
height = 40;
depth = 5;

translate([0, width / 2, 0]) {
  rotate([90, 0, 0]) {
    linear_extrude(width) {
      DinRailClip();
    } 
  }
}

translate([0, 0, depth / 2]) {
  cube([height, width, depth], center = true);
}
