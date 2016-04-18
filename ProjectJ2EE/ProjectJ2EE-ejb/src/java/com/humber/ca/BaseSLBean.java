/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.humber.ca;

import java.math.BigDecimal;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;

/**
 *
 * @author Ziyi
 */
//@Stateless
public abstract class BaseSLBean<T> implements BaseSLBeanRemote<T> {

    private Class<T> entityClass;
    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")

    public BaseSLBean(Class<T> entityClass){
        this.entityClass = entityClass;
    }

    @Override
    public List<T> listAllEntities() {
        javax.persistence.criteria.CriteriaQuery cq = getEntityManager().getCriteriaBuilder().createQuery();
        cq.select(cq.from(entityClass));
        return getEntityManager().createQuery(cq).getResultList();
    }

    @Override
    public String insertNewEntity(T entity) {
        try {
            getEntityManager().persist(entity);
            return "insertNewEntity() success!";
        } catch (Exception e) {
            System.err.print("===zeke insertNewEntity() " + e.getMessage());
        }
        return null;
    }

    @Override
    public abstract EntityManager getEntityManager();

    @Override
    public T getById(Object id) {
        return getEntityManager().find(entityClass, id);
    }
    
    @Override
    public String update(T entity) {
        try {
            getEntityManager().merge(entity);
            return "update(T entity) success!";
        } catch (Exception e) {
            System.err.print("===zeke update(T entity): " + e.getMessage());
        }
        return null;    
    }

    @Override
    public String delete(T entity) {
        try {
            getEntityManager().remove(getEntityManager().merge(entity));
            return "delete(T entity) success!";
        } catch (Exception e) {
            System.err.print("===zeke delete(T entity): " + e.getMessage());
        }
        return null;
    }

    @Override
    public int count() {
        int n = listAllEntities().size();
        return n;
    }

    @Override
    public BigDecimal getNextAvailableId() {
        for(int i = 1; ; i ++){
            BigDecimal id = new BigDecimal(i);
            if(getById(id) == null)
                return id;
        }
    }
    
}
