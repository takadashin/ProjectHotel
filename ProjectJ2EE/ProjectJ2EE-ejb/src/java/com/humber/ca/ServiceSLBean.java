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
public class ServiceSLBean implements ServiceSLBeanRemote, ServiceSLBeanLocal {

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
    @javax.persistence.PersistenceContext(unitName="ProjectJ2EE-ejbPU")
    private EntityManager em ;
    
    @Override
    public Boolean Insert(String Name,String Description,String Textmsg) {
        try
        {
        
            
            BigDecimal id = em.createQuery("select max(u.id) from Services u", BigDecimal.class).getSingleResult();
            id = id.add(new BigDecimal(1));
            Services newo = new Services();
            newo.setId(id);
            newo.setName(Name);
            newo.setDescription(Description);
            newo.setTextmsg(Textmsg);
            
            em.persist(newo);
         
            return true;
        }
        catch(Exception ex)
        {
            return false;
        }
    }

    @Override
    public Boolean Update(BigDecimal id,String Name,String Description,String Textmsg) {
        try
        {
        
            Services newo = (Services)em.find(Services.class, id);
            
            newo.setName(Name);
            newo.setDescription(Description);
            newo.setTextmsg(Textmsg);
        
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
            Services newo = (Services)em.find(Services.class, Id);
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
         Services cust = (Services)em.find(Services.class, Id);
        return cust;
    }

    @Override
    public List findAll() {
        Query query = em.createNamedQuery("Services.findAll");
        return query.getResultList();
    }
}
