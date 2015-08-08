class Level {
  int levelX = 250,  //Level Dimensions
      levelY = 250;
  int maxX = 80;     //Max Room Dimensions
  int maxY = 80;
  int maxRooms = 20;  //Max Number of Rooms
  ArrayList<Room> rooms = new ArrayList<Room>();
  Room candidate;
  char[][] map;  // Map of the level
  
  Level(int feetPerSq){   
     int levelXSq = levelX/feetPerSq;
     int levelYSq = levelY/feetPerSq;
     map = new char[levelXSq][levelYSq]; // init whole level to  'o' (open)
     for(int i=0; i < (levelXSq); i++){
       for(int j=0; j < (levelYSq); j++){
         map[i][j] = 'o';
       }
     }
     //for maxRooms tries, create a room
     for(int i=0; i < maxRooms; i++){
       candidate = new Room(levelX,levelY,maxX, maxY, feetPerSq);
       //if it overlaps with an existing room, reject it.
       boolean keep = this.checkNewRoom(candidate); 
       if (keep==true){
         this.addRoom(candidate);
       }
     }  
 }  
 
  boolean checkNewRoom(Room room){
     int xposSq  = room.xpos/feetPerSq;
     int yposSq  = room.ypos/feetPerSq;
     int xposDim = room.xdim/feetPerSq;
     int yposDim = room.ydim/feetPerSq;
     // If room goes past the edge of the level, throw it out
     if ((room.xpos + room.xdim) >= levelX){
       return false;
     }
     if ((room.ypos + room.ydim) >= levelY){
       return false;
     }
     if (room.xpos == 0){
       return false;
     }
     if (room.ypos == 0){
       return false;
     }
     // If room overlaps another room, throw it out
     for (int i=xposSq; i < (xposSq + xposDim); i++){
       for (int j = yposSq; j < (yposSq +yposDim); j++){
         if (map[i][j] != 'o'){
           return false;
         }
       }
     }
     return true;  //all tests passed
  }
  
  void addRoom(Room room){
      int xposSq  = room.xpos/feetPerSq;
      int yposSq  = room.ypos/feetPerSq;
      int xposDim = room.xdim/feetPerSq;
      int yposDim = room.ydim/feetPerSq; 
      
      rooms.add( room );
      for (int i=xposSq; i < (xposDim + xposSq); i++){
        for (int j = yposSq; j < (yposDim + yposSq); j++){
          map[i][j] = 'r';
        }
      }
      addWalls(room); 
  }
  
  void addWalls(Room room){
      int xposSq  = room.xpos/feetPerSq;
      int yposSq  = room.ypos/feetPerSq;
      int xposDim = room.xdim/feetPerSq;
      int yposDim = room.ydim/feetPerSq;
      int north = yposSq - 1;
      int south = yposSq + yposDim;      
      int west = xposSq - 1;
      int east = xposSq + xposDim;

      // North wall and South Walls
      for (int i = west; i <= east; i++){  
        map[i][north]='w';        
        map[i][south]='w';
      }
      // East & West Walls
      for (int i = north; i<= south; i++){
        map[west][i]='w';
        map[east][i]='w'; 
      }
  }  
}
