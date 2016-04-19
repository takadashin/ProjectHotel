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
import com.humber.ca.Users;
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

public class BookingListAllFrm extends JFrame{
    
    private DefaultTableModel dtm;
    private JTable jt;
    
    private UserAdminSLBeanRemote userAdminSLBean;
    public static List<Users> listOfAllRooms;
    public String[][] valueOfLAR;
    public String[] valueOfHeadingOfLAR;
    
    public BookingListAllFrm(){
        userAdminSLBean = RoomsMainFrm.getUserAdminSLBean();
        listOfAllRooms = (List<Users>)userAdminSLBean.listAllEntities();
        String[] temp = {"UserId","FirstName", "LastName", "PassWord", "Email", "Phone", "Address","City", "Country","State", "ZIP","Company"};
        valueOfHeadingOfLAR = temp;
        
        valueOfLAR = new String[listOfAllRooms.size()][12];
        try{for (int i = 0; i < listOfAllRooms.size() - 1; i++) {
            valueOfLAR[i][0] = listOfAllRooms.get(i).getId().toString();
            valueOfLAR[i][1] = listOfAllRooms.get(i).getFirstname();
            valueOfLAR[i][2] = listOfAllRooms.get(i).getLastname();
            valueOfLAR[i][3] = listOfAllRooms.get(i).getPassword();
            valueOfLAR[i][4] = listOfAllRooms.get(i).getEmail();
            valueOfLAR[i][5] = listOfAllRooms.get(i).getPhone();
            valueOfLAR[i][6] = listOfAllRooms.get(i).getAddress();
            valueOfLAR[i][7] = listOfAllRooms.get(i).getCity();
            valueOfLAR[i][8] = listOfAllRooms.get(i).getCountry();
            valueOfLAR[i][9] = listOfAllRooms.get(i).getState();
            valueOfLAR[i][10] = listOfAllRooms.get(i).getZip();
            valueOfLAR[i][11] = ("".equals(listOfAllRooms.get(i).getCompany()))?"Null":listOfAllRooms.get(i).getCompany().toString();
        }}catch(Exception e){System.out.print(e.toString());System.err.println();}
        jt = new JTable(valueOfLAR, valueOfHeadingOfLAR);
        
        dtm = new DefaultTableModel();
        setLayout(new BorderLayout(20, 20));
        add(new JScrollPane(jt), BorderLayout.CENTER);
    }
}
