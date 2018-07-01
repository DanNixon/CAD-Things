$fn = 45;

height = 100;
diameter = 85;
wall = 5;
tablet_thickness = 9;
tablet_angle = 25;

minkowski()
{
difference()
{
    cylinder(d=diameter, h=height);
    
    translate([0, 0, -1])
    {
        cylinder(d=diameter-(2*wall), h=height+2);
    }
    
    rotate([-tablet_angle, 0, 0])
    {
        translate([0, 0, ((height * 1.5) / 2) + 10])
        {
            cube([diameter * 1.5, tablet_thickness, height * 1.5], center=true);
            
            translate([0, -tablet_thickness + 0.1, 10])
            {
                cube([diameter * 1.5, tablet_thickness, height * 1.5], center=true);
                
                translate([0, -250 - (tablet_thickness / 2), 0])
                {
                    cube([500, 500, 500], center=true);
                }
            }
        }
    }
}

sphere(r=0.5);
}