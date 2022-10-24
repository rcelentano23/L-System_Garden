//This code is based off of code made by The Coding Train
//This is the link to the github:
//https://github.com/CodingTrain/Coding-Challenges/blob/main/016_LSystem/Processing/CC_016_LSystem/CC_016_LSystem.pde

public class LSystemMath 
{

void branch(PGraphics object, float h, float minlength, float scaling, float bottomAngle, float topAngle, int minBranchesm, int maxBranches, float widthFactor, boolean exponential, boolean scaleAngles) 
{
  //float d represnts the length of the new branch, it is can be anywhere between h and h/2
  float d = float(int(random(h/2, h)));
 
  if(d <= Double.parseDouble(frame.lengthField.getText())/20)
    changeColor(object, "Green");
  else
    changeColor(object, "Brown");
    
  //float s is h/widthFactor so that the trunk and branches of the tree will always be a 25th of their maximum length
  float s = h/widthFactor;
  object.beginShape();
  object.vertex(0, 0, 0);
  object.vertex(s, 0, 0);
  object.vertex(s, 0, s);
  object.vertex(0, 0, s);
  object.endShape(CLOSE);
  object.beginShape();
  object.vertex(0, 0, 0);
  object.vertex(0, 0, s);
  object.vertex(0, d, s);
  object.vertex(0, d, 0);
  object.endShape(CLOSE);
  object.beginShape();
  object.vertex(s, 0, 0);
  object.vertex(s, 0, s);
  object.vertex(s, d, s);
  object.vertex(s, d, 0);
  object.endShape(CLOSE);
  object.beginShape();
  object.vertex(0, 0, 0);
  object.vertex(s, 0, 0);
  object.vertex(s, d, 0);
  object.vertex(0, d, 0);
  object.endShape(CLOSE);
  object.beginShape();
  object.vertex(0, 0, s);
  object.vertex(s, 0, s);
  object.vertex(s, d, s);
  object.vertex(0, d, s);
  object.endShape(CLOSE);
  object.beginShape();
  object.vertex(0, d, 0);
  object.vertex(s, d, 0);
  object.vertex(s, d, s);
  object.vertex(0, d, s);
  object.endShape(CLOSE);
  object.translate(0, d);



//multiplying h by the scaling facotor lets us make each branch shorter then the last
  h *= scaling;

//dividing  the topAngle and bottomAngle paramiters by the sacling factor allows us to make the range of directions in which new branches can be made to grow
if(scaleAngles)
{
topAngle /= scaling;
bottomAngle /= scaling;
}

if(exponential)
  scaling *= Float.parseFloat(frame.scalingField.getText());

  if (h > minlength)
  {
    int n = int(random(minBranchesm, maxBranches));
    for (int i = 1; i <= n; i++) {
      float thetaZ = random(bottomAngle, topAngle);//generates random angle for rotation about the z axis
      float thetaX = random(bottomAngle, topAngle);//generates random angle for rotation about the y axis
      object.pushMatrix(); //save current information, this is like the '[' in an L-system axiom
      object.rotateZ(thetaZ);//rotates new branch about the z axis
      object.rotateX(thetaX);//rotates new branch about the y axis
      branch(object, h, minlength, scaling, bottomAngle, topAngle, minBranchesm, maxBranches, widthFactor, exponential, scaleAngles);
      object.popMatrix(); //reset to older saved information, this is like the ']' in an L-system axiom
    }
  }
}

void newTree(PGraphics object, float length, float minlength, float scaling, int maxAngle,int minBranchesm,int maxBranches, float widthFactor, boolean exponential, boolean scaleAngles) 
{
  object.pushMatrix();
  changeColor(object, "Brown");
  branch(object, length, minlength, scaling, -radians(maxAngle), radians(maxAngle), minBranchesm, maxBranches, widthFactor, exponential, scaleAngles);
  object.popMatrix();
}

private void changeColor(PGraphics object,String colour)
{
  switch(colour)
  {
    case "Green":
    fillGreen(object, int(random(0, 4)));
    break;
    case "Brown":
    fillBrown(object, int(random(0,2)));
    break;
  }
}

private void fillGreen(PGraphics object, int variation)
{
  switch(variation)
   {
     case 0:
     object.fill(34,139,34);
     break;
     case 1:
     object.fill(0,128,0);
     break;
     case 2:
     object.fill(0,100,0);
     break;
     case 3:
     object.fill(46,139,87);
     break;
     case 4:
     object.fill(85,107,47);
     break;
   }
}

private void fillBrown(PGraphics object,int variation)
{
  switch(variation)
   {
     case 0:
     object.fill(89,39,32);
     break;
     case 1:
     object.fill(61,12,2);
     break;
     case 2:
     object.fill(89,39,32);
     break;
   }
}

}
