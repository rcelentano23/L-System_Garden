public class LSystemMath 
{

void branch(float h, float minlength, float scaling, float bottomAngle, float topAngle, int minBranchesm, int maxBranches) 
{
  float d = float(int(random(h/2, h)));
  // thickness of the branch is mapped to its length
  float sw = map(h, 2, 120, 1, 5);
  strokeWeight(sw);
  // Draw the actual branch
  //line(0, 0, 0, -h);
  float s = h/25;
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
  // Move along to end
  translate(0, d);

  // Each branch will be 2/3rds the size of the previous one
  h *= scaling;

topAngle *= scaling;
bottomAngle *= scaling;
//scaling *= scaling;
  // All recursive functions must have an exit condition!!!!
  // Here, ours is when the length of the branch is 2 pixels or less
  if (h > minlength)
  {
    // A random number of branches
    int n = int(random(minBranchesm, maxBranches));
    for (int i = 0; i < n; i++) {
      // Picking a random angle
      float thetaZ = random(bottomAngle, topAngle);
      float thetaY = random(2*bottomAngle, 2*topAngle);
      pushMatrix();      // Save the current state of transformation (i.e. where are we now)
      rotateZ(thetaZ);     // Rotate by theta
      rotateY(thetaY);     // Rotate by theta
  branch(h, minlength, scaling, bottomAngle, topAngle, minBranchesm, maxBranches);      // Ok, now call myself to branch again
      popMatrix();       // Whenever we get back here, we "pop" in order to restore the previous matrix state
    }
  }
}

void newTree(float length, float minlength, float scaling, int maxAngle,int minBranchesm,int maxBranches) 
{

  
  pushMatrix();
  // Start the tree from the bottom of the screen
  // Start the recursive branching!
  //translate(width/2, 0);
  branch(length, minlength, scaling, -radians(maxAngle), radians(maxAngle), minBranchesm, maxBranches);
  float thetaX = random(0, PI);
      rotateX(thetaX);     // Rotate by theta
  popMatrix();
}
}
