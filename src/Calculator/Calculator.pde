// Piper Colvin | 15 Sep 2026 | Calculator
Button[] numButtons = new Button[10];
Button[] opButtons = new Button[12];
float l, r, result;
char op;
boolean left, newEntry;
String displayVal;

void setup() {
  size(140, 228);
  l = 0.0;
  r= 0.0;
  result = 0.0;
  op = ' ';
  displayVal = "0.0";
  left = true;
  newEntry = true;
  // Num Buttons
  numButtons[0] = new Button(25, 80, 25, 25, '0');
  numButtons[1] = new Button(55, 80, 25, 25, '1');
  numButtons[2] = new Button(85, 80, 25, 25, '2');
  numButtons[3] = new Button(25, 110, 25, 25, '3');
  numButtons[4] = new Button(55, 110, 25, 25, '4');
  numButtons[5] = new Button(85, 110, 25, 25, '5');
  numButtons[6] = new Button(25, 140, 25, 25, '6');
  numButtons[7] = new Button(55, 140, 25, 25, '7');
  numButtons[8] = new Button(85, 140, 25, 25, '8');
  numButtons[9] = new Button(25, 170, 25, 25, '9');

  // Op Buttons
  opButtons[0] = new Button(25, 50, 25, 25, '+');
  opButtons[1] = new Button(55, 50, 25, 25, '-');
  opButtons[2] = new Button(85, 50, 25, 25, 'x');
  opButtons[3] = new Button(115, 50, 25, 25, '/');
  opButtons[4] = new Button(115, 80, 25, 25, ' ');
  opButtons[5] = new Button(115, 110, 25, 25, '.');
  opButtons[6] = new Button(115, 140, 25, 25, '±');
  opButtons[7] = new Button(55, 170, 25, 25, '%');
  opButtons[8] = new Button(85, 170, 25, 25, ' ');
  opButtons[9] = new Button(115, 170, 25, 25, '√');
  opButtons[10] = new Button(32, 200, 40, 25, '=');
  opButtons[11] = new Button(92, 200, 70, 25, 'C');
}

void draw() {
  background(255, 229, 245);
  drawDisplay();
  for (int i = 0; i < numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].mouseOver(mouseX, mouseY);
  }
  for (int i = 0; i < opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].mouseOver(mouseX, mouseY);
  }
}

void drawDisplay() {
  rectMode(CENTER);
  fill(229, 134, 185);
  stroke(183, 107, 148);
  rect(width/2, 15, 115, 30, 5);
  fill(255);
  textAlign(RIGHT);
  textSize(15);
  text(displayVal, width-20, 20);
}

void mouseReleased() {
  // Number buttons
  for (int i = 0; i < numButtons.length; i++) {
    if (numButtons[i].hover) {
      handleEvent(numButtons[i].val, true);
    }
  }
  // Op buttons
  for (int i = 0; i < opButtons.length; i++) {
    if (opButtons[i].hover) {
      handleEvent(opButtons[i].val, false);
    }
  }
}


// Loop through op buttons
//for (int i =0; i < opButtons.length; i++) {
//if (opButtons[i].hover == true) {
//  if (opButtons[i].val == '=') {
//    // Perform a calculation
//    preformCalc();
//  } else if (opButtons[i].val == '+') {
//    displayVal = str(opButtons[i].val);
//    left = !left;
//    op = opButtons[i].val;
//  } else if (opButtons[i].val == '-') {
//    displayVal = str(opButtons[i].val);
//    left = !left;
//    op = opButtons[i].val;
//  } else if (opButtons[i].val == '/') {
//    displayVal = str(opButtons[i].val);
//    left = !left;
//    op = opButtons[i].val;
//  } else if (opButtons[i].val == 'x') {
//    displayVal = str(opButtons[i].val);
//    left = !left;
//    op = opButtons[i].val;
//  }
//}

// Display var
{
  println("L:" +  l);
  println("R:" +  r);
  println("Result:" +  result);
  println("left:" +  left);
  println("op:" +  op);
}

void preformCalc() {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == '/') {
    result = l/r;
  } else if (op == 'x') {
    result = l * r;
  }
  displayVal = str(result);
  left = !left;
  l=result;
  r=0.0;
}

void keyPressed() {
  println("keyCode: " + keyCode);
  if (keyCode == 49 || keyCode == 97) {
    handleEvent('1', true);
  } else if (keyCode == 50) {
    handleEvent('2', true);
  } else if (keyCode == 51) {
    handleEvent('3', true);
  } else if (keyCode == 52) {
    handleEvent('4', true);
  } else if (keyCode == 53) {
    handleEvent('5', true);
  } else if (keyCode == 61) {
    handleEvent('+', false);
  } else if (keyCode == 10) {
    handleEvent('=', false);
  } else if (keyCode == 8) {
    handleEvent('C', false);
  } else if (keyCode == 45) {
    handleEvent('-', false);
  } else if (keyCode == 88) {
    handleEvent('x', false);
  } else if (keyCode == 47) {
    handleEvent('/', false);
  } else if (keyCode == 46) {
    handleEvent('.', false);
  } else if (keyCode == 92) {
    handleEvent('±', false);
  } else if (keyCode == 80) {
    handleEvent('%', false);
  } else if (keyCode == 83) {
    handleEvent('√', false);
  } else if (keyCode == 54) {
    handleEvent('6', true);
  } else if (keyCode == 55) {
    handleEvent('7', true);
  } else if (keyCode == 56) {
    handleEvent('8', true);
  } else if (keyCode == 57) {
    handleEvent('9', true);
  } else if (keyCode == 48) {
    handleEvent('0', true);
  }
}

void handleEvent(char val, boolean isNum) {
  if (isNum == true) {
    
    // Do number stuff
    String digit = str(val);

    if (newEntry || displayVal.equals("0.0")) {
      displayVal = digit;
      newEntry = false;
    } else {
      displayVal += digit;
    }
    if (left) {
      l = float(displayVal);
    } else {
      r = float(displayVal);
    }
  } else {
    
    // Do operator stuff
    char clicked = val;

    if (clicked == '=') {
      preformCalc();
    } else if (clicked == '+' || clicked == '-' ||
      clicked == 'x' || clicked == '/') {
      op = clicked;
      left = false;
      newEntry = true;
      displayVal = str(op);
    } else if (clicked == '±') {
      if (left == true) {
        l *= -1;
        displayVal = str(l);
      } else {
        r *= -1;
        displayVal = str(r);
      }
    } else if (clicked == 'C') {
      // reset all variables
      l = 0.0;
      r= 0.0;
      result = 0.0;
      op = ' ';
      displayVal = "0.0";
      left = true;
      newEntry = true;
    } else if (clicked == '√') {
      // square root of display val
      if (left == true) {
        l = sqrt(l);
        displayVal = str(l);
      } else {
        r = sqrt(r);
        displayVal = str(r);
      }
    } else if (clicked == '.') {
      if (!displayVal.contains(".")) {
        displayVal += ".";
      }
    } else if (clicked == '%') {
      if (!displayVal.contains("%")) {
        displayVal += "%";
      }
    }
  }
}
