int cinterval = 36;
int max_x, max_y;
int levelX = 125;
int levelY = 125;
int minX, minY;
int roomcount = 5;
Room[] rooms;
//Room sala_a = new Room(cinterval, max_x, max_y);
//Room sala_b = new Room(cinterval, max_x, max_y);


void setup(){
  size(504,504);
//  max_x = width / cinterval;
//  max_y = height / cinterval;
  background (220,220,220);
  minX = levelX;
  minY = levelY;

//  drawBackGrid(0); 
}

void draw(){

// sala_a.drawRoom();
 drawBackGrid(0);
// sala_a.drawDoors();
}

void mouseClicked(){
  background (220, 220, 220);
  drawBackGrid(0);
  rooms = new Room[roomcount];
  for(int i = 0; i < roomcount; i++){
    rooms[i] = new Room(cinterval, max_x, max_y);
    rooms[i].drawRoom();
  }
  
//  Room sala_a = new Room(cinterval, max_x, max_y);
//  Room sala_b = new Room(cinterval, max_x, max_y);
//  sala_a.drawRoom();
//  sala_b.drawRoom();
  drawBackGrid(0);
  for(int i = 0; i < roomcount; i++){
   rooms[i].drawDoors();
  }
//  sala_a.drawDoors();
//  sala_b.drawDoors();
}  

void drawBackGrid(int gridBegin) {
  stroke(100);
  strokeWeight(1);
  for( int i = 0; i < levelX;  i=i+5){
   float x1 =  map(i, 0, minX, 0, width); 
   line(x1, 0, x1, height);  
  }
    for(int i=0;i<levelY;i=i+5){
    float y1 = map(i, 0, minY,0,height);
    line(0,y1,width,y1);
  }
//  while( gridBegin < width) {
//    line(gridBegin, 0, gridBegin, height);
//    line(0, gridBegin, width, gridBegin);
//    gridBegin += cinterval;
//  }
}



