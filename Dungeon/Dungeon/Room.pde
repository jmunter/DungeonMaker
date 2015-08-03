class Room{
  int xpos, xdim;
  int ypos, ydim;
  int perimeter;
  Wall[] walls;
 Room (int maxPosX, int maxPosY, int maxDimX, int maxDimY, int squareSize){
   xpos = get_pos(0,maxPosX/squareSize);
   ypos = get_pos(0,maxPosY/squareSize);
   xdim = get_pos(2, maxDimX/squareSize);
   ydim = get_pos(2, maxDimY/squareSize);
   perimeter = xdim * 2 + ydim * 2;
   walls = new Wall[perimeter];
   determineWalls();
   xpos = xpos * squareSize;
   ypos = ypos * squareSize;
   xdim = xdim * squareSize;
   ydim = ydim * squareSize;
 } 
 
 int get_pos(int min, int max){
   int pos = int(random(min, max));
   return pos;
 }
 
 void determineWalls(){
  for(int i = 0; i < xdim; i++) {  // build North Wall
    walls[i] = new Wall('N', i, 0);
  } 
  for(int i = xdim; i < ydim+xdim; i++) { // build East Wall
    walls[i] = new Wall('E', xdim, i - xdim);
  }
  for(int i = xdim+ydim; i < ydim+xdim+xdim; i++) { //build South Wall
    walls[i] = new Wall('S', i - (xdim + ydim), ydim);
  }
  for(int i = xdim+ydim+xdim; i < (xdim * 2) + (ydim * 2); i++) { // build West wall
    walls[i] = new Wall('W', 0 , i - (xdim + ydim + xdim)); 
  }  
}
}
