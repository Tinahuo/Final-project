int tr = 255;
int score = 0;
PFont font;

Ball ball;
Item item;

Paddle left;
Paddle right;
Paddle2 up;
Paddle2 down;

import processing.sound.*;
SoundFile knock;
SoundFile hit;
SoundFile gameO;

void setup() {
  size(800, 600);
  knock = new SoundFile(this,"knock.mp3");
  hit = new SoundFile(this,"hit.wav");
  gameO = new SoundFile(this,"gameO.mp3");
  
  ball = new Ball();
  left = new Paddle(true);
  right = new Paddle(false);
  up = new Paddle2(true);
  down = new Paddle2 (false);
  item = new Item();

  font = createFont("AndaleMono.ttf", 32);
  textFont(font);
}

void draw() {
  background(0);

  //ball.checkPaddle(left);
  ball.paddleRight(right);
  ball.paddleLeft(left);
  ball.paddleUp(up);
  ball.paddleDown(down);



  left.show();
  right.show();
  up.show();
  down.show();
  left.update();
  right.update();
  up.update();
  down.update();

  ball.touchItem(item);
  item.show();


  ball.update();
  ball.edges();
  ball.show();
  //ball.ready();
  //ball.gameOver();

  textAlign(CENTER, CENTER);
  fill(255, 255, 255, 60);
  textSize(500);
  text(score, 400, 250);
  textAlign(CORNER);
  fill(random(150, 255), random(100, 180), random(100, 200), tr);


  textSize(20);
  //text("Click anywhere to start ", random(118, 120), random(338, 340));
  text("use A,D,W,S and the arrow keys to control the paddles", random(99, 100), random(338, 340));
  text("try to hit the yellow rectangles", random(99, 100), random(358, 360));
  textSize(30);
  text("Click anywhere to start", random(99, 100), random(388, 390));
}

void mousePressed() {
  ball.reset();
}

void keyReleased() {
  left.vmove(0);
  right.vmove(0);
  up.hmove(0);
  down.hmove(0);
}

void keyPressed() {
  if (key == 'w') {
    left.vmove(-13);
  } else if (key == 's') {
    left.vmove(13);
  }

  if (key == 'a') {
    up.hmove(-13);
  } else if (key == 'd') {
    up.hmove(13);
  }

  if (key == CODED) {
    if (keyCode == UP) {
      right.vmove(-13);
    } else if (keyCode == DOWN) {
      right.vmove(13);
    }
  }

  if (key == CODED) {
    if (keyCode == LEFT) {
      down.hmove(-13);
    } else if (keyCode == RIGHT) {
      down.hmove(13);
    }
  }
}
