package com.humber.ca;

import com.humber.ca.Rooms;
import com.humber.ca.Users;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-04-18T12:45:12")
@StaticMetamodel(Bookings.class)
public class Bookings_ { 

    public static volatile SingularAttribute<Bookings, Date> checkin;
    public static volatile SingularAttribute<Bookings, BigInteger> numadult;
    public static volatile SingularAttribute<Bookings, BigInteger> numchild;
    public static volatile SingularAttribute<Bookings, BigDecimal> id;
    public static volatile SingularAttribute<Bookings, Date> checkout;
    public static volatile SingularAttribute<Bookings, Users> userid;
    public static volatile SingularAttribute<Bookings, Date> createAt;
    public static volatile SingularAttribute<Bookings, Rooms> roomid;

}