class Rock {
  int x, y;
  int w = 20;
  int h =20;
  PImage rock = loadImage("rock.png");
  Rock (int x1, int y1) {
    x = x1; 
    y = y1;
  } 
  // no movement but display
  void display() {
    image(rock, x, y);
  }
}