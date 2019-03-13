//imports
Player nani; // declare Nani
int x = 0;
int x1 = 600;
int y = 0;
int y1 = 600;
int steps;
int orbsCollected;
int orbsOnScreen = 36;
int totalEnemies;
int maxEnemies = 4;
int timeStamp;
PImage tile;
PImage dead;
ArrayList <Player> nanis;
ArrayList <Rock> rockz; 
ArrayList <Enemy> munchkinz; 
ArrayList <Orb> orbz; // z because we're cool
// So now you have all the pieces for a real game
// Now you'll want to add a win condition
// maybe some other bits
// e.g. treasure. 
// a flag to win. 
// it's all about objects. one or many
// so viel zu tun

// let's make some orbs -- it's like all this 
// follows a predictable pattern

// of course only taking damage is boring
// so let's add some orbs to restore health
// it's all about problem solving -- 
/* of course we'll want to check if our player hits the
 enemy and respond accordingly */

void setup() {
  size(600, 600);
  frameRate(60);
  background(0, 0, 0);
  tile = loadImage("tile1b.png"); 
  tile.resize(200, 200);
  nani = new Player(35, 35); // initialize nani

  munchkinz = new ArrayList(); 


  //Ooops we have to initialize our arrayList
  rockz = new  ArrayList <Rock>(); 
  //Use the power of the for loop
  for (int i = 0; i < height; i += 100) {
    for (int j = 0; j < width; j += 100) { 
      // you can play with this to move the rocks apart
      rockz.add(new Rock(j, i));
    }
  }
  orbz = new ArrayList <Orb> (); //initialize as with enemy and rockz
  for (int i = 45; i < height; i += 100) {
    for (int j = 45; j < width; j += 100) { 
      orbz.add(new Orb(j, i));
    }
  }
  println("Game Started.");
}
void draw() {
  // we decide in void draw what happens
  /// hint hint check the player's health e.g. if (playername.health > 0){
  background(0, 0, 0);
  steps++;
  for (int i = 0; i< 3; i++) {
    for (int j = 0; j< 3; j++) {
      image(tile, i * 200, j*200);
      //et voila we have a background
    }
  }
  if (keyPressed) {
    if (keyCode == UP) {
      nani.moveUp();
    } else if (keyCode == DOWN) {
      nani.moveDown();
    } else if (keyCode == LEFT) {
      nani.moveLeft();
    } else if (keyCode == RIGHT) {
      nani.moveRight();
    }
  }
  //We'll want to use the ArrayList to display things
  for (Rock r : rockz) {
    r.display();
  }
  for (Enemy e : munchkinz) {
    e.move();
  }
  for (Enemy e : munchkinz) {
    e.display();
  } // now show the orbz
  for (Orb o : orbz) {
    o.display();
  }

  int passedTime = millis() - timeStamp;
  // we can display the munchkinz in the same way
  if (passedTime >= random(5000, 20000) && totalEnemies < maxEnemies) {
    munchkinz.add(new Enemy(0, width));
    totalEnemies++;
    timeStamp = millis();
  }
  nani.display(); // display nani
  pushStyle();
  noStroke();
  fill(30, 40, 90, 200);
  rect(0, height-30, width, 30);
  fill(255);
  textSize(22);
  text("Orbs: " + orbsCollected, 10, height-5); 
  text("Health: " + nani.health, width-200, height-5);
  popStyle();
  if (orbsOnScreen <= 0) {
    orbz = new ArrayList <Orb> ();
    for (int i = 45; i < height; i += 100) {
      for (int j = 45; j < width; j += 100) { 
        orbz.add(new Orb(j, i));
      }
    }
    orbsCollected += 10;
    nani.health += 10;
    orbsOnScreen = 36;
    println("New board! 10 orb bonus! Health = " + nani.health);
  }
  if (!nani.isAlive) { // this isn't dead code if you add a not lose condition
    // if the player has no health 
    // the end 
    textSize(40); 
    fill(255, 255, 255); 
    text("GAME OVER!\nOrbs Collected: " + orbsCollected, 20, 200);
    println("Game Over! :(");
    dead = loadImage("nani_dead.png");
    image(dead, nani.x, nani.y);
    noLoop();
  }
}
// end void draw()
//Now we need to copy the player class
// click on the curly bracket to see where it begins
// so we go to the curly bracket that was just highlighted

// Our orbs can be a lot like rocks
// waste not want not
// copy & paste 
