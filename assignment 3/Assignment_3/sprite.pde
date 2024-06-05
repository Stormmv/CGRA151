enum State {LEFT, RIGHT, IDLE};
class sprite{
  PImage sprite_r;
  PImage sprite_l;
    PImage sprite_idle_r;
    PImage sprite_idle_l;
  
  //initializing variables
  State state;
    
  int runFrames=8;
  int runIdle=4;
  int idleFrames=4;
  PImage[] move_r = new PImage[runFrames];
  PImage[] move_l = new PImage[runFrames];
  PImage[] idle_r = new PImage[idleFrames];
    PImage[] idle_l = new PImage[idleFrames];
  int spriteSizex = 160;
  int spriteSizey = 160; 
  int animationFrame = 0;
  int x = 0;
  int y = 0;
  int speed = 10;
    int angle = 0;
  
  //Class initialisation
  sprite(int x, int y){
    this.x = x;
    this.y = y;
    sprite_r = loadImage("SideScroller/character/Run.png");
    sprite_l = loadImage("SideScroller/character/Run_l.png");
    sprite_idle_r = loadImage("SideScroller/character/Idle.png");
    sprite_idle_l = loadImage("SideScroller/character/Idle_l.png");
    for (int i = 0; i < runFrames; i++) {
      move_r[i] = sprite_r.get(i*spriteSizex, 0, spriteSizex, spriteSizey);
      move_l[i] = sprite_l.get(i*spriteSizex, 0, spriteSizex, spriteSizey);
    }
    for (int i = 0; i < idleFrames; i++) {
      idle_r[i] = sprite_idle_r.get(i*spriteSizex, 0, spriteSizex, spriteSizey);
      idle_l[i] = sprite_idle_l.get(i*spriteSizex, 0, spriteSizex, spriteSizey);
    }
    state = State.IDLE;
  }

  void keyPressed() {
    if (key == CODED) {
      if (keyCode == LEFT) {
        moveLeft(speed);
      }
      if (keyCode == RIGHT) {
        moveRight(speed);
      }
    }
  }
  
  //move left
  void moveLeft(int speed) {
    state = State.LEFT;
    x -= speed;
    
    //Boundaries
    if (x < 159) {
      x = 159;
    }
    //Animate
    incrementAnimation();
  }
  
  //move right
  void moveRight(int speed) {
    state = State.RIGHT;
    x += speed;
    
    //Boundaries
    if (x > 321) {
      x = 321;
    }
    //Animate
    incrementAnimation();
  }
  void moveIdle() {
    state = State.IDLE;
    incrementidle();
  }
  
  void incrementAnimation() {
    //Looping animation
    animationFrame++;
    if (animationFrame > runFrames-1) {
      animationFrame = 0;
    }
  }

  void incrementidle(){
    animationFrame++;
    if (animationFrame > idleFrames-1) {
      animationFrame = 0;
    }
  }
  
  //draw the player facing the right way
  void drawPerson() {
    if (state == State.LEFT) {
      image(move_l[animationFrame], x, y);
      angle = 270;
      } 
    if (state == State.RIGHT) {
      image(move_r[animationFrame], x, y);
      angle = 90;
    }
    if (state == State.IDLE) {
        if (angle == 90) {
            image(idle_r[animationFrame], x, y);
            if (x == 321) {
                x = 320;
            }
        } else {
            image(idle_l[animationFrame], x, y);
            if (x == 159) {
                x = 160;
            }
        }
    }
  }
}