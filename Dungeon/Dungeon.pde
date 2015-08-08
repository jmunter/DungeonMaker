Level[] levels;
int numLevels = 1;
Level currLevel;
int feetPerSq = 5;
int magnif;
Room room;

void setup(){
  size(500,500);
  levels = new Level[numLevels];
  for (int i = 0; i < numLevels; i++){
    levels[i] = new Level(feetPerSq);
  }
  currLevel = levels[0];
  magnif = 1; 
  
}

void draw(){
  background(220, 220, 220);
  for(int i=0;i<currLevel.rooms.size();i++){
    room = currLevel.rooms.get(i);
    strokeWeight(3);
//    println(room.xpos, room.ypos, room.xdim, room.ydim);
    float xpos = map(room.xpos,0,currLevel.levelX/magnif,0,width);
    float ypos = map(room.ypos,0,currLevel.levelY/magnif,0,height);
    float xdim = map(room.xdim,0,currLevel.levelX/magnif,0,width);
    float ydim = map(room.ydim,0,currLevel.levelX/magnif,0,height);
    rect(xpos, ypos, xdim, ydim);
  }
  drawBackGrid(magnif, currLevel);
}

void keyPressed(){
  if (key == CODED) {
    if (keyCode == UP && magnif > 1) {
      magnif--;
    } else if (keyCode == DOWN && magnif < 6) {
      magnif ++;
    }
  }else if (key==97){
//     for(int i=0;i<currLevel.rooms.size();i++){
//       room = currLevel.rooms.get(i);
//       float xpos = map(room.xpos,0,currLevel.levelX/magnif,0,width);
//       float ypos = map(room.ypos,0,currLevel.levelY/magnif,0,height);
//       float xdim = map(room.xdim,0,currLevel.levelX/magnif,0,width);
//       float ydim = map(room.ydim,0,currLevel.levelX/magnif,0,height);
//       println( "xpos", room.xpos, xpos, "ypos", room.ypos, ypos);
//       println( "xdim", room.xdim, xdim, "ydim", room.ydim, ydim);
//     }
   }
 } 

void mouseClicked(){
 // figure out how to center view 
}

void drawBackGrid(int magnif, Level level){
  stroke(100);
  strokeWeight(1);
  for(int i=0;i<level.levelX;i=i+feetPerSq){
    float x1 = map(i,0,(level.levelX/magnif),0,width);
    line(x1,0,x1,height);
  } 
  for(int i=0;i<level.levelY;i=i+feetPerSq){
    float y1 = map(i,0,(level.levelY/magnif),0,height);
    line(0,y1,width,y1);
  }
}
