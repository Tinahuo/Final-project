class Paddle {
  float vx;
  float vy = height/2;

  float vw = 10;
  float vh = 200;

  float vychange = 0;


  Paddle(boolean left) {
    if (left) {
      vx = 50;
    } else {
      vx = width - 50;
    }
  }


  void update() {
    vy += vychange;
    vy = constrain(vy, vh/2, height-vh/2);
  }


  void vmove(float steps) {
    vychange = steps;
  }


  void show() {
    fill(255);
    noStroke();
    rectMode(CENTER);
    rect(vx, vy, vw, vh);
  }
}
