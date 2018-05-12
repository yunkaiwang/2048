import java.util.Collections;

// class that represents one 2048 game
public class Game {
  private Tile[][] tiles;
  private int score;
  private int largestSoFar; // largest number of current board so far
  
  Game() {
    tiles = new Tile[4][4];
    for (int i = 0; i < 4; ++i) {
      for (int j = 0; j < 4; ++j)
        tiles[i][j] = new Tile(i, j);
    }
    for (int i = 0; i < 2; ++i)
      generateNewNum();
    score = 0;
    largestSoFar = 0;
  }
  
  public int getLargestSoFar() {
    return largestSoFar;
  }
  
  public int getScore() {
    return score;
  }
  
  public void moveUp() {
    boolean moved = false;
    for (int i = 0; i < 4; ++i) {
      for (int j = 1; j < 4; ++j) {
        if (tiles[i][j].filled()) {
          Tile current = tiles[i][j];
          for (int m = j - 1; m >= 0; --m) {
            if (!tiles[i][m].filled()) {
              tiles[i][m].setNum(current.getNum());
              current.setNum(-1);
              current = tiles[i][m];
              moved = true;
            } else {
              if (tiles[i][m].getNum() == current.getNum() &&
                  !tiles[i][m].isAdded() && !current.isAdded())
              {
                score += tiles[i][m].getNum() * 2;
                tiles[i][m].setNum(tiles[i][m].getNum() * 2);
                if (tiles[i][m].getNum() > largestSoFar)
                  largestSoFar = tiles[i][m].getNum();
                tiles[i][m].setAdded();
                current.setNum(-1);
                current = tiles[i][m];
                moved = true;
              } else
                break;
    }}}}}
    reset();
    if (moved)
      generateNewNum();
  }
  
  public void moveLeft() {
    boolean moved = false;
    for (int i = 1; i < 4; ++i) {
      for (int j = 0; j < 4; ++j) {
        if (tiles[i][j].filled()) {
          Tile current = tiles[i][j];
          for (int m = i - 1; m >= 0; --m) {
            if (!tiles[m][j].filled()) {
              tiles[m][j].setNum(current.getNum());
              current.setNum(-1);
              current = tiles[m][j];
              moved = true;
            } else {
              if (tiles[m][j].getNum() == current.getNum() &&
                  !tiles[m][j].isAdded() && !current.isAdded())
              {
                this.score += tiles[m][j].getNum() * 2;
                tiles[m][j].setNum(tiles[m][j].getNum() * 2);
                if (tiles[m][j].getNum() > largestSoFar)
                  largestSoFar = tiles[m][j].getNum();
                tiles[m][j].setAdded();
                current.setNum(-1);
                current = tiles[m][j];
                moved = true;
              } else
                break;
    }}}}}
    reset();
    if (moved)
      generateNewNum();
  }
  
  public void moveRight() {
    boolean moved = false;
    for (int i = 2; i >= 0; --i) {
      for (int j = 0; j < 4; ++j) {
        if (tiles[i][j].filled()) {
          Tile current = tiles[i][j];
          for (int m = i + 1; m < 4; ++m) {
            if (!tiles[m][j].filled()) {
              tiles[m][j].setNum(current.getNum());
              current.setNum(-1);
              current = tiles[m][j];
              moved = true;
            } else {
              if (tiles[m][j].getNum() == current.getNum() &&
                  !tiles[m][j].isAdded() && !current.isAdded())
              {
                this.score += tiles[m][j].getNum() * 2;
                tiles[m][j].setNum(tiles[m][j].getNum() * 2);
                if (tiles[m][j].getNum() > largestSoFar)
                  largestSoFar = tiles[m][j].getNum();
                tiles[m][j].setAdded();
                current.setNum(-1);
                current = tiles[m][j];
                moved = true;
              } else
                break;
    }}}}}
    reset();
    if (moved)
      generateNewNum();
  }
  
  public void moveDown() {
    boolean moved = false;
    for (int i = 0; i < 4; ++i) {
      for (int j = 2; j >= 0; --j) {
        if (tiles[i][j].filled()) {
          Tile current = tiles[i][j];
          for (int m = j + 1; m < 4; ++m) {
            if (!tiles[i][m].filled()) {
              tiles[i][m].setNum(current.getNum());
              current.setNum(-1);
              current = tiles[i][m];
              moved = true;
            } else {
              if (tiles[i][m].getNum() == current.getNum() &&
                  !tiles[i][m].isAdded() && !current.isAdded())
              {
                this.score += tiles[i][m].getNum() * 2;
                tiles[i][m].setNum(tiles[i][m].getNum() * 2);
                if (tiles[i][m].getNum() > largestSoFar)
                  largestSoFar = tiles[i][m].getNum();
                tiles[i][m].setAdded();
                current.setNum(-1);
                current = tiles[i][m];
                moved = true;
              } else
                break;
    }}}}}
    reset();
    if (moved)
      generateNewNum();
  }
  
  // show the snake on the board
  void show() {
    strokeWeight(1);
    for (int i = 0; i < 4; ++i) {
      line(200 + i * 100, 0, 200 + i * 100, 400);
      line(200, i * 100, 600, i * 100);
    }
    for (int i = 0; i < 4; ++i) {
      for (int j = 0; j < 4; ++j)
        tiles[i][j].show();
    }
  }
  
  private void reset() {
    for (int i = 0; i < 4; ++i) {
      for (int j = 0; j < 4; ++j)
        tiles[i][j].resetAdded();
    }
  }
  
  void generateNewNum() {
    ArrayList<PVector> list = new ArrayList<PVector>();
    for (int i = 0; i < 4; ++i) {
      for (int j = 0; j < 4; ++j) {
        if (!tiles[i][j].filled()) {
          list.add(new PVector(i, j));
        }
      }
    }
    
    Collections.shuffle(list);
    PVector rand = list.get(int(random(list.size())));
    tiles[int(rand.x)][int(rand.y)].setNum(random(1) < 0.3 ? 4 : 2);
  }
  
  boolean lose()
  {
    for (int m = 0; m < 3; ++m)
    {
      for (int n = 0; n < 4; ++n)
      {
        if (tiles[m][n].getNum() == tiles[m+1][n].getNum())
            return false;
        if (tiles[n][m].getNum() == tiles[n][m+1].getNum())
            return false;
      }
    }
    return true;
  }
}