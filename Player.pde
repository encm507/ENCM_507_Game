public class Player{

   //class variables
   float x; // x position
   float y; // y position
   int s; //size
   float speed; //speed
   String controls; //controls
   int colors; //player color
   char keyControls [] = new char [4];

   //construct
   Player(float tempX, float tempY, int tempS , float tempSpeed, String tempControls, int tempColors){
     x = tempX; 
     y = tempY; 
     s = tempS; 
     speed = tempSpeed; 
     controls = tempControls; 
     colors = tempColors; 
   }
 public void usePlayer(){

     // draw player
     fill(colors);
     rect(x, y, s, s);

     //move player
     keyPressed();
     keyReleased();

     //wraparound
     boundaries();

   }

public void keyPressed(){

     //sets controls for wasd
     if(controls == "wasd"){ 
          if(key == 'w' || key == 'W'){ 
            y -= speed; //move forwards
          } 
          if(key == 's' || key == 'S'){
            y += speed; //move backwards
          }
            if(key == 'd' || key == 'D'){
            x += speed; //move right
          }
          if(key == 'a' || key == 'A'){
            x -= speed; //move left
          }
         }

      //sets controls for arrows  
       }
       
public void keyReleased(){
          if(key != 'w' || key != 'W'){ 
            y += speed; //move forwards
          } 
          if(key != 's' || key != 'S'){
            y -= speed; //move backwards
          }
            if(key != 'd' || key != 'D'){
            x += 0; //move right
          }
          if(key != 'a' || key != 'A'){
            x -= 0; //move left
         }
  
}
    //pacman style wraparound
public void boundaries(){
     if(x == width) x = 2;
     if(y == height) y = 2;
     if(x == 0) x = width-s;
     if(y == 0) y = height-s;
    }
}