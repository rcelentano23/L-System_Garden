import nervoussystem.obj.*;

LSystemMath LMath = new LSystemMath();
GUI GUI = new GUI();
GUIFrame frame = new GUIFrame();
int frameNum = 0;
boolean mouseTF = false;
int version = 7;
int fileCount = 0;

void setup()//this runs first before the progarm(similar to main)
{
  size(1000, 500, P3D);
  
  GUI.setUpWindow(frame, "Tree Generator V0"+version, 50, 50, 300, 260);
}

void draw()//this is a loop that draws
{
  //background(62, 115, 17);
background(0); 
fill(50, 255, 50);
stroke(50, 255, 50);
 lights();

if(mouseTF)
{
frameNum = 1;
mouseTF = false;
}
if(frameNum <=5 && frameNum > 0)
{
beginRecord("nervoussystem.obj.OBJExport", "LSystemTree_V0"+version+".0"+ fileCount +".obj");

LMath.newTree(Float.parseFloat(frame.lengthField.getText()), Float.parseFloat(frame.minLengthField.getText()), Float.parseFloat(frame.scalingField.getText()), 
              Integer.parseInt(frame.maxAngleField.getText()), Integer.parseInt(frame.minBranchesField.getText()), Integer.parseInt(frame.maxBranchesField.getText()));

endRecord();
 frameNum++;
 fileCount++;
}
}

void mouseClicked()
{
  mouseTF = true;
}
