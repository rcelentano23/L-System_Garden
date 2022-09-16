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
JLabel fileCountLabel = new JLabel();
public JTextField fileCountField = new JTextField();
JLabel widthFactorLabel = new JLabel();
public JTextField widthFactorField = new JTextField();
GUIFrame()
{
   addWindowListener(new java.awt.event.WindowAdapter()
   {
            public void windowClosing(java.awt.event.WindowEvent e)
            {
               exit();
            }
   });
        
  inputPanel = GUI.setUpPanel(this, inputPanel, 0, 0, 300, 220, 240, 240 ,240);
  
  maxAngleLabel = GUI.setUpLabel(inputPanel, maxAngleLabel, "Max Angle(degrees):", 20, 20, 200, 21);
  maxAngleField = GUI.setUpTextField(inputPanel, maxAngleField, "45", 170, 20, 100, 21, JTextField.RIGHT, true);
  
  minLengthLabel = GUI.setUpLabel(inputPanel, minLengthLabel, "Min Length:", 20, 60, 200, 21);
  minLengthField = GUI.setUpTextField(inputPanel, minLengthField, "4", 170, 60, 100, 21, JTextField.RIGHT, true);
  
  lengthLabel = GUI.setUpLabel(inputPanel, lengthLabel, "Start Length:", 20, 100, 200, 21);
  lengthField = GUI.setUpTextField(inputPanel, lengthField, "120", 170, 100, 100, 21, JTextField.RIGHT, true);
  
  branchesLabel = GUI.setUpLabel(inputPanel, branchesLabel, "Branches(min, max):", 20, 140, 200, 21);
  minBranchesField = GUI.setUpTextField(inputPanel, minBranchesField, "2", 170, 140, 40, 21, JTextField.RIGHT, true);
  maxBranchesField = GUI.setUpTextField(inputPanel, maxBranchesField, "4", 230, 140, 40, 21, JTextField.RIGHT, true);
  
  scalingLabel = GUI.setUpLabel(inputPanel, scalingLabel, "Scaling Factor:", 20, 180, 200, 21);
  scalingField = GUI.setUpTextField(inputPanel, scalingField, ".75", 170, 180, 100, 21, JTextField.RIGHT, true);
  
  fileCountLabel = GUI.setUpLabel(inputPanel, fileCountLabel, "Render Count:", 20, 220, 200, 21);
  fileCountField = GUI.setUpTextField(inputPanel, fileCountField, "5", 170, 220, 100, 21, JTextField.RIGHT, true);
  
  widthFactorLabel = GUI.setUpLabel(inputPanel, widthFactorLabel, "Width Factor:", 20, 260, 200, 21);
  widthFactorField = GUI.setUpTextField(inputPanel, widthFactorField, "20", 170, 260, 100, 21, JTextField.RIGHT, true);
}
}
