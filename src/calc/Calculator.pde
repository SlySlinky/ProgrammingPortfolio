// Connor Soelberg | 31 Oct 2022 | Calculator
Button[] numButtons = new Button[10];
Button[] opButtons = new Button[12];
String dVal = "0";
boolean left = true;
float  l, r, result;
char op = ' ';

void setup () {
  size(340, 500);
  background(#0F3561);
  numButtons[0] = new Button(100, 360, 60, 60, '0');
  numButtons[1] = new Button(20, 120, 60, 60, '1');
  numButtons[2] = new Button(100, 120, 60, 60, '2');
  numButtons[3] = new Button(180, 120, 60, 60, '3');
  numButtons[4] = new Button(20, 200, 60, 60, '4');
  numButtons[5] = new Button(100, 200, 60, 60, '5');
  numButtons[6] = new Button(180, 200, 60, 60, '6');
  numButtons[7] = new Button(20, 280, 60, 60, '7');
  numButtons[8] = new Button(100, 280, 60, 60, '8');
  numButtons[9] = new Button(180, 280, 60, 60, '9');
  opButtons[0] = new Button(300, 120, 20, 20, '2');
  opButtons[1] = new Button(260, 140, 40, 40, 'X');
  opButtons[2] = new Button(260, 200, 60, 40, '÷');
  opButtons[3] = new Button(260, 260, 60, 40, '−');
  opButtons[4] = new Button(260, 320, 60, 40, '×');
  opButtons[5] = new Button(260, 380, 60, 40, '+');
  opButtons[6] = new Button(260, 440, 60, 40, '=');
  opButtons[7] = new Button(20, 360, 60, 40, '√');
  opButtons[8] = new Button(180, 360, 60, 40, '.');
  opButtons[9] = new Button(20, 420, 60, 60, 'C');
  opButtons[10] = new Button(100, 440, 60, 40, '±');
  opButtons[11] = new Button(180, 420, 60, 60, '%');
}

void draw () {
  noStroke();
  fill(#20615A);
  rect(0, 0, 340, 500, 45, 45, 45, 45);
  stroke(#0F3561);
  line(0, 100, 340, 100);
  for (int i = 0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover(mouseX, mouseY);
  }
  for (int i = 0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].hover(mouseX, mouseY);
  }
  updateDisplay();
}

void keyPressed() {
  println("key: " + key);
  println("keyCode: " + keyCode);
  if (keyCode == 49 || keyCode == 97) {
    handleEvent("1", true);
  } else if (keyCode == 50 || keyCode == 98) {
    handleEvent("2", true);
  } else if (keyCode == 51 || keyCode == 99) {
    handleEvent("3", true);
  } else if (keyCode == 52 || keyCode == 100) {
    handleEvent("4", true);
  } else if (keyCode == 53 || keyCode == 101) {
    handleEvent("5", true);
  } else if (keyCode == 54 || keyCode == 102) {
    handleEvent("6", true);
  } else if (keyCode == 55 || keyCode == 103) {
    handleEvent("7", true);
  } else if (keyCode == 56 || keyCode == 104) {
    handleEvent("8", true);
  } else if (keyCode == 57 || keyCode == 105) {
    handleEvent("9", true);
  } else if (keyCode == 48 || keyCode == 96) {
    handleEvent("0", true);
  } else if (keyCode == 67 || keyCode == 8) {
    handleEvent("C", false);
  } else if (keyCode == 46 || keyCode == 110) {
    handleEvent(".", false);
  } else if (keyCode == 32) {
    handleEvent("±", false);
  } else if (keyCode == 107) {
    handleEvent("+", false);
  } else if (keyCode == 45 || keyCode == 109) {
    handleEvent("-", false);
  } else if (keyCode == 106) {
    handleEvent("×", false);
  } else if (keyCode == 47 || keyCode == 111) {
    handleEvent("÷", false);
  } else if (keyCode == 10 || keyCode == 61) {
    handleEvent("=", false);
  } else if (keyCode == 82) {
    handleEvent("sqrt", false);
  } else if (keyCode == 80) {
    handleEvent("%", false);
  } else if (keyCode == 69) {
    handleEvent("exp", false);
  } else if (keyCode == 88) {
    handleEvent("X", false);
  }

  if (keyPressed == true && opButtons[0].on || opButtons[1].on || opButtons[2].on || opButtons[3].on || opButtons[4].on || opButtons[5].on || opButtons[7].on) {
    strokeWeight(2);
  }
  if (keyPressed == true && opButtons[6].on || opButtons[9].on) {
    strokeWeight(1);
  }
}

void handleEvent(String val, boolean num) {
  if (num && dVal.length() < 21) {
    if (dVal.equals("0")) {
      dVal = val;
    } else {
      dVal += val;
    }
    if (left) {
      l = float(dVal);
    } else {
      r = float(dVal);
    }
    if (float(dVal) == int(dVal)) {
      dVal = str(int(dVal));
    }
  } else if (val.equals("C")) {
    dVal = "0";
    left = true;
    l = 0.0;
    r = 0.0;
    result = 0.0;
    op = ' ';
    if (float(dVal) == int(dVal)) {
      dVal = str(int(dVal));
    }
  } else if (val.equals(".")) {
    if (!dVal.contains(".")) {
      dVal += ".";
    }
  } else if (val.equals("±")) {
    if (left) {
      l = l*-1;
      dVal = str(l);
    } else {
      r = r*-1;
      dVal = str(r);
    }
    if (float(dVal) == int(dVal)) {
      dVal = str(int(dVal));
    }
  } else if (val.equals("+")) {
    op = '+';
    dVal = "0";
    left = false;
  } else if (val.equals("×")) {
    op = '×';
    dVal = "0";
    left = false;
  } else if (val.equals("-")) {
    op = '−';
    dVal = "0";
    left = false;
  } else if (val.equals("÷")) {
    op = '÷';
    dVal = "0";
    left = false;
  } else if (val.equals("=")) {
    performCalculation();
  } else if (val.equals("sqrt")) {
    l = sqrt(l);
    dVal = str(l);
    if (float(dVal) == int(dVal)) {
      dVal = str(int(dVal));
    }
  } else if (val.equals("%")) {
    if (left) {
      l = l/100;
      dVal = str(l);
    } else {
      r = r/100;
      dVal = str(r);
    }
    if (float(dVal) == int(dVal)) {
      dVal = str(int(dVal));
    }
  } else if (val.equals("exp")) {
      dVal = "Inpt Exp";
      op = 'e';
      left = false;
  } else if (val.equals("X")) {
  }
}
void mouseReleased() {
  for (int i = 0; i<numButtons.length; i++) {
    if (numButtons[i].on) {
      handleEvent(str(numButtons[i].val), true);
    }
  }

  for (int i = 0; i<opButtons.length; i++) {
    if (opButtons[i].on && opButtons[i].val == 'C') {
      handleEvent(str(opButtons[i].val), false);
    } else if (opButtons[i].on && opButtons[i].val == '+') {
      handleEvent("+", false);
    } else if (opButtons[i].on && opButtons[i].val == '×') {
      handleEvent("×", false);
    } else if (opButtons[i].on && opButtons[i].val == '−') {
      handleEvent("-", false);
    } else if (opButtons[i].on && opButtons[i].val == '÷') {
      handleEvent("÷", false);
    } else if (opButtons[i].on && opButtons[i].val == '=') {
      handleEvent("=", false);
    } else if (opButtons[i].on && opButtons[i].val == '.') {
      handleEvent(".", false);
    } else if (opButtons[i].on && opButtons[i].val == '%') {
      handleEvent("%", false);
    } else if (opButtons[i].on && opButtons[i].val == '2') {
      handleEvent("exp", false);
    } else if (opButtons[i].on && opButtons[i].val == 'X') {
      handleEvent("X", false);
    } else if (opButtons[i].on && opButtons[i].val == '√') {
      handleEvent("sqrt", false);
    } else if (opButtons[i].on && opButtons[i].val == '±') {
      handleEvent("±", false);
    }
  }
  println("l: " + l + " r: " + r + " op: " + op + " result: " + result);
  if (mousePressed == true && opButtons[0].on || opButtons[2].on || opButtons[3].on || opButtons[4].on || opButtons[5].on || opButtons[7].on) {
    strokeWeight(2);
  }
  if (mousePressed == true && opButtons[6].on || opButtons[9].on) {
    strokeWeight(1);
  }
}

void updateDisplay() {
  noStroke();
  fill(100);
  rect(20, 20, 300, 60, 45, 45, 45, 45);
  fill(#042F61);
  textAlign(RIGHT);
  if (dVal == "NaN") {
    dVal = "Error";
  }
  if (dVal == "Infinity") {
    dVal = "Out of Bounds";
  } else if (dVal == "-Infinity") {
    dVal = "Out of Bounds";
  }
  if (dVal.length() < 12) {
    textSize(50);
  } else if (dVal.length() < 13) {
    textSize(46);
  } else if (dVal.length() < 14) {
    textSize(42);
  } else if (dVal.length() < 15) {
    textSize(40);
  } else if (dVal.length() < 16) {
    textSize(37);
  } else if (dVal.length() < 17) {
    textSize(35);
  } else if (dVal.length() < 18) {
    textSize(33);
  } else if (dVal.length() < 19) {
    textSize(31);
  } else if (dVal.length() < 20) {
    textSize(29);
  } else {
    textSize(27);
  }
  text(dVal, width-30, 67.5);
}

void performCalculation () {
  if (op == '+') {
    result = l + r;
  } else if (op == '−') {
    result = l - r;
  } else if (op == '×') {
    result = l * r;
  } else if (op == '÷') {
    result = l / r;
  } else if (op == 'e') {
    pow(l, r);
  }
  dVal = str(result);
  l = result;
  left = true;
  if (dVal.equals("0.0")) {
    dVal.equals("0");
  }
  if (float(dVal) == int(dVal)) {
    dVal = str(int(dVal));
  }
}
