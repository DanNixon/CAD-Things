module Spacer(fridge, space)
{
  difference()
  {
    cube(fridge + space);

    translate([-1, -1, space[2]])
    {
      cube(fridge + [1, 1, 1]);
    }
  }
}


fridge_1 = [35, 40, 60];
fridge_2 = [20, 40, 60];


Spacer(fridge_1, [10, 50, -1]);

mirror([1, 0, 0])
{
  translate([10, 0, 0])
  {
    Spacer(fridge_1, [50, 50, -1]);
  }

  translate([10, -50, 0])
  {
    Spacer(fridge_2, [50, -1, 10]);
  }
}
