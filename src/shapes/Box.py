class Box:
  l = 0.0
  w = 0.0
  h = 0.0
  
  def __init__(self):
    self.l = 0.0
    self.w = 0.0
    self.h = 0.0

  def calcVol(self):
    v = float(self.l) * float(self.w) * float(self.h)
    return v
    #print("This is the volume: " + v)
      
  def calcSA(self):
    sa = 2*(float(self.l) * float(self.w)) + 2 * (float(self.w)*float(self.h)) + 2 * (float(self.l) * float(self.h))
    return sa
    #print("This is the surface area of the box: " + sa)
    