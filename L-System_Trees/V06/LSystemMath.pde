public class LSystemMath 
{

void branch(float h, float scaling, float topAngle, float bottomAngle) 
{
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
  vertex(0, -h, s);
  vertex(0, -h, 0);
  endShape(CLOSE);
  beginShape();
  vertex(s, 0, 0);
  vertex(s, 0, s);
  vertex(s, -h, s);
  vertex(s, -h, 0);
  endShape(CLOSE);
  beginShape();
  vertex(0, 0, 0);
  vertex(s, 0, 0);
  vertex(s, -h, 0);
  vertex(0, -h, 0);
  endShape(CLOSE);
  beginShape();
  vertex(0, 0, s);
  vertex(s, 0, s);
  vertex(s, -h, s);
  vertex(0, -h, s);
  endShape(CLOSE);
  beginShape();
  vertex(0, -h, 0);
  vertex(h/40, -h, 0);
  vertex(h/40, -h, h/40);
  vertex(0, -h, h/40);
  endShape(CLOSE);
  // Move along to end
  translate(0, -h);

  // Each branch will be 2/3rds the size of the previous one
  h *= scaling;

topAngle *= scaling;
bottomAngle *= scaling;
//scaling *= scaling;
  // All recursive functions must have an exit condition!!!!
  // Here, ours is when the length of the branch is 2 pixels or less
  if (h > 2)
  {
    // A random number of branches
    int n = int(random(2, 6));
    for (int i = 0; i < n; i++) {
      // Picking a random angle
      float thetaZ = random(topAngle, bottomAngle);
      float thetaY = random(topAngle, bottomAngle);
      pushMatrix();      // Save the current state of transformation (i.e. where are we now)
      rotateZ(thetaZ);     // Rotate by theta
      rotateY(thetaY);     // Rotate by theta
      branch(h, scaling, topAngle, bottomAngle);         // Ok, now call myself to branch again
      popMatrix();       // Whenever we get back here, we "pop" in order to restore the previous matrix state
    }
  }
}

void newTree() {

  
  pushMatrix();
  // Start the tree from the bottom of the screen
  // Start the recursive branching!
  //translate(width/2, height);
  branch(150, .66f, -PI/2, PI/2);
  popMatrix();
}
}
