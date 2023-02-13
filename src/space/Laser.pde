class Laser {
  int x, y, w, h, speed;
  color c1;
  //PImage laser;

  // Constructor
  Laser(int x, int y) {
    this.x = x;
    this.y = y;
    w = 2;
    h = 21;
    //w = 100;
    //h = 100;
    if (level == 1) {
      speed = 5;
    } else if (level == 3) {
      speed = 6;
    } else if (level == 5) {
      speed = 7;
    } else if (level == 7) {
      speed = 8;
    } else if (level == 9) {
      speed = 9;
    } else if (level == 10) {
      speed = 10;
    }
    c1 = color(200, 0, 0);
    //laser = loadImage("laser.png");
  }

  void display() {
    rectMode(CENTER);
    fill(c1);
    rect(x, y, w, h);
    //imageMode(CENTER);
    //laser.resize(w, h);
    //image(laser, x, y);
  }

  void move() {
    y-= speed;
  }

  boolean reachedTop() {
    if (y < -42) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Rock rock) {
    float d = dist(x, y, rock.x, rock.y);
    if (d < rock.diam2-rock.diam2/2) {
      return true;
    } else {
      return false;
    }
  }
}
