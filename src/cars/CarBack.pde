class CarBack {
  color c;
  float xpos, ypos, xspeed;

  // Constructor
  CarBack() {
    c = color(random(255), random(255), random(255));
    xpos = random(width);
    ypos = random(15, height/2-15);
    xspeed = random(1, 5);
  }
  void display() {
    rectMode(CENTER);
    fill(0);
    rect(xpos-6, ypos-6, 6, 3);
    rect(xpos+6, ypos-6, 6, 3);
    rect(xpos+6, ypos+7, 6, 3);
    rect(xpos-6, ypos+7, 6, 3);
    fill(c);
    rect(xpos, ypos, 20, 10);
    fill(200);
    rect(xpos-5, ypos, 4, 6);
  }
  void driveBack() {
    xpos += -xspeed;
    if (xpos < 0) {
      xpos = width;
    }
  }
}
