/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package swing;

import java.awt.BorderLayout;
import java.sql.ResultSet;
import javax.swing.DefaultListSelectionModel;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

import com.humber.ca.BookingAdminSLBeanRemote;
import com.humber.ca.RoomAdminSLBeanRemote;
import com.humber.ca.Rooms;
import com.humber.ca.UserAdminSLBeanRemote;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

/**
 *
 * @author Ziyi
 */

public class RoomsDelFrm1 extends JFrame{
    
    private DefaultTableModel dtm;
    private JTable jt;
    
    private RoomAdminSLBeanRemote roomAdminSLBean;
    public static List<Rooms> listOfAllRooms;
    public String[][] valueOfLAR;
    public String[] valueOfHeadingOfLAR;
    
    public RoomsDelFrm1(){
        roomAdminSLBean = RoomsMainFrm.getRoomAdminSLBean();
        listOfAllRooms = (List<Rooms>)roomAdminSLBean.listAllEntities();
        String[] temp = {"RoomId","RoomFloor", "RoomCapacity", "RoomDescription", "RoomImage", "RoomPrice"};
        valueOfHeadingOfLAR = temp;
        
        valueOfLAR = new String[listOfAllRooms.size()][6];
        for (int i = 0; i < listOfAllRooms.size() - 1; i++) {
            valueOfLAR[i][0] = listOfAllRooms.get(i).getId().toString();
            valueOfLAR[i][1] = listOfAllRooms.get(i).getFloor().toString();
            valueOfLAR[i][2] = listOfAllRooms.get(i).getCapacity().toString();
            valueOfLAR[i][3] = listOfAllRooms.get(i).getDescription();
            valueOfLAR[i][4] = listOfAllRooms.get(i).getImg();
            valueOfLAR[i][5] = listOfAllRooms.get(i).getPrice().toString();
        }
        jt = new JTable(valueOfLAR, valueOfHeadingOfLAR);
        
        dtm = new DefaultTableModel();
        setLayout(new BorderLayout(20, 20));
        add(new JScrollPane(jt), BorderLayout.CENTER);
    }
}
