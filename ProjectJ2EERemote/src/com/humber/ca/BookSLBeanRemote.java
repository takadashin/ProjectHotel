/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.humber.ca;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Date;
import java.util.List;
import javax.ejb.Remote;

/**
 *
 * @author khai
 */
@Remote
public interface BookSLBeanRemote {
    Boolean Insert(BigDecimal RoomID, BigDecimal UserID,Date CheckIn,Date CheckOut,BigInteger numadult,BigInteger numkid );

    Boolean Update(BigDecimal id,BigDecimal RoomID, BigDecimal UserID,Date CheckIn,Date CheckOut,BigInteger numadult,BigInteger numkid);

    Boolean delete(BigDecimal Id);

    Object SearchByID(BigDecimal Id);

    List findAll();
    List findByUserID(BigDecimal id);
}
