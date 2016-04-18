/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.humber.ca;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;
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
public class BookSLBean implements BookSLBeanRemote, BookSLBeanLocal {

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
    
    @javax.persistence.PersistenceContext(unitName="ProjectJ2EE-ejbPU")
    private EntityManager em ;
    
    @Override
    public Boolean Insert(BigDecimal RoomID, BigDecimal UserID,Date CheckIn,Date CheckOut,BigInteger numadult,BigInteger numkid ) {
        try
        {
        
            
            BigDecimal id = em.createQuery("select max(u.id) from Bookings u", BigDecimal.class).getSingleResult();
            id = id.add(new BigDecimal(1));
            Bookings newo = new Bookings();
            newo.setId(id);
            Rooms roomob = (Rooms)em.find(Rooms.class,RoomID);
            Users userob = (Users)em.find(Users.class,UserID);
            
            newo.setRoomid(roomob);
            newo.setUserid(userob);
            newo.setCheckin(CheckIn);
            newo.setCheckout(CheckOut);
            newo.setNumadult(numadult);
            newo.setNumchild(numkid);
            newo.setCreateAt(Calendar.getInstance().getTime());
            em.persist(newo);
           
         
            return true;
        }
        catch(Exception ex)
        {
            return false;
        }
    }

    @Override
    public Boolean Update(BigDecimal id,BigDecimal RoomID, BigDecimal UserID,Date CheckIn,Date CheckOut,BigInteger numadult,BigInteger numkid) {
        try
        {
        
            Bookings newo = (Bookings)em.find(Bookings.class, id);
            Rooms roomob = (Rooms)em.find(Rooms.class,RoomID);
            Users userob = (Users)em.find(Users.class,UserID);
            
            newo.setRoomid(roomob);
            newo.setUserid(userob);
            newo.setCheckin(CheckIn);
            newo.setCheckout(CheckOut);
            newo.setNumadult(numadult);
            newo.setNumchild(numkid);
            newo.setCreateAt(Calendar.getInstance().getTime());
        
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
            Bookings newo = (Bookings)em.find(Bookings.class, Id);
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
         Bookings cust = (Bookings)em.find(Bookings.class, Id);
        return cust;
    }

    @Override
    public List findAll() {
        Query query = em.createNamedQuery("Bookings.findAll");
        return query.getResultList();
    }
    
}
