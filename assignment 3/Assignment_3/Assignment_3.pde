sprite player;

PImage fore, mid, back;
PVector vfore, vmid, vback;
float leftEdge = 160, rightEdge = 320;
int spriteX = 240;
int spriteY = 220;

void setup() {
  fore = loadImage("SideScroller/background/bg_layer_1.png");
  mid = loadImage("SideScroller/background/bg_layer_2.png");
  back = loadImage("SideScroller/background/bg_layer_3.png");

  size(640, 360);
  
  vfore = new PVector(0, 0);
  vmid = new PVector(0, 0);
  vback = new PVector(0, 0);
  
  player = new sprite(spriteX, spriteY);
  frameRate(10);
}

void paraDraw(PImage img, PVector pos, float vel){
  pos.sub(vel, 0, 0);
  
  int r = (int)pos.x+img.width;

  if(r < width) image(img, r, pos.y);
  if(pos.x < width) image(img, pos.x-img.width, pos.y);  
  if(pos.x < -img.width) pos.x = width;
 
  image(img, pos.x, pos.y);
}

void draw(){
  background(255);
  if (player.x > rightEdge) {
    paraDraw(back, vback, 2);
    paraDraw(mid, vmid, 3);
    paraDraw(fore, vfore, 4);
  }
  else if (player.x < leftEdge) {
    paraDraw(back, vback, -2);
    paraDraw(mid, vmid, -3);
    paraDraw(fore, vfore, -4);
  }
  else {
    paraDraw(back, vback, 0);
    paraDraw(mid, vmid, 0);
    paraDraw(fore, vfore, 0);
  }
  if (keyPressed && key == 'a') {
    player.moveLeft(10);
  }
  if (keyPressed && key == 'd') {
    player.moveRight(10);
  }
  if (!keyPressed) {
    player.moveIdle();
  }

  player.drawPerson();
  }
