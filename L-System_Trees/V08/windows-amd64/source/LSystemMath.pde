//This code is based off of code made by The Coding Train
//This is the link to the github:
//https://github.com/CodingTrain/Coding-Challenges/blob/main/016_LSystem/Processing/CC_016_LSystem/CC_016_LSystem.pde

public class LSystemMath 
{

void branch(float h, float minlength, float scaling, float bottomAngle, float topAngle, int minBranchesm, int maxBranches, float widthFactor) 
{
  //float d represnts the length of the new branch, it is can be anywhere between h and h/2
  float d = float(int(random(h/2, h)));
  
  //float s is h/widthFactor so that the trunk and branches of the tree will always be a 25th of their maximum length
  float s = h/widthFactor;
  beginShape();
  vertex(0, 0, 0);
  vertex(s, 0, 0);
  vertex(s, 0, s);
  vertex(0, 0, s);
  endShape(CLOSE);
  beginShape();
  vertex(0, 0, 0);
  vertex(0, 0, s);
  vertex(0, d, s);
  vertex(0, d, 0);
  endShape(CLOSE);
  beginShape();
  vertex(s, 0, 0);
  vertex(s, 0, s);
  vertex(s, d, s);
  vertex(s, d, 0);
  endShape(CLOSE);
  beginShape();
  vertex(0, 0, 0);
  vertex(s, 0, 0);
  vertex(s, d, 0);
  vertex(0, d, 0);
  endShape(CLOSE);
  beginShape();
  vertex(0, 0, s);
  vertex(s, 0, s);
  vertex(s, d, s);
  vertex(0, d, s);
  endShape(CLOSE);
  beginShape();
  vertex(0, d, 0);
  vertex(s, d, 0);
  vertex(s, d, s);
  vertex(0, d, s);
  endShape(CLOSE);
  translate(0, d);

//multiplying h by the scaling facotor lets us make each branch shorter then the last
  h *= scaling;

//dividing  the topAngle and bottomAngle paramiters by the sacling factor allows us to make the range of directions in which new branches can be made to grow
topAngle /= scaling;
bottomAngle /= scaling;
  if (h > minlength)
  {
    int n = int(random(minBranchesm, maxBranches));
    for (int i = 0; i < n; i++) {
      float thetaZ = random(bottomAngle, topAngle);//generates random angle for rotation about the z axis
      float thetaX = random(bottomAngle, topAngle);//generates random angle for rotation about the y axis
      pushMatrix(); //save current information, this is like the '[' in an L-system axiom
      rotateZ(thetaZ);//rotates new branch about the z axis
      rotateY(thetaX);//rotates new branch about the y axis
  branch(h, minlength, scaling, bottomAngle, topAngle, minBranchesm, maxBranches, widthFactor);
      popMatrix(); //reset to older saved information, this is like the ']' in an L-system axiom
    }
  }
}

void newTree(float length, float minlength, float scaling, int maxAngle,int minBranchesm,int maxBranches, float widthFactor) 
{

  
  pushMatrix();
  branch(length, minlength, scaling, -radians(maxAngle), radians(maxAngle), minBranchesm, maxBranches, widthFactor);
  popMatrix();
}
}
