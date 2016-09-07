int col, row,w,h;
int scl=10;
float[][] z;
float flying=0;

void setup(){
  size(800,800,P3D);
  w=width+1000;
  h=height+1000;
  col=w/scl;
  row=h/scl;
  z=new float[col][row];
 
  
}
void draw(){
  background(0);
  stroke(255);
  //noStroke();
  fill(color(map(noise(flying),0,1,50,255),map(noise(flying),0,1,50,255),255));
  translate(-100,-100);
  translate(width/2,height/2);
  rotateX(PI/3);
  translate(-width/2,-height/2);

 // translate()

 
  flying-=0.02;
   float yoff=flying;
  for(int y=0;y<row;y++)
  {
    float xoff=0;
  for(int x=0;x<col;x++)
  {
    z[x][y]=map(noise(xoff,yoff),0,1,-70,70);
    xoff+=0.07;
    
  }
  yoff+=0.1;
}
  
  for(int y=0;y<row-1;y++)
  {
    beginShape(TRIANGLE_STRIP);
   for(int x=0;x<col;x++)
   {
     vertex(x*scl,y*scl,z[x][y]);
     vertex(x*scl,(y+1)*scl,z[x][y+1]);
     
   }
     endShape();
  }

  
  
}