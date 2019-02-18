// Example from Partycle

import processing.video.*;

Capture video;

PImage prevFrame;

float threshold = 120;

float mX = 0;
float mY = 0;
float ave = 0;
float ballX = width/8;
float ballY = height/8;
float rsp = 5;
float posX;
float posY;


float mirrorX;
float mirrorX1;
float mirrorX2;
float mirrorX3;

int mX1 = 0;
int mY1 = 0;
int ave1 = 0;
int ballX1 = width/8;
int ballY1 = height/8;
int rsp1 = 5;
int posX1;
int posY1;

int mX2 = 0;
int mY2 = 0;
int ave2 = 0;
int ballX2 = width/8;
int ballY2 = height/8;
int rsp2 = 5;
int posX2;
int posY2;

int mX3 = 0;
int mY3 = 0;
int ave3 = 0;
int ballX3 = width/8;
int ballY3 = height/8;
int rsp3 = 5;
int posX3;
int posY3;

ParticleSystem ps;
PImage sprite;   


void setup() {

  //size(1280, 960, P2D);

  size( 640, 480, P2D);
  //frameRate(24);
  video = new Capture(this, width, height, 60);

  video.start();

  prevFrame = createImage(video.width, video.height, RGB);

  orientation(LANDSCAPE);

  sprite = loadImage("sprite.png");

  ps = new ParticleSystem(5000);

  // Writing to the depth buffer is disabled to avoid rendering
  // artifacts due to the fact that the particles are semi-transparent
  // but not z-sorted.
  hint(DISABLE_DEPTH_MASK);
}

void draw() {

  background(0);


  if (video.available()) {

    prevFrame.copy(video, 0, 0, video.width, video.height, 0, 0, video.width, video.height); 
    prevFrame.updatePixels();
    video.read();

    // }
  }
  loadPixels();
  video.loadPixels();
  prevFrame.loadPixels();


// For cycles to record the pixels.
// The screen is divided in 4:


  for (int x = 0; x < video.width/2; x ++ ) {
    for (int y = 0; y < video.height/2; y ++ ) {

      int loc = x + y*video.width;            
      color current = video.pixels[loc];      
      color previous = prevFrame.pixels[loc]; 


      float r1 = red(current); 
      float g1 = green(current); 
      float b1 = blue(current);

      float r2 = red(previous); 
      float g2 = green(previous); 
      float b2 = blue(previous);

      float diff = dist(r1, g1, b1, r2, g2, b2);


      if (diff > threshold) { 

        pixels[loc] = video.pixels[loc];
        mX += x;
        mY += y;
        posX = x;
        posY = y;
        ave++;
      } else {

        pixels[loc] = video.pixels[loc];
      }
    }
  }

  for (int x = video.width/2; x < video.width; x ++ ) {
    for (int y = 0; y < video.height/2; y ++ ) {

      int loc = x + y*video.width;            
      color current = video.pixels[loc];      
      color previous = prevFrame.pixels[loc]; 


      float r1 = red(current); 
      float g1 = green(current); 
      float b1 = blue(current);

      float r2 = red(previous); 
      float g2 = green(previous); 
      float b2 = blue(previous);

      float diff = dist(r1, g1, b1, r2, g2, b2);


      if (diff > threshold) { 

        pixels[loc] = video.pixels[loc];
        mX1 += x;
        mY1 += y;
        posX1 = x;
        posY1 = y;
        ave1++;
      } else {

        pixels[loc] = video.pixels[loc];
      }
    }
  }

  for (int x = 0; x < video.width/2; x ++ ) {
    for (int y = video.height/2; y < video.height; y ++ ) {

      int loc = x + y*video.width;            
      color current = video.pixels[loc];      
      color previous = prevFrame.pixels[loc]; 


      float r1 = red(current); 
      float g1 = green(current); 
      float b1 = blue(current);

      float r2 = red(previous); 
      float g2 = green(previous); 
      float b2 = blue(previous);

      float diff = dist(r1, g1, b1, r2, g2, b2);


      if (diff > threshold) { 

        pixels[loc] = video.pixels[loc];
        mX2 += x;
        mY2 += y;
        posX2 = x;
        posY2 = y;
        ave2++;
      } else {

        pixels[loc] = video.pixels[loc];
      }
    }
  }

  for (int x = video.width/2; x < video.width; x ++ ) {
    for (int y = video.height/2; y < video.height; y ++ ) {

      int loc = x + y*video.width;            
      color current = video.pixels[loc];      
      color previous = prevFrame.pixels[loc]; 


      float r1 = red(current); 
      float g1 = green(current); 
      float b1 = blue(current);

      float r2 = red(previous); 
      float g2 = green(previous); 
      float b2 = blue(previous);

      float diff = dist(r1, g1, b1, r2, g2, b2);


      if (diff > threshold) { 

        pixels[loc] = video.pixels[loc];
        mX3 += x;
        mY3 += y;
        posX3 = x;
        posY3 = y;
        ave2++;
      } else {

        pixels[loc] = video.pixels[loc];
      }
    }
  }

// And nom, we gotta parameters for 4 objects, in this case, variables.
// posX[] , posY[], etc.

  if (ave != 0) { 
    mX = mX/ave;
    mY = mY/ave;
  }
  if (mX > ballX + rsp/2 && mX > 50) {
    ballX+= rsp;
  } else if (mX < ballX - rsp/2 && mX > 50) {
    ballX-= rsp;
  }  
  if (mY > ballY + rsp/2 && mY > 50) {
    ballY+= rsp;
  } else if (mY < ballY - rsp/2 && mY > 50) {
    ballY-= rsp;
  }

  if (ave1 != 0) { 
    mX1 = mX1/ave1;
    mY1 = mY1/ave1;
  }
  if (mX1 > ballX1 + rsp1/2 && mX1 > 50) {
    ballX1+= rsp1;
  } else if (mX1 < ballX1 - rsp1/2 && mX1 > 50) {
    ballX1-= rsp1;
  }  
  if (mY1 > ballY1 + rsp1/2 && mY1 > 50) {
    ballY1+= rsp1;
  } else if (mY1 < ballY1 - rsp1/2 && mY1 > 50) {
    ballY1-= rsp1;
  }

  if (ave2 != 0) { 
    mX2 = mX2/ave2;
    mY2 = mY2/ave2;
  }

  if (mX2 > ballX2 + rsp2/2 && mX2 > 50) {
    ballX2+= rsp2;
  } else if (mX2 < ballX2 - rsp2/2 && mX2 > 50) {
    ballX2-= rsp2;
  }  
  if (mY2 > ballY2 + rsp2/2 && mY2 > 50) {
    ballY2+= rsp2;
  } else if (mY2 < ballY2 - rsp2/2 && mY2 > 50) {
    ballY2-= rsp2;
  }


  if (ave3 != 0) { 
    mX3 = mX3/ave3;
    mY3 = mY3/ave3;
  }
  if (mX3 > ballX3 + rsp3/2 && mX3 > 50) {
    ballX3+= rsp3;
  } else if (mX3 < ballX3 - rsp3/2 && mX3 > 50) {
    ballX3-= rsp3;
  }  
  if (mY3 > ballY3 + rsp3/2 && mY3 > 50) {
    ballY3+= rsp3;
  } else if (mY3 < ballY3 - rsp3/2 && mY3 > 50) {
    ballY3-= rsp3;
  }


 //1- Display the parciles.
 //2- We must to map the posX[] of the particles
 // cause if we get out the next background
 // the capture cam it would inverted.
 
  updatePixels();
  background(0);

  ps.update();
  ps.display();
  mirrorX = map(posX, 0, width, width, 0);
  ps.setEmitter(mirrorX, posY);

  ps.update();
  ps.display();
  mirrorX1 = map(posX1, 0, width, width, 0);
  ps.setEmitter(mirrorX1, posY1);

  ps.update();
  ps.display();
  mirrorX2 = map(posX2, 0, width, width, 0);
  ps.setEmitter(mirrorX2, posY2);

  ps.update();
  ps.display();
  mirrorX3 = map(posX3, 0, width, width, 0);
  ps.setEmitter(mirrorX3, posY3);
}
