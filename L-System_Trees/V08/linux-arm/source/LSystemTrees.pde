import nervoussystem.obj.*;

LSystemMath LMath = new LSystemMath();
GUI GUI = new GUI();
GUIFrame frame = new GUIFrame();
int frameNum = 0;
boolean mouseTF = false;
int version = 8;
int fileCount = 0;

void setup()
{
  size(1000, 500, P3D);
  
  
  GUI.setUpWindow(frame, "Tree Generator Menu V0"+version, 50, 50, 300, 340);
}

void draw()
{
  PFont f = createFont("Arial",20,true);
  textFont(f);
background(0); 
fill(50, 255, 50);
stroke(50, 255, 50);
 lights();

if(mouseTF)
{
frameNum = 1;
mouseTF = false;
}

if(frameNum <=Integer.parseInt(frame.fileCountField.getText()) && frameNum > 0)
{
 fileCount++;
 translate(width/2, height);
 rotateX(PI);
 
beginRecord("nervoussystem.obj.OBJExport", "LSystemTree_V0"+version+".0"+ fileCount +".obj");


float thetaY = random(0, PI);
rotateY(thetaY);
LMath.newTree(Float.parseFloat(frame.lengthField.getText()), Float.parseFloat(frame.minLengthField.getText()), Float.parseFloat(frame.scalingField.getText()), 
              Integer.parseInt(frame.maxAngleField.getText()), Integer.parseInt(frame.minBranchesField.getText()), Integer.parseInt(frame.maxBranchesField.getText()), Float.parseFloat(frame.widthFactorField.getText()));

endRecord();
 frameNum++;
}else
{
  textAlign(CENTER);
  text("Click to begin rendering.",width/2,(height)/3);
  text("Remember: once rendering begins window cannot close until finished.",width/2,(height*2)/3);
}
}

void mouseClicked()
{
  mouseTF = true;
  textAlign(CENTER);
  text("Loading...",width/2,(height)/2);
}
