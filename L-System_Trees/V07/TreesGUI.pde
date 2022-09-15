import javax.swing.*;

public class GUIFrame extends JFrame
{
GUI GUI = new GUI();

JPanel inputPanel = new JPanel();

JLabel maxAngleLabel = new JLabel();
public JTextField maxAngleField = new JTextField();
JLabel minLengthLabel = new JLabel();
public JTextField minLengthField = new JTextField();
JLabel lengthLabel = new JLabel();
public JTextField lengthField = new JTextField();
JLabel branchesLabel = new JLabel();
public JTextField minBranchesField = new JTextField();
public JTextField maxBranchesField = new JTextField();
JLabel scalingLabel = new JLabel();
public JTextField scalingField = new JTextField();

GUIFrame()
{
  inputPanel = GUI.setUpPanel(this, inputPanel, 0, 0, 300, 220, 240, 240 ,240);
  
  maxAngleLabel = GUI.setUpLabel(inputPanel, maxAngleLabel, "Max Angle(degrees):", 20, 20, 200, 21);
  maxAngleField = GUI.setUpTextField(inputPanel, maxAngleField, "45", 170, 20, 100, 21, JTextField.RIGHT, true);
  
  minLengthLabel = GUI.setUpLabel(inputPanel, minLengthLabel, "Min Length:", 20, 60, 200, 21);
  minLengthField = GUI.setUpTextField(inputPanel, minLengthField, "2", 170, 60, 100, 21, JTextField.RIGHT, true);
  
  lengthLabel = GUI.setUpLabel(inputPanel, lengthLabel, "Start Length:", 20, 100, 200, 21);
  lengthField = GUI.setUpTextField(inputPanel, lengthField, "120", 170, 100, 100, 21, JTextField.RIGHT, true);
  
  branchesLabel = GUI.setUpLabel(inputPanel, branchesLabel, "Branches(min, max):", 20, 140, 200, 21);
  minBranchesField = GUI.setUpTextField(inputPanel, minBranchesField, "2", 170, 140, 40, 21, JTextField.RIGHT, true);
  maxBranchesField = GUI.setUpTextField(inputPanel, maxBranchesField, "6", 230, 140, 40, 21, JTextField.RIGHT, true);
  
  scalingLabel = GUI.setUpLabel(inputPanel, scalingLabel, "Scaling Factor:", 20, 180, 200, 21);
  scalingField = GUI.setUpTextField(inputPanel, scalingField, ".66f", 170, 180, 100, 21, JTextField.RIGHT, true);
}
}
