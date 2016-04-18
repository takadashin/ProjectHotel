package com.humber.ca;

import com.humber.ca.Rooms;
import com.humber.ca.Services;
import java.math.BigDecimal;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-04-18T12:45:12")
@StaticMetamodel(Pendings.class)
public class Pendings_ { 

    public static volatile SingularAttribute<Pendings, BigDecimal> id;
    public static volatile SingularAttribute<Pendings, Services> serviceid;
    public static volatile SingularAttribute<Pendings, Rooms> roomid;
    public static volatile SingularAttribute<Pendings, Date> timecall;
    public static volatile SingularAttribute<Pendings, String> status;

}