module SMAConnector()
{
  translate([0, 0, 3.6])
    cube([7, 7.2, 7.2], center=true);
  translate([3.6, 0, 3.6])
    rotate([0, 90, 0])
      cylinder(r=2.7, h=10);
}

module SMAHousingBlock(sides, thickness)
{
  cube_w = 7.2 + 2 * sides;
  cube_h = 7.2 + thickness;
  cube_d = 7 + thickness;
  cube_h_offset = (cube_h / 2) + 0.01;
  cube_d_offset = -((cube_d / 2) + 0.01);
  difference()
  {
    translate([cube_d_offset, 0, cube_h_offset])
      cube([cube_d, cube_w, cube_h], center=true);
    translate([-3.5, 0, 0])
      SMAConnector();
  }
}

module SMAMountingHoles(thickness, centres, radius, z_position=3.6)
{
  length = 7.2 + thickness + 2;
  translate([-length+1, centres/2, z_position])
    rotate([0, 90, 0])
      cylinder(r=radius, h=length);
  translate([-length+1, -centres/2, z_position])
    rotate([0, 90, 0])
      cylinder(r=radius, h=length);
}

module SMAMounting(thickness, centres, radius)
{
  side_width = (centres / 2) + thickness;
  holes_z_position = (7.2 + thickness) / 2;
  difference()
  {
    SMAHousingBlock(side_width, thickness);
    SMAMountingHoles(thickness, centres, radius, holes_z_position);
  }
}

rotate([0, -90, 0])
  SMAMounting(5, 25, 2.5);
