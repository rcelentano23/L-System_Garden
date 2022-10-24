import javax.swing.*;
import java.awt.*;

public class GUI
{
  
  public JLabel setUpLabel(JPanel panel, JLabel label, String text, int x, int y, int w, int h)
  {
    label = new JLabel(text);
    label.setBounds(x, y, w, h);
    
    panel.add(label);
    
    return label;
  }
  
  public JTextField setUpTextField(JPanel panel, JTextField field, String text, int x, int y, int w, int h, int alignment, boolean editable)
  {
    field = new JTextField(text);
    field.setBounds(x, y, w, h);
    field.setHorizontalAlignment(alignment);
    panel.add(field);
    field.setEditable(editable);
    
    return field;
  }
  
  public JPanel setUpPanel(JFrame frame, JPanel panel, int x, int y, int w, int h, int r, int g, int b)
  {
    panel.setBounds(x, y, w, h);
    panel.setLayout(null);
    panel.setBackground(new Color(r, g, b));
    panel.setVisible(true);
    
    frame.add(panel);
    return panel;
    
  }
  
  public void setUpWindow(JFrame frame, String title, int x, int y, int w, int h)
  {
    frame.setTitle(title);
    frame.setBounds(x,y,w,h);
    frame.setVisible(true);
    frame.setResizable(false);
    frame.setLayout(null);
    
  }
}
