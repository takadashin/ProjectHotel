/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.humber.ca;

import java.util.HashMap;
import java.util.List;
import javax.ejb.Remote;
import javax.persistence.EntityManager;
import model.Criteria;

/**
 *
 * @author Ziyi
 */
@Remote
public interface RoomAdminSLBeanRemote extends BaseSLBeanRemote{
    EntityManager getEntityManager();
    List advancedSearchRooms(HashMap criteria);
    List advancedSearch(Criteria crt);
}
