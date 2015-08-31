include <CAD-Library/rounded_rect.scad>

module cableOpening() {
	translate([0,14,3])
		cube(size=[17,12.1,4.1],center=true);
}

module chipOpening() {
	clearance = 0.5;
	c = 2 * clearance;
	translate([0,-9.5,0])
		cube(size=[8+c,10+c,4],center=true);
}

module lensOpening() {
	clearance = 0.5;
	c = 2 * clearance;
	translate([0,0,-2.5])
		cube(size=[8+c,8+c,6], center=true);
}

module boardOpening() {
	clearance = 0.5;
	c = 2 * clearance;
	translate([0,-3,3])
		cube(size=[25+c,24+c,5.1], center=true);
}

module mountingHoles()
{
	dx = 16;
	dy = 16;
	radius = 2;
	translate([dx, dy, 0])
		cylinder(r=radius, h=20);
	translate([-dx, dy, 0])
		cylinder(r=radius, h=20);
	translate([dx, -dy, 0])
		cylinder(r=radius, h=20);
	translate([-dx, -dy, 0])
		cylinder(r=radius, h=20);
}

module piCameraAdapter() {
	difference() {
		difference() {
			RoundedRect(40, 40, 10, 5, centre=true);
			boardOpening();
			lensOpening();
			cableOpening();
			chipOpening();
			translate([0, 0, -10.1])
				mountingHoles();
		}
	}
}

piCameraAdapter();
