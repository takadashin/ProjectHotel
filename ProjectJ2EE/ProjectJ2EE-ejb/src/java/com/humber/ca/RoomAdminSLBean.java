/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.humber.ca;

import java.math.BigDecimal;
import java.math.BigInteger;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import javax.ejb.Stateless;
import javax.ejb.TransactionManagement;
import javax.ejb.TransactionManagementType;
import javax.persistence.EntityManager;
import model.Criteria;
import model.CriteriaPrice;

/**
 *
 * @author Ziyi
 */
@Stateless
@TransactionManagement(value = TransactionManagementType.CONTAINER)
public class RoomAdminSLBean extends BaseSLBean implements RoomAdminSLBeanRemote {
    @javax.persistence.PersistenceContext(unitName = "ProjectJ2EE-ejbPU")
    private EntityManager em;
    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
    public RoomAdminSLBean() {
        super(Rooms.class);
    }
    @Override
    public EntityManager getEntityManager() {
        
        return em;
    }
    
    
    @Override
    public List advancedSearchRooms(HashMap criteria) {
        //        select b.BOOKING_ID, u.USER_NAME, r.ROOM_NUMBER, b.CHECKIN, b.CHECKOUT, r.ROOM_PRICE 
        //        from room_booking b
        //        inner join room r on b.ROOM_ID = r.ROOM_ID
        //        inner join user_ht u on b.USER_ID = u.USER_ID
        //        where true
        //        AND b.CHECKIN > '2016-03-05'
        //        AND b.CHECKOUT < '2016-05-05'
        //        AND SUBSTR(r.ROOM_NUMBER,1, 1) = '3'
        //        OR SUBSTR(r.ROOM_NUMBER,1, 1) = '2'
        //        OR SUBSTR(r.ROOM_NUMBER,1, 1) = '1'
        //        AND r.ROOM_PRICE >= 0.0
        //        AND r.ROOM_PRICE >=500.0
        //        order by b.BOOKING_ID;
        
        String justForRef = "...where (true" 
                                                                + "[and/or xx]" + " ) and (true " 
                                                                + "[and/or xx]" + " ) and (true " 
                                                                +  "[and/or xx]" + " ) " 
                            + " order by ...";
        
        String queryPart1 = "select b.BOOKING_ID, u.USER_NAME, r.ROOM_NUMBER, b.CHECKIN, b.CHECKOUT, r.ROOM_PRICE "
                + "from room_booking b "
                + "inner join room r on b.ROOM_ID = r.ROOM_ID "
                + "inner join user_ht u on b.USER_ID = u.USER_ID "
                + "where ( true ";
        String queryPart2DateCriteria = "";
        String queryPart2FloorCriteria = "";
        String queryPart2PriceCriteria = "";
        String queryPart2ConnectorA = " ) and (true " ;
        String queryPart2ConnectorB = " ) " ;
        String queryPart3 = " order by b.BOOKING_ID";
        
        //.get("dateRange").get("dateFrom") <--or dateTo
        //.get("floorRange").get("floorFrom") <--floorTo
        //for(HashMap hm: .get("priceRange")){ hm.get("priceFrom") <--priceTo
        if(criteria.get("dateRange")!=null){
            String dateFrom = (String)((HashMap)criteria.get("dateRange")).get("dateFrom");
            String dateTo = (String)((HashMap)criteria.get("dateRange")).get("dateTo");
            //AND b.CHECKIN >= '16-04-01' AND b.CHECKOUT <= '16-04-02'
            queryPart2DateCriteria += ("AND b.CHECKIN >= '" + dateFrom + "' ");
            queryPart2DateCriteria += ("AND b.CHECKOUT <= '" + dateTo + "' ");
        }
        if(criteria.get("floorRange")!=null){
            int floorMin = Integer.parseInt((String)((HashMap)criteria.get("floorRange")).get("floorFrom"));
            int floorMax = Integer.parseInt((String)((HashMap)criteria.get("floorRange")).get("floorTo"));
            for (int i = floorMin; i <= floorMax; i++) {
                if(i==floorMin)
                    queryPart2FloorCriteria += ("AND SUBSTR(r.ROOM_NUMBER,1, 1) = '" + i + "' ");
                queryPart2FloorCriteria += ("OR SUBSTR(r.ROOM_NUMBER,1, 1) = '" + i + "' ");
            }          
        }
        if(criteria.get("priceRange")!=null){
            ArrayList<HashMap> al = (ArrayList<HashMap>)criteria.get("priceRange");
            queryPart2PriceCriteria += ("AND (r.ROOM_PRICE >= " + (String)(al.get(0).get("priceFrom"))
                        + " AND r.ROOM_PRICE <= " + (String)(al.get(0).get("priceTo")) + ") ");
            for(HashMap hm : al){
                queryPart2PriceCriteria += ("OR (r.ROOM_PRICE >= " + (String)hm.get("priceFrom")
                        + " AND r.ROOM_PRICE <= " + (String)hm.get("priceTo") + ") ");
                //queryPart2 += ("AND r.ROOM_PRICE <= " + (String)hm.get("priceTo"));
            }
        }
        String s = queryPart1 
                                    + queryPart2DateCriteria + queryPart2ConnectorA
                                    + queryPart2FloorCriteria + queryPart2ConnectorA
                                    + queryPart2PriceCriteria + queryPart2ConnectorB
                +queryPart3;
        
        System.out.println(s);
        int x =1;
        List list = (List)em.createNativeQuery(s)
                .getResultList();
        for (Object o: list){
            System.err.println("===zeke o.class is "+o.getClass().toString());
            
            Object[] lo = (Object[])o;//int,str,str,date,date,bdeci
            System.out.println("===zeke: "+(int)lo[0]);//bookingID
            System.out.println("===zeke: "+(String)lo[1]);//UserName          
            System.out.println("===zeke: "+(String)lo[2]);//RoomNo
            System.out.println("===zeke: "+((Date)lo[3]).toString());//checkin
            System.out.println("===zeke: "+((Date)lo[4]).toString());//checkout
            System.out.println("===zeke: "+((BigDecimal)lo[5]).doubleValue());//price

        }
                

        return  list;
    }
    
    @Override
    public List advancedSearch(Criteria crt) {      
        String justForRef1 = "...where ( " 
                                                                + "xx [and/or xx]" + " ) and ( " 
                                                                + "xx [and/or xx]" + " ) and ( " 
                                                                +  "xx [and/or xx]" 
                            + ") order by " + "xx";
        
        String queryPart1 = "select b.ID, u.FIRSTNAME, u.LASTNAME, r.FLOOR, b.CHECKIN, b.CHECKOUT, r.PRICE, u.ID, r.ID "
                + "from bookings b "
                + "join rooms r on b.ROOMID = r.ID "
                + "join users u on b.USERID = u.ID "
                + "where ( ";
        String queryPart2DateCriteria = "";
        String queryPart2FloorCriteria = "";
        String queryPart2PriceCriteria = "";
        String queryPart2ConnectorA = " ) and ( " ;
        String queryPart3 = " ) order by ";//b.ID
        String queryPart4 = "";
        
            //b.CHECKIN >= TO_DATE('2016-04-01','yyyy-mm-dd') AND b.CHECKOUT <= TO_DATE('2016-04-11','yyyy-mm-dd')
            if(crt.getCriteriaDateMin()!=null && crt.getCriteriaDateMax()!=null)
                queryPart2DateCriteria += (" b.CHECKIN >= TO_DATE('" + crt.getCriteriaDateMin() + "', 'yyyy-mm-dd') "
                        + "AND b.CHECKOUT <= TO_DATE('" + crt.getCriteriaDateMax() + "','yyyy-mm-dd') ");
            else if (crt.getCriteriaDateMin()!=null)
                queryPart2DateCriteria += (" b.CHECKIN >= TO_DATE('" + crt.getCriteriaDateMin() + "', 'yyyy-mm-dd') ");
            else if (crt.getCriteriaDateMax()!=null)
                queryPart2DateCriteria += (" b.CHECKOUT <= TO_DATE('" + crt.getCriteriaDateMax() + "','yyyy-mm-dd') ");
        
        //r.floor = 1 or r.floor = 2 or r.floor = 5    
        if(crt.getCriteriaFloorMin()!=null||crt.getCriteriaFloorMax()!=null){
            int floorMin = (crt.getCriteriaFloorMin()!=null)?(Integer.parseInt(crt.getCriteriaFloorMin())):1;
            int floorMax = (crt.getCriteriaFloorMax()!=null)?(Integer.parseInt(crt.getCriteriaFloorMax())):5;
     
            for (int i = floorMin; i <= floorMax; i++) {
                if(i==floorMin)
                    queryPart2FloorCriteria += (" r.floor = " + i);
                queryPart2FloorCriteria += (" OR r.floor = " + i);            
            }            
        }
        
        //(r.price >= 1 and r.price <=150) or (r.price >= 24 and r.price <= 25)
        if(crt.getCriteriaPriceList()!=null){
            List<CriteriaPrice> cpl=  crt.getCriteriaPriceList();
            queryPart2PriceCriteria += (" (r.PRICE >= " + cpl.get(0).getPriceMin()
                        + " AND r.PRICE <= " + cpl.get(0).getPriceMax() + ") ");
            for(CriteriaPrice cp : cpl){
                queryPart2PriceCriteria += ("OR (r.PRICE >= " + cp.getPriceMin()
                        + " AND r.PRICE <= " + cp.getPriceMax() + ") ");
            }
        }
        
        //r.PRICE ASC
        queryPart4 = crt.getSortingType();
        String s = queryPart1 
                                    + queryPart2DateCriteria + queryPart2ConnectorA
                                    + queryPart2FloorCriteria + queryPart2ConnectorA
                                    + queryPart2PriceCriteria
                +queryPart3 + queryPart4;
        
        System.out.println(s);
        int x =1;
        List list = new ArrayList();
        try{
            list = (List)em.createNativeQuery(s)
                .getResultList();
        }catch(Exception e){System.err.println(e.getMessage());}
        for (Object o: list){
            System.err.println("===zeke o.class is "+o.getClass().toString());
            
            Object[] lo = (Object[])o;
            int y =1;
        }
        return  list;
    }
}
