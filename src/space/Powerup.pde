class Powerup {
  int x, y, diam, speed, i;
  PShape hexB, hexG, hexR;

  // Constructor
  Powerup() {
    x = int(random(width));
    y = -50;
    diam = 25;
    speed = int(random(1, 4));
    i = int(random(9));
    hexB = createShape();
    hexB.beginShape();
    hexB.fill(random(255), random(255), random(0));
    hexB.vertex(25, 0);
    hexB.vertex(50, 0);
    hexB.vertex(62.5, 20);
    hexB.vertex(50, 40);
    hexB.vertex(25, 40);
    hexB.vertex(12.5, 20);
    hexB.endShape(CLOSE);
    hexG = createShape();
    hexG.beginShape();
    hexG.fill(random(255), random(0), random(255));
    hexG.vertex(25, 0);
    hexG.vertex(50, 0);
    hexG.vertex(62.5, 20);
    hexG.vertex(50, 40);
    hexG.vertex(25, 40);
    hexG.vertex(12.5, 20);
    hexG.endShape(CLOSE);
    hexR = createShape();
    hexR.beginShape();
    hexR.fill(random(0), random(255), random(255));
    hexR.vertex(25, 0);
    hexR.vertex(50, 0);
    hexR.vertex(62.5, 20);
    hexR.vertex(50, 40);
    hexR.vertex(25, 40);
    hexR.vertex(12.5, 20);
    hexR.endShape(CLOSE);
  }

  void display() {
    textAlign(LEFT);
    shapeMode(CENTER);
    rectMode(CENTER);
    textMode(CENTER);
    if (i == 0) {
      fill(random(0), random(256), random(256));
      square(x, y, diam);
      fill(255, 0, 0);
      rect(x-7.5, y, 2, 17);
      fill(0);
      textSize(15);
      text("×2", x-5, y+4);
    } else if (i == 1) {
      fill(random(0), random(256), random(256));
      square(x, y, diam);
      fill(255, 0, 0);
      rect(x-7.5, y, 2, 17);
      fill(0);
      textSize(15);
      text("×3", x-5, y+4);
    } else if (i == 2) {
      fill(random(0), random(256), random(256));
      square(x, y, diam);
      fill(255, 0, 0);
      rect(x-7.5, y, 2, 17);
      fill(0);
      textSize(15);
      text("×4", x-5, y+4);
    } else if (i == 3) {
      fill(random(0), random(256), random(256));
      square(x, y, diam);
      fill(255, 0, 0);
      rect(x-7.5, y, 2, 17);
      fill(0);
      textSize(15);
      text("×5", x-5, y+4);
    } else if (i == 4) {
      fill(random(0), random(256), random(256));
      square(x, y, diam);
      fill(255, 0, 0);
      rect(x-7.5, y, 2, 17);
      fill(0);
      textSize(15);
      text("×∞", x-5, y+4);
    } else if (i == 5) {
      shape(hexB, x, y);
      fill(0, 0, 255);
      textSize(40);
      text("P", x-5, y+15);
    } else if (i == 6) {
      shape(hexG, x, y);
      fill(0, 255, 0);
      textSize(40);
      text("+", x-4, y+12);
    } else if (i == 7) {
      shape(hexR, x, y);
      fill(255, 0, 0);
      textSize(20);
      text("Sx2", x-10, y+5);
    } else if (i == 8) {
      shape(hexR, x, y);
      fill(255, 0, 0);
      textSize(40);
      text("A", x-5, y+15);
    }
  }

  void move() {
    y += speed;
  }

  boolean reachedBottom() {
    if (y > height+160) {
      return true;
    } else {
      return false;
    }
  }
}
