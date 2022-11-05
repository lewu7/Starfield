Particle[] arr;
float faster;
OddBall bob;

void setup(){
  size(800,800);
  
  bob = new OddBall();
  arr = new Particle[400];
  for(int i = 10; i < arr.length; i++){
    arr[i] = new OddBall();
  }
  for(int i = 0; i < arr.length; i++){
    arr[i] = new Particle();
  }
}
//----------------------------------------------------------------
class Particle{ 
  double myX, myY, myAngle, mySpeed;
  int myColor;
  float z, r;
  
  Particle(){
    myColor = color((int)(Math.random()*30+30), (int)(Math.random()*900+100), (int)(Math.random()*150+120));
    myX = (Math.random()*1200) - 600;
    myY = (Math.random()*1200) - 600;
    myAngle = Math.random()*2*Math.PI;
    mySpeed = Math.random()*10;
    z = (float)(Math.random()*600);
    
  }
  void burst(){
    /*myX = myX + (Math.cos(myAngle) * mySpeed);
    myY = myY + (Math.sin(myAngle) * mySpeed);*/
    z -= faster * 0.5;
    if(z < 1){
      z = width;
    }
  }
  void show(){
    fill(myColor);
    noStroke();
    float x = map((float)myX/z, 0, 1, 0, width);
    float y = map((float)myY/z, 0, 1, 0, height);
    
    r = map(z, 0, width, 20, 0);
    ellipse(x, y, r, r);
  }
  
} //end of particle class 
//----------------------------------------------------------------
class OddBall extends Particle{
  OddBall(){ 
    myX = (Math.random()*600) - 300;
    myY = (Math.random()*600) - 300;
    //myX = myY = 0;
    myColor = color(182,185,185);
    myAngle = Math.random()*2*Math.PI;
    mySpeed = Math.random()*7;
  }
  void burst(){
    myX = myX + (Math.cos(myAngle) * mySpeed);
    myY = myY + (Math.sin(myAngle) * mySpeed);
    }
  void show(){
    rotate(radians(-r));
    r = r + 1;
    fill(myColor);
    ellipse((float)myX, (float)myY, 70, 70);
    fill(162,165,164);
    ellipse((float)myX - 16, (float)myY - 6, 25, 30);
    ellipse((float)myX , (float)myY + 16, 20, 20);
  }
}
//----------------------------------------------------------------
void draw(){
  fill(0, 40);
  rect(0,0,800,800);
  translate(width/2, height/2); 
  faster = map(mouseX, 0, width, 0, 30);
  for(int i = 0; i < arr.length; i++){
    arr[i].show();
    arr[i].burst();
  }
  bob.burst();
  bob.show();
  //System.out.println(mouseX);
  //System.out.println(mouseY);
}




