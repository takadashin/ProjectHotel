/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.humber.ca;

import java.math.BigDecimal;
import java.util.List;
import javax.ejb.Remote;
import javax.persistence.EntityManager;

/**
 *
 * @author Ziyi
 */
@Remote
public interface BaseSLBeanRemote<T> {

    List<T> listAllEntities();

    String insertNewEntity(T entity);

    EntityManager getEntityManager();

    T getById(Object id);
    
    String update(T entity);

    String delete(T entity);

    int count();

    BigDecimal getNextAvailableId();
}
