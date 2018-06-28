module ESP01()
{
  color("blue")
    cube([16, 28, 3], center=true);
}

module RegulatorBoard()
{
  color("red")
    cube([12, 26, 3], center=true);
}

module ReedSwitch()
{
  color("orange")
    cube([16, 36, 10], center=true);
}


inner_dimensions = [34, 36, 15];
wall_thickness = 2;

difference()
{
  cube(inner_dimensions + [wall_thickness, wall_thickness, wall_thickness], center=true);
  translate([0, 0, 2])
    cube(inner_dimensions + [0, 0, 2], center=true);
}

translate([9, 0, 0])
  ReedSwitch();

translate([-15, -3, 0])
  rotate([0, 90, 0])
    ESP01();

translate([-6, 4, -4])
  RegulatorBoard();
