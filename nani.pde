class Player {
  int x, y;
  boolean isAlive = true; 
  int health = 100; 
  int w, h;
  int direction; 
  int steps;
  PImage pup = loadImage("nani_up_1.png");
  PImage pleft = loadImage("nani_left_1.png");
  PImage pright = loadImage("nani_right_1.png"); 
  PImage pdown = loadImage("nani_down_1.png");
  Player (int x1, int y1) {
    x = x1; 
    y = y1; 
    direction = 2;
  }

  boolean didIhitsomething() {
    // this only effects the player so we
    // can set it up in the player class
    for (Orb o : orbz) {
      if (this.x+30 > o.x && this.x < o.x + 30) {
        if (this.y+30 > o.y && this.y < o.y + 30) {
          // only get health if the orb is visible
          if (o.isVisible) {
            // and make the orb disappear
            o.isVisible = false;
            orbsCollected++;
            orbsOnScreen--;
            health += 1;
            println("Player obtained orb! Health = " + health);
          }
        }
      }
    } // end the orbz for loop
    for (Enemy e : munchkinz) {
      if (this.x+20 > e.x && this.x < e.x + 20) {
        if (this.y+20 > e.y && this.y < e.y + 20) {
          if (e.direction == 1) {
            this.y -= 4; // bounce up if the enemy is moving up
            //also decrease health
          } else if (e.direction == 2) {
            this.y += 4; // bounce down if the enemy is moving down
          } else if (e.direction == 3) {
            this.x += 4; // bounce right if the enemy is moving right
          } else if (e.direction == 4) { // -- wer hatte das gedacht
            this.x -= 4; // bounce left if the enemy is moving left
          }
          health -= 1;
          println("Player got hurt! Health = " + health);
          return true;
          // health should only be reduced a
          // when done checking
        } // y if statement ends here
      }// x if statement ends here
    }// enemy for loop ends here
    for (Rock r : rockz) {
      if (this.x+20 > r.x && this.x < r.x + 20) {
        if (this.y+20 > r.y && this.y < r.y + 20) {
          return true;
          }
        }
      }
    return false;
  }
  void move() { 
    if (this.y < 0) { 
      this.y = height - 30;
    } else if (this.y > height - 30) { 
      this.y = 0;
    } else if (this.x < 0) { 
      this.x = width - 30;
    } else if (this.x > width - 30) { 
      this.x = 0;
    }
//    if (direction == 1) {
  //    this.moveUp();
    //} else if (direction == 2) {
      //this.moveDown();
    //} else if (direction == 3) {
      //this.moveLeft();
    //} else if (direction == 4) {
      //this.moveRight();
    //}
    this.didIhitsomething();
    //We have to call our method or it's never used
    if (health <= 0) {
      isAlive = false;
    }
  }
  void moveUp() {
    if (this.didIhitsomething()) {
      this.y += 6; 
      // don't get caught in a recursive loop 
      // by calling a move method in a move method
    } else {
      this.y -= 6;
      this.direction = 1;
    }
  }
  void moveDown() {
    if (this.didIhitsomething()) {
      this.y-= 6; 
    } else {
      this.y += 6;
      this.direction = 2;
    }
  }
  void moveLeft() {
    if (this.didIhitsomething()) {
      this.x += 6;
    } else {
      this.x -= 6;
      this.direction = 3;
    }
  }

  void moveRight() {
    if (this.didIhitsomething()) {
      this.x -= 6; 
    } // otherwise - go right
    else {
      this.x += 6;
      this.direction = 4;
    }
  }

  void display() {
    // but we should show our player's health
    // we can also base what happens in the game based on
    // our player's health
    // let's only show the game if the player is alive
    
    this.move();
    if (this.steps % 10 == 0) {
      this.chase();
    }
    if (direction == 1) {
      image(pup, x, y);
    } else if (direction == 2) {
      image(pdown, x, y);
    } else if (direction == 3) {
      image(pleft, x, y);
    } else if (direction == 4) {
      image(pright, x, y);
    }
    this.steps++;
  }
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
}
