class Car {
  color c;
  float xpos, ypos, xspeed;

  // Constructor
  Car() {
    c = color(random(255), random(255), random(255));
    xpos = random(width);
    ypos = random(height/2+15, height-15);
    xspeed = random(1, 5);
  }
  void display() {
    rectMode(CENTER);
    fill(c);
    rect(xpos, ypos, 20, 10);
    fill(0);
    rect(xpos-6, ypos-6, 6, 3);
    rect(xpos+6, ypos-6, 6, 3);
    rect(xpos+6, ypos+7, 6, 3);
    rect(xpos-6, ypos+7, 6, 3);
    fill(200);
    rect(xpos+5, ypos, 4, 6);
  }

  void drive() {
    xpos += xspeed;
    if (xpos > width) {
      xpos = 0;
    }
  }
}
