import nervoussystem.obj.*;

LSystemMath LMath = new LSystemMath();
GUI GUI = new GUI();
GUIFrame frame = new GUIFrame();
int frameNum = 0;
boolean mouseTF = false;
int version = 9;
int fileCount = 0;
int renderCount = 0;
void setup()
{
  size(1000, 500, P3D);
  
  GUI.setUpWindow(frame, "Tree Generator Menu V0"+version, 50, 50, 300, 340);
}

void draw()
{
   PFont f = createFont("Arial",20,true);
  textFont(f);
  lights();
  background(0);
  noStroke();
fill(50, 255, 50);

if(mouseTF)
{
frameNum = 1;
mouseTF = false;
}

if(frameNum <= renderCount && frameNum > 0)
{
 fileCount++;
 
OBJExport obj = (OBJExport) createGraphics(width,height,"nervoussystem.obj.OBJExport",".obj files/LSystemTree_V0"+version+".0"+ fileCount +".obj"); 

obj.setColor(true);
obj.beginDraw();
obj.noStroke();
float thetaY = random(0, PI);
obj.rotateY(thetaY);

LMath.newTree(obj, Float.parseFloat(frame.lengthField.getText()), Float.parseFloat(frame.minLengthField.getText()), Float.parseFloat(frame.scalingField.getText()), 
Integer.parseInt(frame.maxAngleField.getText()), Integer.parseInt(frame.minBranchesField.getText()), Integer.parseInt(frame.maxBranchesField.getText()), Float.parseFloat(frame.widthFactorField.getText()));

obj.endDraw();
obj.dispose();
System.gc();

translate(width/2, height);
rotateX(PI);
PShape tree = loadShape(".obj files/LSystemTree_V0"+version+".0"+ fileCount +".obj");
shape(tree);
 frameNum++;
}else
{
  textAlign(CENTER);
  text("Click to begin rendering.",width/2,(height)/3);
  text("Remember: once rendering begins window cannot close until finished.",width/2,(2*height)/3);
}
}

void mouseClicked()
{
  mouseTF = true;
  textAlign(CENTER);
  text("Loading...",width/2,(height)/2);
  renderCount = Integer.parseInt(frame.fileCountField.getText());
}
