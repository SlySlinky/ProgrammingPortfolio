class Rock {
  int x, y, diam1, diam2, speed;
  PImage rock;

  // Constructor
  Rock() {
    x = int(random(width));
    y = -50;
    diam1 = int(random(50, 150));
    diam2 = int(random(30, 150));
    //diam = int(random(50, 150));
    if (level == 1) {
    speed = int(random(1, 4));
    } else if (level == 2) {
    speed = int(random(1, 5));
    } else if (level == 3) {
    speed = int(random(2, 5));
    } else if (level == 4) {
    speed = int(random(3, 5));
    } else if (level == 5) {
    speed = int(random(4, 5));
    } else if (level == 6) {
    speed = int(random(5, 6));
    } else if (level == 7) {
    speed = int(random(5, 7));
    } else if (level == 8) {
    speed = int(random(5, 8));
    } else if (level == 9) {
    speed = int(random(7, 8));
    } else if (level == 10) {
    speed = int(random(9, 10));
    }
    rock = loadImage("asteroid0.png");
  }

  void display() {
    //rock.resize(diam1, diam2);
    rock.resize(diam1, diam2);
    imageMode(CENTER);
    image(rock, x, y);
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
