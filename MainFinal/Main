import processing.sound.*;

ArrayList<Laser> lasers;
float beamSpawn;
boolean beamActive, hasRun, initiated;
boolean displaytime = false;
int luck, sec, counter, x, y, spawn, n, nStart, nCurrent, clock;
int level = 1;
int starRate = 1000;
int s = second();
String ticText = "";
float randX, direction;
float randY;
boolean ticker = false;
char m;
Ship a1;
SoundFile piratesong;
Lives lives;
Timer movetimer;
Timer powertimer; //Timer for the testing
Timer powertimer2; //Cooldown
Timer laserTimer;
Timer displaytimer;
Timer ticTimer;
Timer timer;
Powerups powerup;
Hero hero;
Mouse mouse;
Wall tw;
Wall bw;
Star[] stars;
boolean play = false;
boolean death = false;
boolean music = false;

void setup() {


  lasers = new ArrayList<Laser>();
  piratesong = new SoundFile(this, "PirateSong.mp3");
  hero = new Hero(50);
  mouse = new Mouse(50);
  //score = new Score();
  powerup = new Powerups(870, 250);
  powertimer = new Timer(1000);
  powertimer2 = new Timer(1000);
  movetimer = new Timer(1000);
  laserTimer = new Timer(1000);
  displaytimer = new Timer(10000);
  stars = new Star[150];
  a1 = new Ship(900, 250, 70, 70);
  tw = new Wall(width/2, 0, width, 200);
  bw = new Wall(width/2, 500, width, 200);  
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star(int(random(width)), int(random(height)));
  }
  x = 0;
  y = 0;
  spawn = 1;
  size(1000, 500);
  background(255);
  beamActive = false;  
  luck = 1;
  hasRun = true;
  //int s = second();
  frameRate(30);
  ticTimer = new Timer(2000);
  timer = new Timer(hero.score);
  timer.start();
  n = millis()/10;
  initiated = false;
  nCurrent = 0;
  nStart = 0;
}
void draw() {
  

  
  
  fill(255);
  rect(mouseX, mouseY, 10, 10);
  if (!initiated && play) {
    initiated = true;
    nStart = millis()/100;
  }

  nCurrent = millis()/100;
  n = nCurrent - nStart;

  hero.score = n;

  noCursor();
  background(0);



  if (!play) {
    startScreen();
    mouse.display();
  } 
  if (play) {
    gameplay();
  }
  if (death) {
    deathScreen();
  }
}

void startScreen() {

    background(0);
    textAlign(CENTER);
    textSize(20);
    fill(17, 234, 65);
  if(level == 1){
    text("Welcome to THINE SHIP GAME", width/2, height/2-80);
    text("By: Daniel Canto, Nate Payne, Nicholas Gonzalez, Silvio Santini, Sam Burnham", width/2, height/2-40);
    text("Special thanks to KANISHKA RAGULA and MR. KAPPTIE for making this game possible \n PRESS M FOR YE MUSICAL TUNES!!", width/2, height/2);
    text("Click", width/2 - 70, height/2+63);
    fill(#FF1717);
    text("HERE", width/2, height/2+63);
    fill(17, 234, 65);
    text("to start...", width/2 + 90, height/2+63);
    textSize(12);
  }
  else{
    text("Level: " + level +"\n Press to continue if you dare!", width/2, height/2);
   
  }
  if (mousePressed) {
    play = true;
    
  }
}




void keyReleased(){
  if (key == 'm') {
    music = !music;
    if(music){
      piratesong.play();
    } else {
      piratesong.stop();
    }
  }
    
}

void deathScreen(){
  background(0);
  textAlign(CENTER);
  textSize(20);
  fill(17, 234, 65);
  text("We'll rip an' burn yer Jolly Roger!! It be Game Over for yee! HarHarHar", width/2, height/2);
}
void gameplay() {
  
  //if(music){
  //  piratesong.play();
  //}
  
  hero.display();
  lives = new Lives(hero.health);

  //Level
  println("score: " + str(hero.score));
  if (hero.score % 200 == 0 && play && hero.score!=0) {
    level ++;
    fill(255);
    float tempMillis = millis();
          
          fill(255,0,0);
      textAlign(CENTER);
      text("Level: " + level, width/2, height/2);
   play = false;
   
   sec=0;
    //while(millis()<tempMillis+3000){
    //play = false; 
    //  fill(255,0,0);
    //  textAlign(CENTER);
    //  text("Level: " + level, width/2, height/2);
    //  System.out.println("Working");

    //}
    
    hero.score -=30;
  }

  //Stars
  for (int i = 0; i < stars.length; i++) {
    stars[i].move();
    stars[i].display();
  }

  //Lasers s
  if (laserTimer.isFinished()) {
    lasers.add(new Laser(a1.x, a1.y));
    lasers.add(new Laser(a1.x, a1.y+43));
    laserTimer.start();
  }

  for (int i = lasers.size()-1; i>=0; i--) {
    Laser laser = (Laser) lasers.get(i);
    laser.fire();
    laser.display();
    if (laser.reachedLeft()) {
      lasers.remove(laser);
    }
  }

  for (int j = lasers.size()-1; j>=0; j--) {
    Laser l = (Laser) lasers.get(j);
    if (dist(l.x, l.y, hero.x, hero.y) < hero.size/2) {
      hero.health-=1;
      lasers.remove(l);
      println(hero.health);
    }
  }

  //println(lasers.size());

  if (hero.health == 0) {

    death();
  }
  counter++;
  tw.display();
  if (counter>10) {
    sec++;
    counter = 0;
  }
  tw.s = sec;
  bw.display();
  bw.s = sec;
  //score.display();
  stroke(0);
  fill(0);
  rect(650, 450, 600, 50);
  fill(17, 234, 65);
  text("Score: "  + hero.score, 650, 460);
  if (powertimer2.isFinished() && !hasRun) {
    powertimer.start();
    hasRun = true;
    displaytime();
  } 
  if (powertimer.isFinished() && powertimer2.isFinished()) {  
    powertimer2.start();
    hasRun = false;
    displaytimer.start();
  }
  if (displaytime) {
    if (!displaytimer.isFinished() && spawn == 1) {
      powerup.display();
      if (mouseX > 800 && mouseX < 950 && mouseY > 24 && mouseY < 265) {
        hero.health++;
        displaytime = false;
        spawn--;
      }
    }
  }
  lives.display();
  a1.display();
  a1.movement();
  //println("top " + a1.topPosition());
  if (a1.topPosition() < tw.getBottomBoundary() ) {
    //println("horray top " + tw.getBottomBoundary() + " a1 " + a1.topPosition());
    a1.setrandom();
    a1.y +=5;
  } else if ( a1.bottomPosition() > bw.getTopBoundary() ) {
    //println("horray bottom " + bw.getTopBoundary() + " a1 " + a1.bottomPosition());
    a1.setrandom();
    a1.y -=5;
  }
  if (hero.topPosition() < tw.getBottomBoundary() ) {
    hero.health -= 1;
  } else if (hero.bottomPosition() > bw.getTopBoundary() ) {
    hero.health -= 1;
  }
  if (mouseX == a1.x && mouseY == a1.y ) {
    hero.health -= 1;
  }
}
void displaytime() {
  displaytimer.start();
  displaytime = true;
  if (displaytimer.isFinished()) {
    displaytime = false;
  }
}
void ticker() {
  ticTimer.start();
  ticker = true;
  if (ticTimer.isFinished()) {
    ticker = false;
  }
}
void death() {
  background(0);
  textAlign(CENTER);
  fill(222);
  textSize(25);
  text("Game Over! YOU LOSE CAUSE YOU SUCK!!! SUCKS TO SUCK SUCKER!!!!", width/2, height/2);
  play = false;
  death = true;
}
