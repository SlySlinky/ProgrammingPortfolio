class Button {
  // Member Variables
  int x, y, w, h;
  char val;
  color c1, c2;
  boolean on, off;

  // Constructor
  Button(int x, int y, int w, int h, char val) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.val = val;
    c1 = color(#F08100);
    c2 = color(#F8A411);
    on = false;
  }

  void display() {
    if (on == true) {
      fill(c2);
    } else {
      fill(c1);
    }
    rect(x, y, w, h);
    fill(0);
    textSize(50);
    textAlign(CENTER);
    fill(#042F61);
    if (w == 60 && val != '2' && val != '√') {
      textSize(50);
      if (h == 40) {
        text(val, x+30, y+37);
      } else {
        text(val, x+30.5, y+47);
      }
    } else if (w == 40 && val != '√' && val != '2') {
      textSize(33.3);
      text(val, x+21, y+31);
    } else if (val != '√' && val != '2') {
      textSize(30);
      text(val, x+10.5, y+28);
    }
    if (val == '√') {
      textSize(33.3);
      text("√ X", (x+30), (y+32));
    }
    if (val == '2' && w == 20) {
      textSize(30);
      text('²', (x+11), (y+28));
    }
    if (val == '2' && w == 60) {
      textSize(50);
      text("2", x+30.5, y+47);
    }
  }

  void hover(int mx, int my) {
    on = (mx > x && mx < x+w && my > y && my < y+h);
  }
}
