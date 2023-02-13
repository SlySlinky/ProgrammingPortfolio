class Ship {
  int x, y, w, ammo, turretCount, health;
  PImage ship;

  // Constructor
  Ship() {
    x = 400;
    y = 700;
    w = 90;
    ammo = 1000;
    turretCount = 1;
    health = 100;
    ship = loadImage("SpaceshipLong.png");
  }

  void display() {
    imageMode(CENTER);
    ship.resize(100, 100);
    image(ship, x, y);
    if (health < 0) {
      health = 0;
    }
  }

  void move(int tempx, int tempy) {
    x = tempx;
    y = tempy;
    if (x < 0) {
      x = 0;
    }
    if (y < 0) {
      y = 0;
    }
    if (x > width) {
      x = width;
    }
    if (y > height) {
      y = height;
    }
  }

  boolean fire() {
    if (ammo>0) {
      ammo--;
      laserCount ++;
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

  boolean intersect(Powerup powerup) {
    float b = dist(x, y, powerup.x, powerup.y);
    if (b < powerup.diam) {
      return true;
    } else {
      return false;
    }
  }
}
