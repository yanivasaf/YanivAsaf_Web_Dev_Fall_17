
// Improve Box Motion
// add background music

/* @pjs preload="thelogo.png"; */ 


float moveX;
float moveY;
float varx;
float vary;
float varinc;
boolean mp;
int changeX, changeY;
float backx,backy;

PImage music1, music2, vid1, vid2, per1, per2, logo;









Panel p1, p2, p3, p4, p5, p6, pl;


void setup() {
  music1 = loadImage("music1.png");
  music2 = loadImage("music2.png");
  vid1 = loadImage("video1.png");
  vid2 = loadImage("video2.png");
  per1 = loadImage("per1.png");
  per2 = loadImage("per2.png");
  logo = loadImage ("thelogo.png");
 

  //size(displayWidth, displayHeight, P3D);

  //for processing.js
  size(window.innerWidth, window.innerHeight, P3D);



  p1= new Panel(-100, -100, 0, 100, -100, 0, 100, 100, 0, -100, 100, 0,  0,0,200,0,200,200,0,200,     0, music1);
  p2 = new Panel(-100, -100, -200, -100, -100, 0, -100, 100, 0, -100, 100, -200,0,0,200,0,200,200,0,200 ,1, vid1);
  p3 = new Panel (-100, -100, 0, -100, -100, -200, 100, -100, -200, 100, -100, 0,  0,0,200,0,200,200,0,200,2, per1);
  p4 = new Panel (100, -100, 0, 100, -100, -200, 100, 100, -200, 100, 100, 0, 0,0,200,0,200,200,0,200, 1, vid2);
  p5 = new Panel ( 100, -100, -200, -100, -100, -200, -100, 100, -200, 100, 100, -200, 0,0,200,0,200,200,0,200, 0, music2);
  p6 = new Panel (-100, 100, -200, -100, 100, 0, 100, 100, 0, 100, 100, -200, 0,0,200,0,200,200,0,200, 2, per2);
  pl = new Panel (-50, -300, 0, 50,-300,0,50,-250,0,-50,-250,0, 0,0,100,0,100,50,0,50, 3, logo);   
    //vertex(-50, -300, 0, 0, 0);
    //vertex(150, -300, 0, 200, 0);
    //vertex(150, -200, 0, 200, 100);
    //vertex(-50, -200, 0, 0, 100);
}

void draw() {
  backx = map(mouseX, 0,width,50,200);
 
  background(int(backx));

  translate(width/2, height/2);
  pushMatrix();
  logoNoise();
  pl.display();
  pl.convert();
  pl.detect(mouseX, mouseY);
  pl.change(mp);
  popMatrix();
  moveCube();

  p1.display();
  p1.convert();
  p1.detect(mouseX, mouseY);
  p1.change(mp);
  p2.display();
  p2.convert();
  p2.detect(mouseX, mouseY);
  p2.change(mp);
  p3.display();
  p3.convert();
  p3.detect(mouseX, mouseY);
  p3.change(mp);
  p4.display();
  p4.convert();
  p4.detect(mouseX, mouseY);
  p4.change(mp);
  p5.display();
  p5.convert();
  p5.detect(mouseX, mouseY);
  p5.change(mp);
  p6.display();
  p6.convert();
  p6.detect(mouseX, mouseY);
  p6.change(mp);
}


void logoNoise() {
  varx = map(noise(varinc), 0, 1, -70, 70);
  vary = map(noise(varinc), 0, 1, -70, 70);
  translate(varx, vary);
  varinc+=0.002;
  rotateY(frameCount*0.0033);
  rotateX(frameCount*0.0043);
}

void moveCube() {
  moveX= map(mouseX, 0, width, 0, 90);
  moveY= map(mouseY, 0, height, 0, 90);
  rot();
  cubeNoise();
}

void rot() {
  //rotateX(-moveY * 0.01);
  rotateY(degrees(moveX) * 0.001);
  rotateX(degrees(moveY )* 0.001);
  rotateZ(frameCount*0.009);
  rotateX(frameCount*0.009);
}
//void rot2(){
//  rotateX(radians(changeX));
//  rotateY(radians(changeY));
//}

void cubeNoise() {
  varx = map(noise(varinc), 0, 1, -30, 300);
  vary = map(noise(varinc), 0, 1, -300, 300);
  translate(varx, vary);
  varinc+=0.003;
}


void mousePressed() {
  mp = true;
}

void mouseReleased() {
  mp = false;
}

//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
class Panel {


  float theX1, theX2, theX3, theX4, theY1, theY2, theY3, theY4; 
  boolean hover = false;
  PVector ver1, ver2, ver3, ver4;
  PVector[] vertices = new PVector[4];
  int id;
  PImage img;
  int u1,u2,u3,u4,v1,v2,v3,v4;
  int strk;






  Panel(int x1, int y1, int z1, int x2, int y2, int z2, int x3, int y3, int z3, int x4, int y4, int z4, int uu1, int vv1, int uu2, int vv2, int uu3, int vv3, int uu4, int vv4, int idd, PImage imgg ) {
    // 4 vectors that create the panel
    ver1 = new PVector(x1, y1, z1);
    ver2 = new PVector(x2, y2, z2);
    ver3 = new PVector(x3, y3, z3);
    ver4 = new PVector(x4, y4, z4);


    // 4 vectors that store the 2d coordinets
    vertices[0] = new PVector(0.0, 0.0, 0.0);
    vertices[1] = new PVector(0.0, 0.0, 0.0);
    vertices[2] = new PVector(0.0, 0.0, 0.0);
    vertices[3] = new PVector(0.0, 0.0, 0.0);
    
    // u & v values to map the texture
    
    u1 = uu1;
    u2 = uu2;
    u3 = uu3;
    u4 = uu4;
    v1 = vv1;
    v2 = vv2;
    v3 = vv3;
    v4 = vv4;
    
    strk = 200;


    //variables to store the convertion of screenX and screenY
    theX1 = 0.0;
    theX2 = 0.0;
    theX3 = 0.0;
    theX4 = 0.0;
    theY1 = 0.0;
    theY2 = 0.0;
    theY3 = 0.0;
    theY4 = 0.0;

    hover = false;

    id = idd;

    img=imgg;
  }

  void display() {
   
    hover = false;

    beginShape();
    
    texture(img);

    vertex(ver1.x, ver1.y, ver1.z, u1, v1);
    vertex(ver2.x, ver2.y, ver2.z, u2,v2);
    vertex(ver3.x, ver3.y, ver3.z, u3,v3);
    vertex(ver4.x, ver4.y, ver4.z, u4,v4);
    endShape();
  }

  void convert() {
    theX1 = screenX(ver1.x, ver1.y, ver1.z);
    theY1 = screenY(ver1.x, ver1.y, ver1.z);
    theX2 = screenX(ver2.x, ver2.y, ver2.z);
    theY2 = screenY(ver2.x, ver2.y, ver2.z);
    theX3 = screenX(ver3.x, ver3.y, ver3.z);
    theY3 = screenY(ver3.x, ver3.y, ver3.z);
    theX4 = screenX(ver4.x, ver4.y, ver4.z);
    theY4 = screenY(ver4.x, ver4.y, ver4.z);

    vertices[0].set(theX1, theY1);
    vertices[1].set(theX2, theY2);
    vertices[2].set(theX3, theY3);
    vertices[3].set(theX4, theY4);
  }

  //Thanks to jeffreythompson tutorial http://www.jeffreythompson.org/collision-detection/poly-point.php
  void detect(float mx, float my) {

    int next = 0;
    for (int current=0; current<vertices.length; current++) {


      next = current+1;
      if (next == vertices.length) next = 0;

      PVector vc = vertices[current];    // c for "current"
      PVector vn = vertices[next];       // n for "next"

      if (((vc.y > my && vn.y < my) || (vc.y < my && vn.y > my)) &&
        (mx < (vn.x-vc.x)*(my-vc.y) / (vn.y-vc.y)+vc.x)) {
        hover = !hover;
      }
    }
  }

  void change(boolean click) {
    if ((hover == true))  {
      strk = 5;
    } else {
      strk = 0;}
      
    if ((hover == true) && (click == true)) {
      switch(id) {

      case 0: 

        link("music.html");

        break;

      case 1: 

        link ("video.html");

        break;

      case 2: 

        link("performance.html");

        break;
        
      case 3:
      
      link("bio.html");
      
      break;
      }
    }
  }
}