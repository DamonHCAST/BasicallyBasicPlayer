class Enemy {
  int x, y;
  int steps; 
  boolean isAlive = true; 
  int health; 
  int w, h;
  int direction; 
  PImage pup = loadImage("gob_up.png");
  PImage pleft = loadImage("gob_left.png");
  PImage pright = loadImage("gob_right.png"); 
  PImage pdown = loadImage("gob_down.png");
  Enemy (int x1, int y1) {
    x = x1; 
    y = y1; 
    w = 20;
    h = 20; // -- wer hatte das gedacht
    direction  = 1;
    steps = 0; // initialize the steps here in the 
    // class constructor
  }
  // so make sure each variable in class Enemy 
  // makes clear that the object is being called
  // and not the class
  // i.e., add "this" to the variable where appropriate

  void chase() {
    // remember 1 = up 2 = down 3 = left 4 = right
    if (nani.y > this.y + 10) { 
      this.direction = 2;
    } else if ( nani.y < this.y - 10) {
      this.direction = 1;
    }
    if (nani.x > this.x + 30) { 
      this.direction = 4;
    } else if ( nani.x < this.x - 30) {
      this.direction = 3;
    }
  }
  void move() { 
    if (this.steps % 10 == 0) { 
      this.chase();
    }
    if (this.y < 0) { 
      this.y = height;
    } else if (this.y > height) { 
      this.y = 0;
    } else if (this.x < 0) { 
      this.x = width;
    } else if (this.x > width) { 
      this.x = 0;
    }
    if (this.direction == 1) {
      this.moveUp();
    } else if (this.direction == 2) {
      this.moveDown();
    } else if (this.direction == 3) {
      this.moveLeft();
    } else if (this.direction == 4) {
      this.moveRight();
    }
    this.steps++; // add a step everytime the enemy moves
    // We also must have the enemy call the method or it's
    // not used
  }

  void moveUp() {
    if (this.didIhitsomething()) {
      this.y += 6; 
      this.direction = 3;
      // don't get caught in a recursive loop 
      // by calling a move method in a move method
    } else {
      this.y -= 6;
    }
  }

  void moveDown() {
    if (this.didIhitsomething()) {
      this.y-= 6; 
      this.direction = 4;
    } else {
      this.y += 6;
    }
  }
  void moveLeft() {
    if (this.didIhitsomething()) {
      this.x += 6;
      this.direction = 2;
    } else {
      this.x -= 6;
    }
  }

  void moveRight() {
    if (this.didIhitsomething()) {
      this.x -= 6; 
      this.direction = 1;
    } // otherwise - go right
    else {
      this.x += 6;
    }
  }
  boolean didIhitsomething() {
    for (Rock r : rockz) {
      if (this.x+20 > r.x && this.x < r.x + 20) {
        if (this.y+20 > r.y && this.y < r.y + 20) {
          return true;
        }
      }
    }
    return false;
  }
  void display() {
    //this.move();
    if (this.direction == 1) {
      image(pup, this.x, this.y);
    } else if (this.direction == 2) {
      image(pdown, this.x, this.y);
    } else if (this.direction == 3) {
      image(pleft, this.x, this.y);
    } else if (this.direction == 4) {
      image(pright, this.x, this.y);
    }
  }
}