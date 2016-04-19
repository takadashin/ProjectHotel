/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import javax.ejb.EJB;
import com.humber.ca.BookingAdminSLBeanRemote;
import com.humber.ca.RoomAdminSLBeanRemote;
import com.humber.ca.Rooms;
import com.humber.ca.UserAdminSLBeanRemote;
import java.util.List;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.UIManager;
import swing.RoomsMainFrm;
/**
 *
 * @author Ziyi
 */
public class Main {
    @EJB
    private static UserAdminSLBeanRemote userAdminSLBean;
    @EJB
    private static BookingAdminSLBeanRemote bookingAdminSLBean;
    @EJB
    private static RoomAdminSLBeanRemote roomAdminSLBean;

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        try {
            // Set cross-platform Java L&F (also called "Metal")
            UIManager.setLookAndFeel(
                UIManager.getSystemLookAndFeelClassName());
        } 
        catch(Exception e){
                JOptionPane.showMessageDialog(null, e.toString());
            }
        
        RoomsMainFrm a = new RoomsMainFrm(roomAdminSLBean,userAdminSLBean,bookingAdminSLBean);
        a.setExtendedState(JFrame.MAXIMIZED_BOTH);
        a.setLocationRelativeTo(null);
        a.setVisible(true);
        
    }
    
}
