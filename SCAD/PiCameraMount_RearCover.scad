include <CAD-Library/rounded_rect.scad>

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

module piCameraAdapterRear() {
	difference() {
		difference() {
			RoundedRect(40, 40, 3, 5, centre=true);
			translate([0, 0, -10.1])
				mountingHoles();
		}
	}
}

piCameraAdapterRear();
