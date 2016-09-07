float xoff1,xoff2,xoff3;
int side;
float x;
void setup(){
  size(800,800,P3D);
   //background(30,30,30);
  //blendMode(ADD);
  xoff1=0;
  xoff2=1000;
  xoff3=5000;
  side=200;
  x=0;
 
}
void draw(){
  background(30,30,30);
  stroke(255);
  shapeMode(CENTER);
  translate(width/2,height/2);
  pushMatrix();
  rotateY(PI+x);
  noFill();
  strokeWeight(3);
  box(side);
   popMatrix();
  fill(255,255);
  strokeWeight(10);
  point(map(noise(xoff1),0,1,-side/2,side/2),map(noise(xoff2),0,1,-side/2,side/2),map(noise(xoff3),0,1,-side/2,side/2));
  
  xoff1+=0.01;
  xoff2+=0.01;
  xoff3+=0.01;
  x+=0.01;

  
  
}