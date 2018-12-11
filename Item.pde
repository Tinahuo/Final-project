class Item {
  float x = random(150, 650);
  float y = random(100, 500);
  float w = 50;

  Item() {
    newItem();
  }


  void show() {
    noStroke();
    fill(230,210,110);
    rect(x, y, w, w);
    rect(x, y, w, w);
  }

  void disappear() {

    x = -100;
    y = -100;
  }
  void newItem() {
    x = random(150, 650);
    y = random(100, 500);
    rect(x, y, w, w);
  }
}
