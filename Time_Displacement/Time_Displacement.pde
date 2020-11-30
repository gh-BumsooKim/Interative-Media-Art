/*
    This Project is Youtube Video Player Platform Processing
    Youtube Player's Preveiw, CC, Skip, Share, etc.
*/
import processing.video.*;  //Movie controller Module
import minim.*;             //Audio controller Module
Movie myMovie;

void setup() {
  size(1920, 1080);
  myMovie = new Movie(this, "sample.mp4");
  image(myMovie, 0, 0);
}

float time=0;
boolean isPlaying = false;

void draw() {
  if(isPlaying)
  {
    myMovie.play();
    image(myMovie, 0, 0);
    
    time = millis();
    println(time/1000);  
    timebar(time);
  }
}

void timebar(float t) {
  int bar_h = 10;
  int bar_y = height - 150;
  
  //bar
  noStroke();
  fill(120,90);
  rect(0, bar_y, width, bar_h);
  
  //time bar
  fill(255,0,0, 160);
  if(bar_y < mouseY && mouseY < bar_y + bar_h)
  {    
    fill(255,0,0);
  }  
  float t_map = map(t/1000, 0,myMovie.duration(),0,width);
  rect(0, bar_y, t_map, bar_h);
  
  //time bar_Mouse up
  if(bar_y < mouseY && mouseY < bar_y + bar_h)
  {
    fill(255);
    circle(mouseX, bar_y + bar_h/2, 20);
    
    if(mousePressed)
    {
      float jump_pos =  map(mouseX, 0, width, 0, myMovie.duration());
      myMovie.jump(jump_pos);
      myMovie.play();
    }
  }  
}

void mousePressed() {
  isPlaying = true;
  fill(0);
  rect(mouseX, mouseY, 10, 10);  
}

void mouseReleased() {
}

void movieEvent(Movie m) {
  m.read();
}
