class Paddle2 {
  float hx = width/2;
  float hy;

  float hw = 250;
  float hh = 10;

  float hxchange = 0;

  Paddle2(boolean up) {
    if (up) {
      hy = hh+40;
    } else {
      hy = height - hh - 40;
    }
  }


  void update() {
    hx += hxchange;
    hx = constrain(hx, hw/2, width-hw/2);
  }


  void hmove(float steps) {
    hxchange = steps;
  }

  void show() {
    fill(255);
    noStroke();
    rectMode(CENTER);
    rect(hx, hy, hw, hh);
  }
}
