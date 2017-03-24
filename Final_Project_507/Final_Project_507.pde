//global variables
int wide = 600; //canvas width
int tall = 600; //canvas height
int s = 50; //player size
float speed = 1; //player movement speed

//colors
int redColor = #CB4646; //player 1 color
int blueColor = #4652CB; //player 2 color
int backgroundColor = #DBE3B3; //background color
float player1X = 600/3-s;  //HOW COME width/3 DOESN'T WORK??????????
float player2X = 600*2/3;
float playerY = 600/2-(s/2);

//players
Player player1 = new Player(player1X, playerY, s, speed, "wasd", redColor); //player 1

/******* GAME SCREENS *******/
//0: main menu
//1: Game Screen
//2: Game-Over Screen

int gameScreen = 0;

/******* SETUP *******/
void setup(){
  //background(backgroundColor);
  size(600, 600);
  smooth();
}

/******* DRAW *******/
void draw(){
  background(backgroundColor);
  player1.usePlayer();
  
   if (gameScreen == 0) { 
      initScreen(); }
  //  } else if (gameScreen == 1) {
//      gameScreen();
 //   } else if (gameScreen == 2) {
  //    gameOverScreen();

}