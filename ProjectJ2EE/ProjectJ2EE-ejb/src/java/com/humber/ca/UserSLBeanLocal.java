/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.humber.ca;

import java.math.BigDecimal;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author khai
 */
@Local
public interface UserSLBeanLocal {
     Boolean Insert(String firstname,String lastname,String email,String password,String address,String city,String state,String country,String zip,String phone,String company,String Type);

    Boolean Update(BigDecimal id,String firstname,String lastname,String email,String password,String address,String city,String state,
            String country,String zip,String phone,String company,String Type);

    Boolean delete(BigDecimal Id);

    Object SearchByID(BigDecimal Id);
    Object authentication(String email,String password);
    List findAll();
}
