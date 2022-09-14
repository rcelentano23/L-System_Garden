import nervoussystem.obj.*;

LSystemMath LMath = new LSystemMath();

void setup()//this runs first before the progarm(similar to main)
{
  size(1000, 500, P3D);
  
}

void draw()//this is a loop that draws
{
  //background(62, 115, 17);
background(0); 
fill(50, 255, 50);
stroke(50, 255, 50);
 lights();
noLoop();
for(int i = 1; i <=5; i++)
{
beginRecord("nervoussystem.obj.OBJExport", "LSystemTree_V04.0"+ i +".obj");

LMath.newTree();

endRecord();
}
}