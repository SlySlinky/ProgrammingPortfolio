// Connor Soelberg || Nov 28 2022 || SpaceGame
import processing.sound.*;
SoundFile pew, intro, shieldSound, spaceField, intense, gameOver, powerupAcquire, resultsPage, cruising, atmosphere;
Ship s1;
Timer rockTimer, powerupTimer, shieldTimer, fireTimer, level1Timer, resultsTimer, levelDisplayTimer, gameOverTimer;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<Powerup> powerups = new ArrayList<Powerup>();
Star[] stars = new Star[1000];
int score, level, rockCount, laserCount, finalHealth, finalAmmo, levelScore, totalScore;
boolean play, bob, joe, results, levelDisplay;
PImage shield, powerupGet;

void setup() {
  size(800, 800);
  pew = new SoundFile(this, "pew.wav");
  intro = new SoundFile(this, "intro.wav");
  spaceField = new SoundFile(this, "spaceField.wav");
  shieldSound = new SoundFile(this, "shield.wav");
  intense = new SoundFile(this, "intense.wav");
  gameOver = new SoundFile(this, "gameOver.wav");
  powerupAcquire = new SoundFile(this, "powerupGet.wav");
  resultsPage = new SoundFile(this, "results.wav");
  cruising = new SoundFile(this, "cruising.wav");
  atmosphere = new SoundFile(this, "atmosphere.wav");
  frameRate(800);
  s1 = new Ship();
  rockTimer = new Timer(1000);
  rockTimer.start();
  powerupTimer = new Timer(10000);
  powerupTimer.start();
  shieldTimer = new Timer(3000);
  fireTimer = new Timer(3000);
  level1Timer = new Timer(100000);
  resultsTimer = new Timer(1000);
  levelDisplayTimer = new Timer(2000);
  gameOverTimer = new Timer(500);
  for (int i=0; i<stars.length; i++) {
    stars[i] = new Star();
  }
  score = 0;
  level = 1;
  rockCount = 0;
  laserCount = 0;
  totalScore = 0;
  play = false;
  bob = false;
  joe = false;
  results = false;
  shield = loadImage("shield.png");
  powerupGet = loadImage("powerupGet.png");
  levelDisplay = true;
}

void draw () {
  if (!play) {
    startScreen();
  } else {
    intro.stop();
    //spaceField.play();

    levelDisplayTimer.start();

    background(0);

    if (level == 1 && levelDisplay) {
      textSize(100);
      textAlign(CENTER);
      //text("LEVEL ONE", width/2, height/2 - 50);
      //text("START", width/2, height/2 + 50);
    }

    //Rendering Stars
    for (int i=0; i<stars.length; i++) {
      stars[i].display();
      if (s1.health > 1) {
        stars[i].move();
      }
    }
    noCursor();

    // Distributing Rocks
    if (rockTimer.isFinished()) {
      rocks.add(new Rock());
      rockTimer.start();
    }
    // Rendering Rocks
    for (int i = 0; i < rocks.size(); i++) {
      Rock r = rocks.get(i);
      for (int j = 0; j < lasers.size(); j++) {
        Laser l = lasers.get(j);
        if (l.intersect(r)) {
          score+=100;
          lasers.remove(l);
          rocks.remove(r);
        }
      }
      if (s1.intersect(r)) {
        if (!joe) {
          s1.health-=10;
          score-=100;
          // todo: add sound of explosion
          // todo: add animation of explosion
          // todo: visual effect on the ship
        }
        rocks.remove(r);
      }
      if (r.reachedBottom()) {
        rocks.remove(r);
        score -= 100;
      } else {
        if (s1.health > 1) {
          r.display();
          r.move();
        }
      }
    }

    // Rendering Lasers
    for (int i = 0; i < lasers.size(); i++) {
      Laser l = lasers.get(i);
      if (l.reachedTop()) {
        lasers.remove(l);
      } else {
        if (s1.health > 0) {
          l.display();
          l.move();
        }
      }
    }

    // Distribute Powerups
    if (powerupTimer.isFinished()) {
      powerups.add(new Powerup());
      powerupTimer.start();
    }
    // Rendering Powerups
    for (int i = 0; i < powerups.size(); i++) {
      Powerup p = powerups.get(i);
      if (s1.intersect(p)) {
        score += 200;
        powerupAcquire.stop();
        //powerupAcquire.play();
        imageMode(CENTER);
        powerupGet.resize(200, 200);
        image(powerupGet, s1.x, s1.y);
        if (p.i == 0) {
          s1.turretCount = 2;
        } else if (p.i == 1) {
          s1.turretCount = 3;
        } else if (p.i == 2) {
          s1.turretCount = 4;
        } else if (p.i == 3) {
          s1.turretCount = 5;
        } else if (p.i == 4) {
          bob = true;
          fireTimer.start();
        } else if (p.i == 5) {
          joe = true;
          shieldTimer.start();
        } else if (p.i == 6) {
          s1.health += 10;
        } else if (p.i == 7) {
          score *= 2;
        } else if (p.i == 8) {
          s1.ammo += 50;
        }
        powerups.remove(p);
      }

      if (fireTimer.isFinished()) {
        bob = false;
      }

      if (shieldTimer.isFinished()) {
        joe = false;
        shieldSound.stop();
      }

      if (p.reachedBottom()) {
        powerups.remove(p);
      } else {
        if (s1.health > 1) {
          p.display();
          p.move();
        }
      }
    }

    if (joe) {
      //shieldSound.play();
      imageMode(CENTER);
      shield.resize(200, 200);
      image(shield, s1.x, s1.y);
    }

    if (mousePressed) {
      if (bob) {
        pew.stop();
        pew.play();
        handleEvent();
      }
    }

    if (keyPressed) {
      if (bob && key == ' ') {
        pew.stop();
        pew.play();
        handleEvent();
      }
    }

    // Ship Render
    if (s1.health > 1) {
      s1.display();
      s1.move(pmouseX, pmouseY);
      if (keyPressed && keyCode == 40) {
        mouseY += 5;
      } else if (keyPressed && keyCode == 39) {
        mouseX += 5;
      } else if (keyPressed && keyCode == 38) {
        mouseY -=5;
      } else if (keyPressed && keyCode == 37) {
        mouseX -=5;
      }
    }
    // Laser Render
    //r1.display();
    //r1.move();
    if (s1.health > 1) {
      infoPanel();
    }

    if (score<0) {
      score = 0;
    }

    if (level1Timer.isFinished()) {
      finalHealth = s1.health;
      finalAmmo = s1.ammo;
      levelScore = score;
      totalScore = totalScore + (finalAmmo * 10) + (finalHealth * 100) + levelScore;
      score = 0;
      s1.ammo = 0;
      s1.health = 1;
      play = false;
      results = true;
      resultsPanel();
      noLoop();
    }
    if (s1.health <= 0) {
      gameOver();
    }
    if (levelDisplayTimer.isFinished()) {
      levelDisplay = false;
    }
  }
}
void infoPanel() {
  //resultsPage.play();
  fill(128, 127);
  rectMode(CENTER);
  rect(width/2, 25, width, 50);
  fill(255);
  textSize(30);
  textAlign(LEFT);
  text("Score: " + score, 20, 40);
  text("Ammo: " + s1.ammo, 275, 40);
  text("Health: " + s1.health, 520, 40);
}

void resultsPanel() {
  if (s1.health <= 0) {
    finalHealth = s1.health;
    finalAmmo = s1.ammo;
    levelScore = score;
    totalScore = (finalAmmo * 10) + (finalHealth * 100) + levelScore;
  }
  resultsTimer.start();
  fill(128, 127);
  rectMode(CENTER);
  textAlign(LEFT);
  rect(width/2, height/2, width - 400, height - 200);
  textSize(30);
  fill(255);
  text("HEALTH REMAINING: " + finalHealth, width/2-175, height/2-200);
  text("AMMO REMAINING: " + finalAmmo, width/2-175, height/2-100);
  text("SCORE: " + levelScore, width/2-175, height/2);
  if (finalHealth > 1 && level == 1) {
    text("END OF LEVEL 1", width/2-175, height/2-300);
    text("LEVEL SCORE: " + totalScore, width/2-175, height/2 + 100);
  } else {
    text("END SCORE: " + totalScore, width/2-175, height/2 + 100);
  }
  textSize(20);
  text("PRESS ANY BUTTON TO CONTINUE", width/2-175, height/2 +250);
  if (resultsTimer.isFinished() && mousePressed || resultsTimer.isFinished() && keyPressed) {
    if (finalHealth > 1) {
      level +=1;
    }
    resultsPage.stop();
    noLoop();
  }
}

// Adding Lasers
void mouseReleased () {
  if (s1.health > 1) {
    pew.play();
    handleEvent();
  }
}

void keyReleased () {
  if (key == ' ') {
    if (s1.health > 1) {
      pew.play();
      handleEvent();
    }
  }
}

void handleEvent() {
  // Distributing Lasers
  if (s1.fire() && s1.turretCount == 1) {
    lasers.add(new Laser(s1.x, s1.y));
  } else if (s1.fire() && s1.turretCount == 2) {
    lasers.add(new Laser(s1.x-20, s1.y));
    lasers.add(new Laser(s1.x+20, s1.y));
  } else if (s1.fire() && s1.turretCount == 3) {
    lasers.add(new Laser(s1.x, s1.y));
    lasers.add(new Laser(s1.x+20, s1.y));
    lasers.add(new Laser(s1.x-20, s1.y));
  } else if (s1.fire() && s1.turretCount == 4) {
    lasers.add(new Laser(s1.x-10, s1.y));
    lasers.add(new Laser(s1.x+10, s1.y));
    lasers.add(new Laser(s1.x+30, s1.y-10));
    lasers.add(new Laser(s1.x-30, s1.y-10));
  } else if (s1.fire() && s1.turretCount == 5) {
    lasers.add(new Laser(s1.x, s1.y));
    lasers.add(new Laser(s1.x+20, s1.y));
    lasers.add(new Laser(s1.x+40, s1.y-50));
    lasers.add(new Laser(s1.x-20, s1.y));
    lasers.add(new Laser(s1.x-40, s1.y-50));
  }
}

void startScreen() {
  intro.play();
  background(0);
  fill(255);
  textAlign(CENTER);
  textSize(50);
  text("PRESS ANY BUTTON TO START", width/2, height/2);
  if (mousePressed || keyPressed) {
    play = true;
    s1.health = 100;
    score = 0;
    s1.ammo = 1000;
    bob = false;
    joe = false;
    s1.turretCount = 1;
    intro.stop();
  }
}

void gameOver() {
  spaceField.stop();
  //gameOver.play();
  gameOverTimer.start();
  fill(255);
  textSize(100);
  textAlign(CENTER);
  text("GAME OVER", width/2, height/2);
  textSize(50);
  text("PRESS ANY BUTTON TO CONTINUE", width/2, height/2+50);
  if (mousePressed|| keyPressed) {
    resultsPanel();
    gameOver.stop();
    noLoop();
  }
}
