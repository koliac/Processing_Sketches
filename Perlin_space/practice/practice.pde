int col, row;
int scl = 20;
int w1,h1,w2,h2;
float xoff1,yoff1,xoff2,yoff2,zoff1,zoff2;
float[][] z;
void setup(){
  size(1000,800,P3D);
  w1=width+scl;
  h1=height/2;
  
  w2=width+scl;
  h2=height;
 z=new float[int(h1/scl)][int(w1/scl)];
}
void draw(){
  background(0);
  translate(width/2,height/2);
  rotateX(PI/4);
  translate(-width/2,-height/2,40);
  fill(0,82,102);
  stroke(255);
  
 //back wave 
 yoff1=0;
 for(int y=0;y<h1;y+=scl)
 {
   xoff1=0;
   for(int x=0;x<w1;x+=scl)
   {
     z[y][x]=map(noise(xoff1,yoff1),0,1,-1000,1000);
     xoff1+=0.005;
   }
   yoff1+=0.0005;
   zoff1+=0.00001;
 }
 for(int y=0;y<=h1;y+=scl)
 {
  
  beginShape(TRIANGLE_STRIP);
   for(int x=0;x<=w1;x+=scl)
   {
     
     vertex(x,y,z[y][x]);
     vertex(x,y+scl,z[y+scl][x]);
      
   }
 endShape();
  
 }


 

}