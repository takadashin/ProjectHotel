/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.humber.ca;

import javax.ejb.Stateful;
import javax.ejb.TransactionManagement;
import javax.ejb.TransactionManagementType;

/**
 *
 * @author khai
 */
@Stateful
@TransactionManagement(value=TransactionManagementType.CONTAINER)
public class UserSFBean implements UserSFBeanRemote, UserSFBeanLocal {

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
    
    private String UserID;
    private String UserType;
    private String UserName;
    @Override
    public String getUserID() {
        return UserID;
    }
    @Override
    public void setUserID(String UserID) {
        this.UserID = UserID;
    }
    @Override
    public String getUserType() {
        return UserType;
    }
    @Override
    public void setUserType(String UserType) {
        this.UserType = UserType;
    }
@Override
    public String getUserName() {
        return UserName;
    }
@Override
    public void setUserName(String UserName) {
        this.UserName = UserName;
    }
    
    
    
}
