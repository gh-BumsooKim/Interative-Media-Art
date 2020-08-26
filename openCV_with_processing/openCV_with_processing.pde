import processing.video.*;
import gab.opencv.*;
import java.awt.*;

void setup() {
  size(640, 480);
  cam = new Capture(this, 640, 480);
  opencv = new OpenCV(this, 640, 480);

  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);

  cam.start();
}

Capture cam;
OpenCV opencv;
Rectangle[] faces;

void draw() {
  //scale(2);
  opencv.loadImage(cam);

  image(cam, 0, 0);

  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);

  faces = opencv.detect();

  for (int i=0; i<faces.length; i++) {
    rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
  }
}

void captureEvent(Capture c){
   c.read(); 
}
