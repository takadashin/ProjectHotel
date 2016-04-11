package com.humber.ca;

import com.humber.ca.Pendings;
import java.math.BigDecimal;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-04-11T12:12:02")
@StaticMetamodel(Services.class)
public class Services_ { 

    public static volatile CollectionAttribute<Services, Pendings> pendingsCollection;
    public static volatile SingularAttribute<Services, String> name;
    public static volatile SingularAttribute<Services, String> description;
    public static volatile SingularAttribute<Services, String> textmsg;
    public static volatile SingularAttribute<Services, BigDecimal> id;

}