/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.humber.ca;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author khai
 */
@Local
public interface PendingSLBeanLocal {
    Boolean Insert(BigDecimal RoomID, BigDecimal ServiceID,Date Timecall,String Status );

    Boolean Update(BigDecimal Id,BigDecimal RoomID, BigDecimal ServiceID,Date Timecall,String Status );

    Boolean delete(BigDecimal Id);

    Object SearchByID(BigDecimal Id);

    List findAll();
    List findByRoomID(BigDecimal id);
}
