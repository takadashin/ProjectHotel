/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.humber.ca;

import javax.ejb.Local;

/**
 *
 * @author khai
 */
@Local
public interface UserSFBeanLocal {
    String getUserID();
    
   void setUserID(String UserID);
    String getUserType();
    void setUserType(String UserType);
     public String getUserName();
    public void setUserName(String UserName);
}
