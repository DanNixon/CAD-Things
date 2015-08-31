include <CAD-Library/rounded_rect.scad>
include <CAD-Library/BubbleScopeMount.scad>

module chipOpening() {
	clearance = 0.5;
	c = 2 * clearance;
	translate([0,-9.5,0])
		cube(size=[8+c,10+c,5],center=true);
}

module lensOpening() {
	clearance = 0.5;
	c = 2 * clearance;
	translate([0, 0, -0.5])
		cube(size=[8+c,8+c,12], center=true);
}

module mountingHoles()
{
	dx = 10;
	radius = 1.5;
	dz = -10;
	translate([dx, -12.5, dz])
		cylinder(r=radius, h=20);
	translate([-dx, -12.5, dz])
		cylinder(r=radius, h=20);
	translate([dx, 0, dz])
		cylinder(r=radius, h=20);
	translate([-dx, 0, dz])
		cylinder(r=radius, h=20);

	translate([10, 0, dz+1.9])
		cylinder(r=2.1, h=2.1);
	translate([-10, 0, dz+1.9])
		cylinder(r=2.1, h=2.1);
}

module piCameraAdapter() {
	difference() {
		union()
		{
			translate([0, -2, -2.1])
				cube([28, 28, 5], center=true);
			translate([10, 0, -8])
				cylinder(r=3, h=5);
			translate([-10, 0, -8])
				cylinder(r=3, h=5);
		}
		lensOpening();
		chipOpening();
	}
}

$fn = 64;
rotate([0, 180, 0])
	difference()
	{
		union()
		{
			piCameraAdapter();
			rotate([0, 180, 0])
				translate([0, 0, 4])
					bubblescope_mount(threads=true);
		}
		mountingHoles();
	}
