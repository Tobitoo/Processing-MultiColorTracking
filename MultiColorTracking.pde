// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 16-11: Simple color tracking + MultiColorTracking Exercise

import processing.video.*;

// Variable for capture device
Capture video;

//In this sketch we would to tracking diferents colors
//in this sketch are four states (A,S,D and W)
//to press any key of them, we can click any color in the window
//and an ellipse will to track it

// A variable for the color we are searching for.
color c1; 
color c2; 
color c3; 
color c4; 

//States
int state = 0;

void setup() {
  size(320, 240);
  video = new Capture(this, width, height);
  video.start();


  //Setting various color with random parameters

  c1 = color(170, 170, 0);

  c2 = color(255, 0, 0);

  c3 = color(0, 250, 0);

  c4 = color(0, 250, 0);
}

void captureEvent(Capture video) {
  // Read image from the camera
  video.read();
}

void draw() {

  video.loadPixels();
  image(video, 0, 0);

  // Before we begin searching, the "world record" for closest color is set to a high number that is easy for the first pixel to beat.
  float worldRecord1 = 500; 
  float worldRecord2 = 500; 
  float worldRecord3 = 500; 
  float worldRecord4 = 500; 

  // XY coordinate of closest color
  int closestX1 = 0;
  int closestY1 = 0;

  int closestX2 = 0;
  int closestY2 = 0;

  int closestX3 = 0;
  int closestY3 = 0;

  int closestX4 = 0;
  int closestY4 = 0;


  // Begin loop to walk through every pixel
  for (int x1 = 0; x1 < video.width; x1 ++ ) {
    for (int y1 = 0; y1 < video.height; y1 ++ ) {
      int loc1 = x1 + y1*video.width;
      // What is current color
      color currentColor1 = video.pixels[loc1];
      float r1 = red(currentColor1);
      float g1 = green(currentColor1);
      float b1 = blue(currentColor1);
      float r2 = red(c1);
      float g2 = green(c1);
      float b2 = blue(c1);

      // Using euclidean distance to compare colors
      float d1 = dist(r1, g1, b1, r2, g2, b2); // We are using the dist( ) function to compare the current color with the color we are tracking.

      // If current color is more similar to tracked color than
      // closest color, save current location and current difference
      if (d1 < worldRecord1) {
        worldRecord1 = d1;
        closestX1 = x1;
        closestY1 = y1;
      }
    }
  }  

  for (int x = 0; x < video.width; x ++ ) {
    for (int y = 0; y < video.height; y ++ ) {
      int loc2 = x + y*video.width;
      // What is current color
      color currentColor = video.pixels[loc2];
      float r1 = red(currentColor);
      float g1 = green(currentColor);
      float b1 = blue(currentColor);
      float r2 = red(c2);
      float g2 = green(c2);
      float b2 = blue(c2);

      // Using euclidean distance to compare colors
      float d2 = dist(r1, g1, b1, r2, g2, b2); // We are using the dist( ) function to compare the current color with the color we are tracking.

      // If current color is more similar to tracked color than
      // closest color, save current location and current difference
      if (d2 < worldRecord2) {
        worldRecord2 = d2;
        closestX2= x;
        closestY2 = y;
      }
    }
  }

  for (int x = 0; x < video.width; x ++ ) {
    for (int y = 0; y < video.height; y ++ ) {
      int loc3 = x + y*video.width;
      // What is current color
      color currentColor = video.pixels[loc3];
      float r1 = red(currentColor);
      float g1 = green(currentColor);
      float b1 = blue(currentColor);
      float r2 = red(c3);
      float g2 = green(c3);
      float b2 = blue(c3);

      // Using euclidean distance to compare colors
      float d3 = dist(r1, g1, b1, r2, g2, b2); // We are using the dist( ) function to compare the current color with the color we are tracking.

      // If current color is more similar to tracked color than
      // closest color, save current location and current difference
      if (d3 < worldRecord3) {
        worldRecord3 = d3;
        closestX3= x;
        closestY3 = y;
      }
    }
  }
  for (int x = 0; x < video.width; x ++ ) {
    for (int y = 0; y < video.height; y ++ ) {
      int loc4 = x + y*video.width;
      // What is current color
      color currentColor = video.pixels[loc4];
      float r1 = red(currentColor);
      float g1 = green(currentColor);
      float b1 = blue(currentColor);
      float r2 = red(c4);
      float g2 = green(c4);
      float b2 = blue(c4);

      // Using euclidean distance to compare colors
      float d4 = dist(r1, g1, b1, r2, g2, b2); // We are using the dist( ) function to compare the current color with the color we are tracking.

      // If current color is more similar to tracked color than
      // closest color, save current location and current difference
      if (d4 < worldRecord4) {
        worldRecord4 = d4;
        closestX4= x;
        closestY4 = y;
      }
    }
  }

  // We only consider the color found if its color distance is less than 10. 
  // This threshold of 10 is arbitrary and you can adjust this number depending on how accurate you require the tracking to be.
  
  if (worldRecord1 < 10) { 
    // Draw a circle at the tracked pixel
    fill(c1);
    strokeWeight(4.0);
    stroke(0);
    ellipse(closestX1, closestY1, 16, 16);
  }
  if (worldRecord2 < 10) { 
    // Draw a circle at the tracked pixel
    fill(c2);
    strokeWeight(4.0);
    stroke(0);
    ellipse(closestX2, closestY2, 16, 16);
  }
  if (worldRecord3< 10) { 
    // Draw a circle at the tracked pixel
    fill(c3);
    strokeWeight(4.0);
    stroke(0);
    ellipse(closestX3, closestY3, 16, 16);
  }
  if (worldRecord4< 10) { 
    // Draw a circle at the tracked pixel
    fill(c4);
    strokeWeight(4.0);
    stroke(0);
    ellipse(closestX4, closestY4, 16, 16);
  }

  println("c1 =", c1);
  println("c2 =", c2);
  println("c3 =", c3);
  println("c4 =", c4);
}

void mousePressed() {

  if (state == 1) {
    int loc1 = mouseX + mouseY*video.width;
    c1 = video.pixels[loc1];
  }
  if (state == 2) {
    // Save color where the mouse is clicked in trackColor variable
    int loc2 = mouseX + mouseY*video.width;

    c2 = video.pixels[loc2];
  }
  if (state == 3) {
    // Save color where the mouse is clicked in trackColor variable
    int loc3 = mouseX + mouseY*video.width;

    c3 = video.pixels[loc3];
  }
  if (state == 4) {
    // Save color where the mouse is clicked in trackColor variable
    int loc4 = mouseX + mouseY*video.width;

    c4 = video.pixels[loc4];
  }
}

void keyPressed() {
  if (key == 'A' || key == 'a') {
    state = 1;
  }
  if (key == 'S' || key == 's') {
    state = 2;
  }
  if (key == 'D' || key == 'd') {
    state = 3;
  }
  if (key == 'W' || key == 'w') {
    state = 4;
  }
}
