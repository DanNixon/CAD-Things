include <../../SCAD/primitives/rounded_rect.scad>

module RetentionClip()
{
	rotate([0, 180, 0])
	{
		difference()
		{
			difference()
			{
        RoundedRect(50, 18, 18, 3);
				translate([40, 9, -0.1])
				union()
				{
					cylinder(r=6.5, h=6.1);
					cylinder(r=4, h=10.1);
				}
			}
			translate([-0.1, -0.1, -0.1])
				cube([30.1, 12.1, 13.1]);
		}
	}
}
