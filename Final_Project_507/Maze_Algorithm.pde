// Simple 2D Maze Creator
// by Yoruk, taken from on old QBasic code made by me
// Published on the Instructables website, June 2014
// send comments to yoruk16_72  at yahoo dot fr


//memory allocations

int M;
int N;
int X;
int Y;
int K;
int Dir;
int Ka;

int[][] L ;  //the maze
boolean[][] pDR; //right walls
boolean[][] pDS; //down walls


boolean CaseTrouvee ;

boolean PasContreUnbord;

int Xdep ;
int Ydep ;

boolean Possibilite ;

boolean GenerationTerminee;


void setup() {

    size(640, 480); //window size in pixels

    M=30; //maze size : columns
    N=30; //rows


    pDR = new boolean[M+5][N+5];
    pDS = new boolean[M+5][N+5];
    L = new int[M+5][N+5];

    for (int i = 1; i <= N; i = i+1) {
        for (int j = 1; j <= M; j = j+1) {
            pDR[j][i] = true ;  //close every walls
            pDS[j][i] = true;
        }
    }

    X = 1;
    Y = 1 ; //start coordinates. Don't touch !
    Xdep = X;
    Ydep = Y;
    K = 1 ;

    L[X][Y] = K;

    GenerationTerminee=false;

    while (GenerationTerminee==false) {

        print("debut boucle  X:");
        print(X);
        print(" Y:");
        print(Y);
        print(" K:");
        println(K);        

        //exec ok

        // ligne 5

        //check if there is a possibility around the actual cell
        Possibilite = false;

        if (X < M ) { 
            if (L[X + 1][Y] == 0) { 
                Possibilite = true;
            }
        }

        if (X > 1 ) {
            if (L[X - 1][Y] == 0 ) { 
                Possibilite = true;
            }
        }  

        if (Y < N ) { 
            if (L[X][Y + 1] == 0) { 
                Possibilite = true;
            }
        } 

        if (Y > 1) {
            if (L[X][Y - 1] == 0) { 
                Possibilite = true;
            }
        } 


        if (Possibilite==true) {

            println("possibilite vraie");

            CaseTrouvee = false;

            while (CaseTrouvee == false) {

                Dir = int(random(4))+1;  //1 up   2 right   3 down   4 left  

                print("On tente direction : ");
                println(Dir);

                //check if the cell is visited or if it is near a boundary 
                switch (Dir) { 

                case 1:                         
                    if (L[X][ Y - 1] == 0 && Y !=1 ) {
                        pDS[X][Y - 1] = false; //open the wall
                        Y = Y - 1;   
                        CaseTrouvee=true;
                    }                
                    break;

                case 2:
                    if (L[X + 1][ Y] == 0  && X !=M) {
                        pDR[X][Y] = false; 
                        X = X + 1; 
                        CaseTrouvee=true;
                    }
                    break;

                case 3:
                    if (L[X][Y + 1] == 0  && Y !=N ) {
                        pDS[X][Y] = false; 
                        Y = Y + 1;  
                        CaseTrouvee=true;
                    }
                    break;

                case 4:
                    if (L[X - 1][Y] == 0  && X !=1) {
                        pDR[X - 1][Y] = false; 
                        X = X - 1;
                        CaseTrouvee=true;
                    }
                    break;
                }

                println("Cellule pas encore trouvee");
            }

            print("cellule  ok:");
            println(K);
            K = K + 1 ;//cellule cible trouvée
            L[X][Y] = K;
            Ka = K;
            print ("on est maintenant a x:");
            print(X);
            print (" y:");
            println(Y);
        }    
        else {
            //no possibility :move backwards
            Ka = Ka - 1;
            println("recul");

            for (int i = 1; i < N; i = i+1) {  
                //find previous cell
                for (int j = 1; j < M; j = j+1) {

                    if (L[j][i] == Ka) { 
                        X = i;
                        Y = j;
                        println("case precedente trouvee");
                    }
                }
            }
        }

        println("hit boucle");

        if (X == Xdep && Y == Ydep) {
            GenerationTerminee=true;
        }
    } //calculation done


        background(255);

    rectMode(CORNERS) ;

    //maze drawing

    noFill();

    int tX = (width-5) / M;
    int tY = (height-5) / N  ;//compute the step size

    if (tX > tY) { 
        tX = tY;
    }

    rect (0, 0, M * tX, N * tX) ;     //draw boundary


    for (int i = 1; i <= N; i = i+1) {  
        for (int j = 1; j <= M; j = j+1) {
            if (pDS[j][i] == true)
            { 
                line (j * tX, i * tX, j * tX - tX, i * tX) ;
            }
            if (pDR[j][i] == true) 
            {
                line (j * tX, i * tX, j * tX, i * tX - tX);
            }
        }
    }

    noLoop();  // Run once and stop
}


//file end
