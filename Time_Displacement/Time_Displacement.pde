/*
    This Project is Video Time Displacement Processing
*/

import processing.video.*;
Movie myMovie;

void setup() {
  size(1920, 1080, P3D);
  myMovie = new Movie(this, "lifeofvids_LEEROY.mp4");
  //myMovie.duration();
}

void draw() {
  image(myMovie, 0, 0);
}

void movieEvent(Movie m) {
  m.read();
}
