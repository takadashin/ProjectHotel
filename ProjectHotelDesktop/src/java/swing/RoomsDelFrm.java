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
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import static swing.RoomsDelFrm1.listOfAllRooms;
/**
 *
 * @author Ziyi
 */
public class RoomsDelFrm extends javax.swing.JFrame {

    private DefaultTableModel dtm;
    private JTable jt;
    
    private RoomAdminSLBeanRemote roomAdminSLBean;
    public static List<Rooms> listOfAllRooms;
    public String[][] valueOfLAR;
    public String[] valueOfHeadingOfLAR;
    
    public BigDecimal roomId;
    
    /**
     * Creates new form RoomsDelFrm
     */
    public RoomsDelFrm() {
        initComponents();
        
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

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        txtRoomId = new javax.swing.JTextField();
        btnUpdate = new javax.swing.JButton();
        btnDelete = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);

        jLabel1.setText("Please enter the ID for deleting or updating: ");

        btnUpdate.setText("Update");
        btnUpdate.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnUpdateActionPerformed(evt);
            }
        });

        btnDelete.setText("Delete");
        btnDelete.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnDeleteActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap(111, Short.MAX_VALUE)
                .addComponent(jLabel1)
                .addGap(18, 18, 18)
                .addComponent(txtRoomId, javax.swing.GroupLayout.PREFERRED_SIZE, 131, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(btnUpdate)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(btnDelete)
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap(273, Short.MAX_VALUE)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txtRoomId, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnUpdate)
                    .addComponent(btnDelete)
                    .addComponent(jLabel1))
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnDeleteActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnDeleteActionPerformed
        // TODO add your handling code here:
        try{
        roomId = new BigDecimal(txtRoomId.getText());
        Rooms selectedRoom = (Rooms)roomAdminSLBean.getById(roomId);
        roomAdminSLBean.delete(selectedRoom);
        JOptionPane.showMessageDialog(null, "A record has been successfully Deleted!"); 
        }
        catch(Exception e){   
            JOptionPane.showMessageDialog(null, e.toString());
        }
    }//GEN-LAST:event_btnDeleteActionPerformed

    private void btnUpdateActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnUpdateActionPerformed
        // TODO add your handling code here:
        RoomsUpdateFrm a = new RoomsUpdateFrm(new BigDecimal(txtRoomId.getText()));
        try{
            a.setRoomId(new BigDecimal(txtRoomId.getText()));
        }catch(Exception e){   
            JOptionPane.showMessageDialog(null, e.toString());
        }
        a.setExtendedState(JFrame.MAXIMIZED_BOTH);
        a.setLocationRelativeTo(null);
        a.setVisible(true);
    }//GEN-LAST:event_btnUpdateActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(RoomsDelFrm.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(RoomsDelFrm.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(RoomsDelFrm.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(RoomsDelFrm.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new RoomsDelFrm().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnDelete;
    private javax.swing.JButton btnUpdate;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JTextField txtRoomId;
    // End of variables declaration//GEN-END:variables
}