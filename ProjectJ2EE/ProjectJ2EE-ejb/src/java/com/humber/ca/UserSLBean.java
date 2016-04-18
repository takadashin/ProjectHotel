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
    public Boolean Insert(String firstname,String lastname,String email,String password,String address,String city,String state,
            String country,String zip,String phone,String company,String Type) {
        try
        {
            Query query = em.createNamedQuery("Users.findByEmail").setParameter("email", email);
            List<Users> result = query.getResultList();
            if(result.size() >0)
            {
                return false;
            }
            
            BigDecimal id = em.createQuery("select max(u.id) from Users u", BigDecimal.class).getSingleResult();
            id = id.add(new BigDecimal(1));
            Users newo = new Users();
            newo.setId(id);
            newo.setFirstname(firstname);
            newo.setLastname(lastname);
            newo.setPassword(password);
            newo.setAddress(address);
            newo.setCity(city);
            newo.setState(state);
            newo.setCountry(country);
            newo.setZip(zip);
            newo.setPhone(phone);
            newo.setCompany(company);
            newo.setEmail(email);
            newo.setType(Type);
            em.persist(newo);
         
            return true;
        }
        catch(Exception ex)
        {
            return false;
        }
    }

    @Override
    public Boolean Update(BigDecimal id,String firstname,String lastname,String email,String password,String address,String city,String state,
            String country,String zip,String phone,String company,String Type) {
        try
        {
        
            Users newo = (Users)em.find(Users.class, id);
            newo.setFirstname(firstname);
            newo.setLastname(lastname);
            newo.setPassword(password);
            newo.setAddress(address);
            newo.setCity(city);
            newo.setState(state);
            newo.setCountry(country);
            newo.setZip(zip);
            newo.setPhone(phone);
            newo.setEmail(email);
            newo.setCompany(company);
            newo.setType(Type);
        
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
        Query query = em.createNamedQuery("Users.findAll");
        return query.getResultList();
    }
    
    @Override
    public Object authentication(String email,String password) {
        Query query = em.createNamedQuery("Users.findByEmail").setParameter("email", email);
        List<Users> result = query.getResultList();
        if(result.size() >0)
        {
            Users target = result.get(0);
            if(target.getPassword().equals(password))
                return target;
        }
        return null;
    }
}
