class Score {

  void display() {
    //println(millis()/10);
    int s = millis()/10;
    stroke(0);
    fill(0);
    rect(650, 450, 600, 50);
    fill(17, 234, 65);
    text("Score: "  + s, 650, 460);
  }

  void LevelSystem() {
    int s = millis()/10;
    if (s == 0) {
      fill(0);
      text("Level 1", width/2, height/2);
    }
  }
}