float xoff,yoff,t,inc;
void setup()
{
  size(800,800);
  xoff=0;
  yoff=0;
  t=0;
  inc=0.02;
  noiseDetail(4);
  
}
void draw()
{
  yoff=0;
  loadPixels();
  for(int y=0;y<height;y++)
  {
    xoff=0;
    for(int x=0;x<width;x++)
    {
      pixels[y*width+x]=color(int(map(noise(xoff,yoff,t),0,1,0,255)));
      xoff+=inc;
    }
    yoff+=inc;
    
  }
  updatePixels();
  t+=0.01;
  
  
  
  
}