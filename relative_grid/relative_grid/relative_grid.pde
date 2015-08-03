int levelX = 100;
int levelY = 100;
int minX, minY;
int value = 0;
void setup(){
  size(504,504);
  background (220,220,220);
  minX = levelX;
  minY = levelY;
}

void draw(){
// drawBackGrid(backLineLoc);
  background(220,220,220);
  for( int i = 0; i < levelX;  i=i+5){
   float x1 =  map(i, 0, minX, 0, width); 
   line(x1, 0, x1, height);
  }
  for(int i=0;i<levelY;i=i+5){
    float y1 = map(i, 0, minY,0,height);
    line(0,y1,width,y1);
  }
}
void keyPressed(){
  if (key == CODED) {
    if (keyCode == UP) {
      println("UP");
    } else if (keyCode == DOWN) {
      println("DWN");
    } 
  } else {
    println("Other");
  }
// if (key == 91 ){
//   println("Bracket", byte(key));
// } else if (key == 0){
//   println ("Zero");
//   } else {
//     println("Something"); }
}


void mouseClicked(){
  if (mouseButton == LEFT) {
    minX = minX / 2;
    minY = minY / 2;
  } else if (mouseButton == RIGHT) {
    minX = minX * 2;
    minY = minY * 2;
  }
}
