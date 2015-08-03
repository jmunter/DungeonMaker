int backLineLoc;
int cinterval = 24;

void setup(){
  size(504,504);
  background (220,220,220);
}

void draw(){
 drawBackGrid(backLineLoc);
}

void drawBackGrid(int gridBegin) {
  stroke(100);
  while( gridBegin < width) {
    line(gridBegin, 0, gridBegin, height);
    line(0, gridBegin, width, gridBegin);
    gridBegin += cinterval;
  }
}

class Room {
  int ew; //east west dimension
  int ns; //north south dimension
  int xloc;
  int yloc;
  
}
