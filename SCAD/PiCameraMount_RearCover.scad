include <Suwako/Shapes.scad>

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
            linear_extrude(3, center=true)
                RoundedRectangle([40, 40], 5, center=true);
			translate([0, 0, -10.1])
				mountingHoles();
		}
	}
}

piCameraAdapterRear();
