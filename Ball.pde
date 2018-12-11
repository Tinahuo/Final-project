class Ball {
  float x = width/2;
  float y = height/2;
  float xspeed;
  float yspeed;
  float r = 18;


  void paddleLeft(Paddle p) {
    if (y - r < p.vy + p.vh/2 && y + r > p.vy - p.vh/2 && x - r < p.vx + p.vw/2) {
      if (x > p.vx) {
        float diff = y - (p.vy - p.vh/2);
        float rad = radians(45);
        float angle = map(diff, 0, p.vh, -rad, rad);
        xspeed = 5 * cos(angle);
        yspeed = 5 * sin(angle);
        x = p.vx + p.vw/2 + r;
        knock.play();
      }
    }
  }
  void paddleRight(Paddle p) {
    if (y - r < p.vy + p.vh/2 && y + r > p.vy - p.vh/2 && x + r > p.vx - p.vw/2) {
      if (x < p.vx) {
        float diff = y - (p.vy - p.vh/2);
        float angle = map(diff, 0, p.vh, radians(225), radians(135));
        xspeed = 5 * cos(angle);
        yspeed = 5 * sin(angle);
        x = p.vx - p.vw/2 - r;
        knock.play();
      }
    }
  }
  void paddleUp(Paddle2 p) {
    if (x - r < p.hx + p.hw/2 && x + r > p.hx - p.hw/2 && y - r < p.hy + p.hh/2) {
      if (y > p.hy+r) {
        yspeed *= -1;
        knock.play();
      }
    }
  }
  void paddleDown(Paddle2 p) {
    if (x - r < p.hx + p.hw/2 && x + r > p.hx - p.hw/2 && y + r > p.hy - p.hh/2) {
      if (y < p.hy-r) {
        yspeed *= -1;
        knock.play();
      }
    }
  }

  void touchItem(Item l) {
    if (x - r < l.x + l.w/2 && x + r > l.x - l.w/2) {
      if (y - r < l.y + l.w/2 && y + r > l.y - l.w/2) {
        yspeed*= -1;
        hit.play();
      }
    } 
    if (y - r < l.y + l.w/2 && y + r > l.y - l.w/2) {
      if (x - r < l.x + l.w/2 && x + r > l.x - l.w/2) {
        xspeed*= -1;
        hit.play();
        score= score +1;
        item.disappear();
        item.newItem();
      }
    }
  }


  void update() {
    x = x + xspeed;
    y = y + yspeed;
  }

  void reset() {
    x = width/2;
    y = height/2;

    float angle = random(-PI/4, PI/4);
    xspeed = 5 * cos(angle);
    yspeed = 5 * sin(angle);
    score = 0;
    tr = 0;

    if (random(1) < 0.5) {
      xspeed *= -1;
    }
  }

  void gameOver() {
    gameO.play();
    fill(random(150, 255), random(100, 180), random(100, 200));
    textSize(70);
    text("GAME OVER", random(115, 120), random(295, 300));
    textSize(20);
    text("Click anywhere to start again", random(118, 120), random(338, 340));
  }


  void edges() {
    if (y-r < 0 || y+r > height) {
      gameOver();
      //gameO.play();
      //reset();
    }

    if (x - r > width) {
      //gameO.play();
      gameOver();
      //reset();
    }

    if (x + r < 0) {
      //gameO.play();
      gameOver();
      // reset();
    }
  }

  void show() {
    fill(255);
    ellipse(x, y, r*2, r*2);
  }
}
