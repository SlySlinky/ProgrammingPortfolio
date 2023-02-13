import math
class Pyramid:
  l = 0.0
  w = 0.0
  h = 0.0
  
  def __init__(self):
    self.l = 0.0
    self.w = 0.0
    self.h = 0.0
  def calcVol(self):
    v = (self.l*self.w*self.h)/3
    return v
    #print("This is the volume: " + v)
  def calcSA(self):
    sa = (self.l*self.w) + self.l*(math.sqrt((self.w/2)**2+self.h**2)) + self.w*(math.sqrt((self.l/2)**2+self.h**2))
    return sa
    #print("This is the surface area of the pyramid: " + sa)