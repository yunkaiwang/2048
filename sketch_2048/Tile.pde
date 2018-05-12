class Tile {
  private PVector pos;
  private int num; // the number that the current tile owns, -1 if current tile owns no number
  private boolean added;
  
  Tile(int x, int y) {
    pos = new PVector(x, y);
    num = -1;
    added = false;
  }
  
  public boolean isAdded() {
    return added;
  }
  
  public void setAdded() {
    added = true;
  }
  
  public void resetAdded() {
    added = false;
  }
  
  public boolean filled() {
    return num != -1;
  }
  
  public int getNum() {
    return num;
  }
  
  public void setNum(int newNum) {
    num = newNum;
  }
  
  void show() {
    // if no number in current tile, display nothing
    if (num == -1)
      return;
    
    fill(255);
    textSize(30);
    textAlign(CENTER, CENTER);
    text(num, pos.x * 100 + 250, pos.y * 100 + 50);
    
  }
  
  PVector pos() {
    return pos;
  }
}