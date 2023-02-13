import math
class Sphere:
  r = 0.0
  
  def __init__(self):
    self.r = 0.0

  def calcVol(self):
    v = (4/3)*(math.pi)*self.r**3
    return v
    #print("This is the volume: " + v)
  def calcSA(self):
    sa = 4*(math.pi)*self.r**2
    return sa 
    #print("This is the surface area of the sphere: " + sa)
    