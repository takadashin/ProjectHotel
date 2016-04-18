/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.humber.ca;

import java.math.BigDecimal;
import java.math.BigInteger;
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
public class RoomSLBean implements RoomSLBeanRemote, RoomSLBeanLocal {

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
    @javax.persistence.PersistenceContext(unitName="ProjectJ2EE-ejbPU")
    private EntityManager em ;
    
    @Override
    public Boolean Insert(BigInteger price,BigInteger capacity,String img,BigInteger floor,String description) {
        try
        {
        
            
            BigDecimal id = em.createQuery("select max(u.id) from Rooms u", BigDecimal.class).getSingleResult();
            id = id.add(new BigDecimal(1));
            Rooms newo = new Rooms();
            newo.setId(id);
            newo.setPrice(price);
            newo.setFloor(floor);
            newo.setCapacity(capacity);
            newo.setDescription(description);
            newo.setImg(img);
            em.persist(newo);
         
            return true;
        }
        catch(Exception ex)
        {
            System.out.println(ex.getMessage());
            return false;
        }
    }

    @Override
    public Boolean Update(BigDecimal id,BigInteger price,BigInteger capacity,String img,BigInteger floor,String description) {
        try
        {
        
            Rooms newo = (Rooms)em.find(Rooms.class, id);
            newo.setPrice(price);
            newo.setFloor(floor);
            newo.setCapacity(capacity);
            newo.setDescription(description);
            newo.setImg(img);
        
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
            Rooms newo = (Rooms)em.find(Rooms.class, Id);
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
         Rooms cust = (Rooms)em.find(Rooms.class, Id);
        return cust;
    }

    @Override
    public List findAll() {
        Query query = em.createNamedQuery("Rooms.findAll");
        return query.getResultList();
    }
    
    @Override
    public List findEmptyRoom() {
        Query query = em.createNativeQuery("SELECT r.* FROM Rooms r where r.id not in (select b.roomid from Bookings b)",Rooms.class);
        return query.getResultList();
    }
    
}
