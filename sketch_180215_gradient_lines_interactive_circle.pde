import processing.pdf.*;
import java.util.Calendar;

int c1, c2;
int b1;

void setup() {
  size(550, 550);
  c1 = color(225, 0, 0);
}

void draw() {

  //strokeCap(SQUARE);
  smooth();
  noFill();
  background(255);
  translate(width/2, height/2);

  b1 =  (int) map(mouseX, 0, width/2, 0, 225);
  c2 = color(0, 225-b1, b1);

  int numberLines = (int) map(mouseY, 0, height, 2, 80);
  float radius = mouseX - width/2 + 0.5;
  float angle = TWO_PI/numberLines;

  strokeWeight(mouseY/20);

  beginShape();
  for (int i=0; i<=numberLines; i++) {
    float x = cos(angle*i) * radius;
    float y = sin(angle*i) * radius;
    line(0, 0, x, y);

    int step = 1000;

    for (float j=0; j<=step; j++) {
      float inter = map(j, 0, step, 0, 1);
      int c = lerpColor(c1, c2, inter);
      stroke(c);
      float stepX = x/step;
      float stepY = y/step;
      line(j*stepX, j*stepY, (j+1)*stepX, (j+1)*stepY);
    }
  }
  endShape();
}