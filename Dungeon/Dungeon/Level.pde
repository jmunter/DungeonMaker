class Level {
  int levelX = 250,
      levelY = 250;
  int maxX = 80;
  int maxY = 80;
  int maxRooms = 20;
  ArrayList<Room> rooms = new ArrayList<Room>();
  Room candidate;
  char[][] map;
  
  Level(int feetPerSq){   
   // assign 'o' (open) to all squares in level
   map = new char[levelX/feetPerSq][levelY/feetPerSq];
   for(int i=0;i<(levelX/feetPerSq);i++){
     for(int j=0;j<(levelY/feetPerSq);j++){
       map[i][j] = 'o';
     }
   }
   //for maxRooms tries, create a room
   for(int i=0;i<maxRooms;i++){
     candidate = new Room(levelX,levelY,maxX, maxY, feetPerSq);
     //if it overlaps with an existing room, reject it.
     boolean keep = this.checkNewRoom(candidate); 
     if (keep==true){
       this.addRoom(candidate);
     }
   }  
   for(int i=0;i<levelX/feetPerSq;i++){
     string curRow;
     for(int j=0;j<levelY/feetPerSq;j++){
       curRow = curRow + map[i][j];
     }
   }  
  }  
  boolean checkNewRoom(Room room){
   if ((room.xpos + room.xdim) > levelX){
     return false;
   } else if ((room.ypos + room.ydim) > levelY){
     return false;
   }
    for (int i=room.xpos/feetPerSq; i < (room.xdim/feetPerSq + room.xpos/feetPerSq); i++){
      for (int j = room.ypos/feetPerSq; j < (room.ydim/feetPerSq + room.ypos/feetPerSq); j++){
        if (map[i][j] != 'o'){
          return false;
        }
      }
    }
    return true;
  }
  void addRoom(Room room){
    rooms.add( room );
    println(room.xpos/feetPerSq, room.xdim/feetPerSq+room.xpos/feetPerSq, levelX/feetPerSq);
    for (int i=room.xpos/feetPerSq; i < (room.xdim/feetPerSq + room.xpos/feetPerSq); i++){
      for (int j = room.ypos/feetPerSq; j < (room.ydim/feetPerSq + room.ypos/feetPerSq); j++){
        map[i][j] = 'r';
      }
    }
    addWalls(room); 
  }
  void addWalls(Room room){
    int n = room.ypos/feetPerSq - feetPerSq;
    int e = room.xpos/feetPerSq - feetPerSq;
    int s = room.ypos/feetPerSq + room.ydim/feetPerSq + feetPerSq;
    int w = room.ypos/feetPerSq + room.xdim/feetPerSq + feetPerSq;
    // North wall
    if( n > 0 || n == 0){
      for (int i=room.xpos/feetPerSq;i<room.xdim/feetPerSq+room.xpos/feetPerSq;i++){ 
        map[i][n]='w';
      }
      // NE corner
      if (e>0||e==0){
        map[e][n] = 'w';
      }
      // NW corner
      if (w<levelX/feetPerSq || w == levelX/feetPerSq){
        map[w][n] = 'w';
      }
    }
    //East Wall
    if (e>0||e==0){
      for (int i=room.ypos/feetPerSq;i<room.ydim/feetPerSq+room.ypos/feetPerSq;i++){
        map[e][i] = 'w';
      }
    }
    //South Wall
    if (s<levelY/feetPerSq||s==levelY/feetPerSq){
      for (int i=room.xpos/feetPerSq;i<room.xdim/feetPerSq+room.xpos/feetPerSq;i++){
        map[i][s] = 'w';
      }
      //SE corner
      if (e>0||e==0){
        map[e][s] = 'w';
      }
      // SW corner
      if (w<levelX/feetPerSq || w == levelX/feetPerSq){
        map[w][s] = 'w';
      }
    }
    //West Wall
    if (w<levelX/feetPerSq||w == levelX/feetPerSq){
      for (int i=room.ypos/feetPerSq;i<room.ydim/feetPerSq+room.ypos/feetPerSq;i++){
        map[w][i] = 'w';
      }
    }
 
 
  }  
}
