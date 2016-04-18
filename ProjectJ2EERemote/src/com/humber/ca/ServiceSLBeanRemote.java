/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.humber.ca;

import java.math.BigDecimal;
import java.util.List;
import javax.ejb.Remote;

/**
 *
 * @author khai
 */
@Remote
public interface ServiceSLBeanRemote {
    Boolean Insert(String Name,String Description,String Textmsg);

    Boolean Update(BigDecimal id,String Name,String Description,String Textmsg);
    Boolean delete(BigDecimal Id);

    Object SearchByID(BigDecimal Id);

    List findAll();
}
