/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.humber.ca;

import javax.ejb.Stateless;
import javax.ejb.TransactionManagement;
import javax.ejb.TransactionManagementType;
import javax.persistence.EntityManager;

/**
 *
 * @author Ziyi
 */
@Stateless
@TransactionManagement(value = TransactionManagementType.CONTAINER)
public class UserAdminSLBean extends BaseSLBean implements UserAdminSLBeanRemote {
    @javax.persistence.PersistenceContext(unitName = "ProjectJ2EE-ejbPU")
    private EntityManager em;
    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
    public UserAdminSLBean() {
        super(Users.class);
    }
    @Override
    public EntityManager getEntityManager() {
        
        return em;
    }
}
