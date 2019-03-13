class Orb {
  int x, y;
  int w = 20;
  int h =20;
  // but let's allow our orb to disappear
  // we'll want a boolean whether we can see it or not
  boolean isVisible = true; // start as true
  PImage orb = loadImage("power_orb.png"); 
  // so we add our image for the orb ^^^ 
  Orb (int x1, int y1) {
    x = x1; 
    y = y1;
    isVisible = true;
    // make sure isVisible is true
    orb.resize(30, 30); 
    // and resize the orb to a nice size ^^
  } 
  // no movement but display
  void display() {
    // only show the orb if it is visible
    // so now we need to check for intersections
    if (this.isVisible) {
      image(orb, x, y);
    }
  }
}