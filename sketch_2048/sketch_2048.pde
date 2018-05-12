
Game game;

void setup() {
  frameRate(15);
  size(600, 400);
  game = new Game();
}

void draw() {
  background(150);
  drawData();
  game.show();
}

void drawData() {
  fill(0);
  textAlign(LEFT, LEFT);
  textSize(20);
  text("Score: " + game.getScore(), 10, 50);
  text("Largest " + game.getLargestSoFar(), 10, 100);
  text("Press r to restart", 10, 150);
}

void keyPressed() {
  switch(keyCode){
   case UP:
   case 87:
     game.moveUp();
     return;
   case DOWN:
   case 83:
     game.moveDown();
     return;
   case LEFT:
   case 65:
     game.moveLeft();
     return;
   case RIGHT:
   case 68:
     game.moveRight();
     return;
   case 82:
     game = new Game();
     return;
  }
}