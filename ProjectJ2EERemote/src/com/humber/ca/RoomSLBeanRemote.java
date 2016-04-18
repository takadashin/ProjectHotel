/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.humber.ca;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.List;
import javax.ejb.Remote;

/**
 *
 * @author khai
 */
@Remote
public interface RoomSLBeanRemote {
    Boolean Insert(BigInteger price,BigInteger capacity,String img,BigInteger floor,String description);

    Boolean Update(BigDecimal id,BigInteger price,BigInteger capacity,String img,BigInteger floor,String description);

    Boolean delete(BigDecimal Id);

    Object SearchByID(BigDecimal Id);

    List findAll();
    List findEmptyRoom();
     List findUserRoom(BigDecimal id) ;
}
