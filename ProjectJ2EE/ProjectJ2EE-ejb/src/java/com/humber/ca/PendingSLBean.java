/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.humber.ca;

import java.math.BigDecimal;
import java.util.Date;
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
public class PendingSLBean implements PendingSLBeanRemote, PendingSLBeanLocal {

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
    @javax.persistence.PersistenceContext(unitName="ProjectJ2EE-ejbPU")
    private EntityManager em ;
    
    @Override
    public Boolean Insert(BigDecimal RoomID, BigDecimal ServiceID,Date Timecall,String Status ) {
        try
        { 
        
            
            BigDecimal id = em.createQuery("select max(u.id) from Pendings u", BigDecimal.class).getSingleResult();
            id = id.add(new BigDecimal(1));
            Pendings newo = new Pendings();
            newo.setId(id);
            Rooms roomob = (Rooms)em.find(Rooms.class,RoomID);
            Services serviceob = (Services)em.find(Services.class,ServiceID);
            
            newo.setRoomid(roomob);
            newo.setServiceid(serviceob);
            newo.setTimecall(Timecall);
            newo.setStatus(Status);
            em.persist(newo);
         
            return true;
        }
        catch(Exception ex)
        {
            return false;
        }
    }

    @Override
    public Boolean Update(BigDecimal Id,BigDecimal RoomID, BigDecimal ServiceID,Date Timecall,String Status ) {
        try
        {
        
            Pendings newo = (Pendings)em.find(Pendings.class, Id);
            Rooms roomob = (Rooms)em.find(Rooms.class,RoomID);
            Services serviceob = (Services)em.find(Services.class,ServiceID);
            
            newo.setRoomid(roomob);
            newo.setServiceid(serviceob);
            newo.setTimecall(Timecall);
            newo.setStatus(Status);
        
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
            Pendings newo = (Pendings)em.find(Pendings.class, Id);
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
         Pendings cust = (Pendings)em.find(Pendings.class, Id);
        return cust;
    }

    @Override
    public List findAll() {
        Query query = em.createNamedQuery("Pendings.findAll");
        return query.getResultList();
    }
    
}
