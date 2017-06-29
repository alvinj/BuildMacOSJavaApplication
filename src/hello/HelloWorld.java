package hello;

import java.awt.*;
import javax.swing.*;

public class HelloWorld implements Runnable
{
    public static void main(String[] args)
    {
        HelloWorld helloWorld = new HelloWorld();
        // schedule this for the event dispatch thread (edt)
        SwingUtilities.invokeLater(helloWorld);
    }

    public void run()
    {
        JFrame frame = new JFrame("Hello, world");
        frame.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        frame.setPreferredSize(new Dimension(600, 400));
        frame.pack();
        frame.setVisible(true);
    }
}