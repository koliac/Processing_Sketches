float xoff, yoff, toff;

int w,h, col, row, scl;

PImage bg;

Particle[] pList=new Particle[8000];
PVector[] flowField;
void setup()
{
background(200);
  size(1000, 700);
  
  w=width+100;
  h=height+100;
  //colorMode(HSB);
  scl=20;
  col=floor(w/scl);
  row=floor(h/scl);
  toff=0;
  flowField=new PVector[col*row];
  for (int i=0; i<pList.length; i++)
  {
    pList[i]=new Particle();
  }
  bg = loadImage("sn.jpg");
}
void draw()
{
//background(240);

  yoff=0;
  for (int y=0; y<row; y++)
  {
    xoff=0;
    for (int x=0; x<col; x++)
    {
      float angle = map(noise(xoff, yoff, toff),0,1,PI/2,PI*2);
      PVector v = PVector.fromAngle(angle);
      v.setMag(4);
      int i = x+y*col;
      flowField[i]=v;
      //if (keyPressed==true) {
      //  pushMatrix();
      //  translate(x*scl, y*scl);
      //  rotate(v.heading());
      //  stroke(255, 55);
      //  strokeWeight(2);
      //  line(0, 0, scl, 0);
      //  popMatrix();
      //}
      xoff+=0.01;
    }
    yoff+=0.01;
    toff+=0.0001;
  }


  for (int i=0; i<pList.length; i++)
  {

    pList[i].follow(flowField);
    pList[i].update();
    pList[i].edge();
    pList[i].display();
  }
}

class Particle
{
  PVector pos;
  PVector vel;
  PVector acc;
  PVector prePos;
  Particle() {
    this.pos= new PVector(random(width),random(height));
    this.vel=new PVector(0, 0);
    this.acc=PVector.fromAngle(random(TWO_PI*4));
    prePos=this.pos.copy();
  }
  public void updatePre() {
    this.prePos.x=this.pos.x;
    this.prePos.y=this.pos.y;
  }
  public void update()
  {
    updatePre();
    this.vel.add(this.acc);
    this.vel.limit(10);
    this.pos.add(this.vel);
    this.acc.mult(0);
  }
  public void applyForce(PVector force)
  {
    this.acc.add(force);
  }
  public void display()
  {
    stroke(bg.get(int(this.pos.x),int(this.pos.y)),200);
    strokeWeight(1);
    line(this.prePos.x, this.prePos.y, this.pos.x, this.pos.y);
    //updatePre();
  }
  public void follow(PVector[] flowField)
  {
    int x = floor(this.pos.x/scl);
    int y = floor(this.pos.y/scl);
    int i = x+y*col;
    if (i>col*row)
    {
      i=(col*row)-1;
    }
    if (i<0)
    {
      i=0;
    }
    PVector force = flowField[i];
    applyForce(force);
  }
  public void edge()
  {
    if (this.pos.x>width) { 
      this.pos.x=0;
      updatePre();
    }
    if (this.pos.x<0) {
      this.pos.x=width;
      updatePre();
    }
    if (this.pos.y>height) {
      this.pos.y=0;
      updatePre();
    }
    if (this.pos.y<0) { 
      this.pos.y=height;
      updatePre();
    }
  }
}