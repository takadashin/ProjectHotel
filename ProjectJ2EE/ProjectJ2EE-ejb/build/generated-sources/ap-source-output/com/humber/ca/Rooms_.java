package com.humber.ca;

import com.humber.ca.Bookings;
import com.humber.ca.Pendings;
import java.math.BigDecimal;
import java.math.BigInteger;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-04-18T12:45:12")
@StaticMetamodel(Rooms.class)
public class Rooms_ { 

    public static volatile SingularAttribute<Rooms, String> img;
    public static volatile SingularAttribute<Rooms, BigInteger> price;
    public static volatile CollectionAttribute<Rooms, Pendings> pendingsCollection;
    public static volatile SingularAttribute<Rooms, String> description;
    public static volatile SingularAttribute<Rooms, BigDecimal> id;
    public static volatile SingularAttribute<Rooms, BigInteger> floor;
    public static volatile CollectionAttribute<Rooms, Bookings> bookingsCollection;
    public static volatile SingularAttribute<Rooms, BigInteger> capacity;

}