import nervoussystem.obj.*;

LSystemMath LMath = new LSystemMath();
GUI GUI = new GUI();
GUIFrame frame = new GUIFrame();
int frameNum = 0;
boolean runTF = false;
int version = 10;
int fileCount = 0;
int renderCount = 0;
boolean renderTrees = true;
boolean exponential = false;
boolean scaleAngles = false;
boolean error = false;
void setup()
{
  size(1000, 500, P3D);
  surface.setTitle("L-System Render Window");
  PFont f = createFont("Arial",20,true);
  textFont(f);
  lights();
  background(0);
  noStroke();
  GUI.setUpWindow(frame, "Tree Generator Menu V"+version, 50, 50, 300, 340);
}

void draw()
{
clear();
fill(50, 255, 50);

if(error)
{
  text("Error: out of ram.",width/2,((height)/2)-30);
  text("please change your inputs/mode.", width/2, (height)/2);
  menu();
}else
{
try
{
if(frameNum <= renderCount && frameNum > 0)
{
 

fileCount++;

OBJExport obj = null;

String fileName = null;

if(fileCount < 10) 
fileName = ".obj files/LSystemTree_V"+version+".0"+ fileCount;
else if(fileCount >= 10)
fileName = ".obj files/LSystemTree_V"+version+"."+ fileCount;

obj = saveFile(obj, fileName);

obj.setColor(true);
obj.beginDraw();
obj.noStroke();
float thetaY = random(0, PI);
obj.rotateY(thetaY);


LMath.newTree(obj, Float.parseFloat(frame.lengthField.getText()), Float.parseFloat(frame.minLengthField.getText()), Float.parseFloat(frame.scalingField.getText()), 
Integer.parseInt(frame.maxAngleField.getText()), Integer.parseInt(frame.minBranchesField.getText()), Integer.parseInt(frame.maxBranchesField.getText()), Float.parseFloat(frame.widthFactorField.getText()), exponential, scaleAngles);

obj.endDraw();
obj.dispose();
obj = null;
System.gc();

if(renderTrees)
{
translate(width/2, height);
rotateX(PI);
PShape tree = loadShape(fileName + ".obj");
shape(tree);
}
else
  text("Loading...",width/2,((height)/2)+30);
  
frameNum++;
}else
  menu();
  
}
catch(Exception e)
{
  error = true;
}
}
}

void keyPressed()
{
  if(keyCode == ENTER)
  {
  frameNum = 1;
  error = false;
  text("Loading...",width/2,((height)/2)+30);
  renderCount = Integer.parseInt(frame.fileCountField.getText());
  }
  
  if(key == '1'||key== '!')
    if(renderTrees)
      renderTrees = false;
    else
      renderTrees = true;
  
  if(key == '2'||key== '@')
    if(exponential)
      exponential = false;
    else
      exponential = true;
  
  if(key == '3'||key== '#')
    if(scaleAngles)
      scaleAngles = false;
    else
      scaleAngles = true;
}

private void menu()
{
  textAlign(CENTER);
  text("Press ENTER to begin rendering.",width/2,(height)/3);
  text("Remember: once rendering begins window cannot close until finished.",width/2,(2*height)/3);
  
  if(renderTrees)
  text("Live view(toggle with '1'): enabled",width/2,((2*height)/3)+30);
  else if(!renderTrees)
  text("Live view(toggle with '1'): disabled",width/2,((2*height)/3)+30);
  
  if(exponential)
  text("Exponential Mode(toggle with '2'): enabled",width/2,((2*height)/3)+60);
  else if(!exponential)
  text("Exponential Mode(toggle with '2'): disabled",width/2,((2*height)/3)+60);
  
  if(scaleAngles)
  text("Angle Scaling(toggle with '3'): enabled",width/2,((2*height)/3)+90);
  else if(!scaleAngles)
  text("Angle Scaling(toggle with '3'): disabled",width/2,((2*height)/3)+90);
}

private OBJExport saveFile(OBJExport obj, String fileName)
{
  obj = (OBJExport) createGraphics(width,height,"nervoussystem.obj.OBJExport",fileName+".obj"); 
  return obj;
}
