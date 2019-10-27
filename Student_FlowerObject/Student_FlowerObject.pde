Flower myFlower1;  // the first instance of the Flower class
Flower myFlower2;  // the second instance of the Flower class
Flower myFlower3;


float xSpeed=  random(-10, 10);
float ySpeed=  random(-10, 10);


void setup() {
  size(1600, 1000);
  int _r= 60;
  int _petals=7;
  float _x=width/2;
  float _y=height/2;
  int _pc=#FFA000;
  int offset = 350;

  myFlower2 = new Flower(_r, _petals, _x+random(-500, 500), _y+offset, _pc);
  myFlower3 = new Flower(_r, _petals, _x+random(-500, 500), _y-offset, _pc);
}

void draw() {
  int _r= 60;
  int _petals=7;
  int _pc=#FFA000;
  background(#43AF76);

  myFlower1 = new Flower(_r, _petals, mouseX, mouseY, _pc); 
  myFlower1.display();
  myFlower1.bounce();
  myFlower2.display();
  myFlower2.move2(/*5*/);
  myFlower2.bounce();
  myFlower3.display();
  myFlower3.move(/*7*/);
  myFlower3.bounce();
  //myFlower3.coloring();
}

class Flower {

  // Variables
  float ballX;
  float ballY;


  float r;       // radius of the flower petal
  int n_petals;  // number of petals 
  float x;       // x-position of the center of the flower
  float y;       // y-position of the center of the flower
  int petalColor;//hexadecimal number for the color of petals

  Flower(float temp_r, int temp_n_petals, float temp_x, float temp_y, int temp_petalColor) {
    r=temp_r;
    n_petals = temp_n_petals;
    x=temp_x;
    y=temp_y;
    petalColor=temp_petalColor;
  }

  void display () {


    fill(petalColor);
    for (float i=0; i<PI*2; i+=2*PI/n_petals) {
      //  ballX=width/2 + r*cos(i);
      //  ballY=height/2 + r*sin(i);
      ballX=x + r*cos(i);
      ballY=y + r*sin(i);
      ellipse(ballX, ballY, r, r);
    }
    fill(200, 0, 0);
    ellipse(x, y, r*1.2, r*1.2);
  }
void move () {
    x += xSpeed;
    y += ySpeed;
  }
  void move2 () {
    x += xSpeed;
    y += ySpeed;
  }
  void bounce() {
    if (x >= width-r || x<=0+r) {
      xSpeed *=-1;
    }

    if (y > height-r || y<0+r) {
      ySpeed *= -1;
    }
  }

  void coll(Flower other) {
    float d = dist(x, y, other.x, other.y);
    if (d < r*2 + other.r) {
      xSpeed *= -1;
      ySpeed *= -1;
      petalColor = int (random(#000000, #FFFFFF));
    }
  }
}
