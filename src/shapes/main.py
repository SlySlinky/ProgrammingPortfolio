from Box import Box
from Sphere import Sphere
from Pyramid import Pyramid

print(
  "Welcome to shape maker! Let's find out the volume and surface area for a few shapes. Wahoooo! "
)
choice = None
while choice != "1" and choice != "2" and choice != "3":
  choice = input(
  "To build a box press 1, to build a pyramid press 2, to build a sphere press 3. Wahoooo!"
)


if (choice == "1"):
  print("Great! Let's build a box. Wahoooo!")
  shape = Box()
    
elif (choice == "2"):
  print("Great! Let's build a pyramid. Wahoooo!")
  shape = Pyramid()
    
elif (choice == "3"):
  print("Great! Let's build a sphere. Wahoooo!")
  shape = Sphere()

if (choice == "1" or choice == "2"):
  shape.l = float(input("Hooray! Length: "))
  shape.w = float(input("Let's go! Width: "))
  shape.h = float(input("This is great! Height: "))
else:
  shape.r = float(input(("Yippeeeeeee! Radius: ")))

print("Here is the surface area of aformentioned shape: " + str(shape.calcSA()) + " Wahoooo!")
print("Here is the volume of aformentioned shape: " + str(shape.calcVol()) + " Wahoooo!")