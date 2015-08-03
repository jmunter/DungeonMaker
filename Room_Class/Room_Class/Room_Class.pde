int cinterval = 36;
int max_x, max_y;
Room sala_a = new Room(cinterval, max_x, max_y);


void setup(){
  size(504,504);
  max_x = width / cinterval;
  max_y = height / cinterval;
  background (220,220,220);
  drawBackGrid(0); 
}

void draw(){
// sala_a.drawRoom();
// drawBackGrid(0);
// sala_a.drawDoors();
}

void mouseClicked(){
  background (220, 220, 220);
  drawBackGrid(0);
  Room sala_a = new Room(cinterval, max_x, max_y);
  sala_a.drawRoom();
  drawBackGrid(0);
  sala_a.drawDoors();
}  

void drawBackGrid(int gridBegin) {
  stroke(100);
  strokeWeight(1);
  while( gridBegin < width) {
    line(gridBegin, 0, gridBegin, height);
    line(0, gridBegin, width, gridBegin);
    gridBegin += cinterval;
  }
}

 class Wall {
   char dir;
   char hasDoor;
   int xpos;
   int ypos;
   
   Wall (char direction, int x, int y){
    dir = direction;
    xpos = x;
    ypos = y;
    hasDoor = this.checkForDoor( );
   }
   char checkForDoor() {
     float r = random(1);
     if (r > .8){
       return 'X';
     } else {
       return ' ';
     }
   }
 }
class Room {
 int xpos, ypos, xdim, ydim, blockdim, perimeter, doorwidth, doorthick, doorOffset;
 Wall[] walls;
 
 Room (int blocksize, int max_x, int max_y) {
  scaleRoom( blocksize);
  xpos = get_pos(0,max_x); //xpos = 3;
  ypos = get_pos(0,max_y); // ypos = 8;
  xdim = get_pos(1,max_x - xpos); // xdim = 7;
  ydim = get_pos(1,max_y - ypos); //ydim = 4;
  perimeter = xdim * 2 + ydim * 2;
  walls = new Wall[perimeter];
  determineWalls( );

 }
 void determineWalls(){
  for(int i = 0; i < xdim; i++) {  // build North Wall
    walls[i] = new Wall('N', i, 0);
  } 
  for(int i = xdim; i < ydim+xdim; i++) { // build West Wall
    walls[i] = new Wall('W', xdim, i - xdim);
  }
  for(int i = xdim+ydim; i < ydim+xdim+xdim; i++) { //build South Wall
    walls[i] = new Wall('S', i - (xdim + ydim), ydim);
  }
  for(int i = xdim+ydim+xdim; i < (xdim * 2) + (ydim * 2); i++) { // build East wall
    walls[i] = new Wall('E', 0 , i - (xdim + ydim + xdim)); 
  }
//  for(int i = 0; i < perimeter; i++) {
//    println( walls[i].dir, ", ", walls[i].xpos, ", ", walls[i].ypos, ", ", walls[i].hasDoor);
//  }   
 }
 int get_pos( int min, int max){
   int pos = int(random(min, max));
   return pos;
}
 void drawRoom( ) {
   strokeWeight(3);
   rect(xpos * blockdim, ypos * blockdim, xdim * blockdim, ydim * blockdim);
 }
 void drawDoors( ) {
  strokeWeight(2);
  for(int i = 0; i < perimeter; i++){
    if (walls[i].hasDoor == 'X'){
      if(walls[i].dir == 'N' || walls[i].dir == 'S'){
       int doorx = (xpos * blockdim) + (walls[i].xpos * blockdim) + doorOffset;
       int doory = (ypos * blockdim) + (walls[i].ypos * blockdim) - 3;
       rect(doorx, doory, doorwidth, doorthick);   
      } else {
        int doorx = (xpos * blockdim) + (walls[i].xpos * blockdim) - 3;
        int doory = (ypos * blockdim) + (walls[i].ypos * blockdim) + doorOffset;
        rect(doorx, doory, doorthick, doorwidth);
      } 
    }
  } 
 }  
 void scaleRoom(int bs) {
   blockdim = bs;
   doorwidth = (bs / 3) * 2;
   doorthick = 5;
   doorOffset = bs / 6;
 }
}
