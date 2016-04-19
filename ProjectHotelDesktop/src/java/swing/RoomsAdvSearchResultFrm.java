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
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Date;
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

public class RoomsAdvSearchResultFrm extends JFrame{
    
    private DefaultTableModel dtm;
    private JTable jt;
    
    private RoomAdminSLBeanRemote roomAdminSLBean;
    public static List<Rooms> listOfAllRooms;
    public String[][] valueOfLAR;
    public String[] valueOfHeadingOfLAR;
    
    public List result;
    
    public RoomsAdvSearchResultFrm(List result){
        roomAdminSLBean = RoomsMainFrm.getRoomAdminSLBean();
        this.result = result;
        listOfAllRooms = (List<Rooms>)roomAdminSLBean.listAllEntities();
        String[] temp = {"BookingID","User Name", "Room Floor", "Checkin", "Checkout", "Price"};
        valueOfHeadingOfLAR = temp;
        
        valueOfLAR = new String[listOfAllRooms.size()][6];
        
                    Object[] itemList={new BigDecimal("1"), "", "", new BigInteger("1"), new Date(), new Date(), new BigInteger("1")};
                    for (int i = 0; i < result.size() - 1; i++) {
                        itemList = (Object[])result.get(i);
                        
                        valueOfLAR[i][0] = itemList[0].toString();
                        valueOfLAR[i][1] = (String)itemList[1] + " " +(String)itemList[2];
                        valueOfLAR[i][2] = itemList[3].toString();
                        valueOfLAR[i][3] = ((Date)itemList[4]).toString();
                        valueOfLAR[i][4] = ((Date)itemList[5]).toString();
                        valueOfLAR[i][5] = itemList[6].toString();
                        
                        //0 b.ID bigD, 1 u.FN str, 2 u.LN str, 3 r.FLOOR bigInt, 
                        //4 b.CIN date, 5 b,COUT date, 6 r.PRICE bigInt, 7 u.ID bigD, 8 r.ID bigD
                        
                        
                    
                    }
                
        
        jt = new JTable(valueOfLAR, valueOfHeadingOfLAR);
        
        dtm = new DefaultTableModel();
        setLayout(new BorderLayout(20, 20));
        add(new JScrollPane(jt), BorderLayout.CENTER);
    }
}
