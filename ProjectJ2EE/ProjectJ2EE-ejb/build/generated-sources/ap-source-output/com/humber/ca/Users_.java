package com.humber.ca;

import com.humber.ca.Bookings;
import java.math.BigDecimal;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-04-11T12:12:02")
@StaticMetamodel(Users.class)
public class Users_ { 

    public static volatile SingularAttribute<Users, String> zip;
    public static volatile SingularAttribute<Users, String> country;
    public static volatile SingularAttribute<Users, String> firstname;
    public static volatile SingularAttribute<Users, String> address;
    public static volatile SingularAttribute<Users, String> city;
    public static volatile CollectionAttribute<Users, Bookings> bookingsCollection;
    public static volatile SingularAttribute<Users, String> lastname;
    public static volatile SingularAttribute<Users, String> password;
    public static volatile SingularAttribute<Users, String> phone;
    public static volatile SingularAttribute<Users, String> company;
    public static volatile SingularAttribute<Users, BigDecimal> id;
    public static volatile SingularAttribute<Users, String> state;
    public static volatile SingularAttribute<Users, String> email;

}