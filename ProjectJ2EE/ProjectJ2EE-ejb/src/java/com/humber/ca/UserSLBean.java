/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.humber.ca;

import java.math.BigDecimal;
import java.util.List;
import javax.ejb.Stateless;
import javax.ejb.TransactionManagement;
import javax.ejb.TransactionManagementType;
import javax.persistence.EntityManager;
import javax.persistence.Query;

/**
 *
 * @author khai
 */
@Stateless
@TransactionManagement(value=TransactionManagementType.CONTAINER)
public class UserSLBean implements UserSLBeanRemote, UserSLBeanLocal {

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
    @javax.persistence.PersistenceContext(unitName="ProjectJ2EE-ejbPU")
    private EntityManager em ;
    
    @Override
    public Boolean Insert(String Name, String Email, String Phone, String Address, String Type) {
        try
        {
        
            
            int id = em.createQuery("select max(u.id) from Users u", Integer.class).getSingleResult();
            Users newo = new Users();
            newo.setId(new BigDecimal(id));
            em.persist(newo);
         
            return true;
        }
        catch(Exception ex)
        {
            return false;
        }
    }

    @Override
    public Boolean Update(BigDecimal id,String Name, String Email, String Phone, String Address, String Type) {
        try
        {
        
            Users newo = (Users)em.find(Users.class, id);
            
        
        return true;
        }
        catch(Exception ex)
        {
            return false;
        }
    }

    @Override
    public Boolean delete(BigDecimal Id) {
        try
        {
            Users newo = (Users)em.find(Users.class, Id);
            em.remove(newo);
            return true;
        }
        catch(Exception ex)
        {
            return false;
        }
    }

    @Override
    public Object SearchByID(BigDecimal Id) {
         Users cust = (Users)em.find(Users.class, Id);
        return cust;
    }

    @Override
    public List findAll() {
        Query query = em.createNamedQuery("Person.findAll");
        return query.getResultList();
    }
}
