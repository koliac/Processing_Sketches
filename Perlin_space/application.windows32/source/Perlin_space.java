import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Perlin_space extends PApplet {

float xoff1,xoff2,xoff3;
int side;
float x;
public void setup(){
  
   //background(30,30,30);
  //blendMode(ADD);
  xoff1=0;
  xoff2=1000;
  xoff3=5000;
  side=200;
  x=0;
 
}
public void draw(){
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
  
  xoff1+=0.01f;
  xoff2+=0.01f;
  xoff3+=0.01f;
  x+=0.01f;

  
  
}
  public void settings() {  size(800,800,P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Perlin_space" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
