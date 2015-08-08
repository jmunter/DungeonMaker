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
     if (r > .9){
       return 'X';
     } else {
       return ' ';
     }
   }
 }
