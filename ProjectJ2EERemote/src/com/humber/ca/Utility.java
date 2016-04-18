/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.humber.ca;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import model.Criteria;
import model.CriteriaPrice;

/**
 *
 * @author Ziyi
 */
public class Utility {
    private static final Utility INSTANCE = new Utility();
    
    private Utility(){}
    
    public static Utility getInstance(){
        return INSTANCE;
    }
    public Date getDate(String dateInString){
        try {
            //Calendar calendar = Calendar.getInstance();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
            return sdf.parse(dateInString);
        } catch (Exception e) {
        }
        return null;
    }
//    public BigDecimal getBigDecimal(String str){
//        return new BigDecimal(str);
//    }
    //.get("dateRange").get("dateFrom") <--or dateTo
    //.get("floorRange").get("floorFrom") <--floorTo
    //for(HashMap hm: .get("priceRange")){ hm.get("priceFrom") <--priceTo
    public Criteria createCriteria(String dateMin,
                                    String dateMax,
                                    String floorMin,
                                    String floorMax,
                                    String priceMin,
                                    String priceMax,
                                    String[] priceCheckbox,
                                    String sortingType){
        Criteria crt = new Criteria();
        List<CriteriaPrice> crtPList = new ArrayList<>();     
        
        if((!"".equals(dateMin))&&(!"".equals(dateMax))){
            crt.setCriteriaDateMin(dateMin);
            crt.setCriteriaDateMax(dateMax);
        }
        if((!"".equals(floorMin))&&(!"".equals(floorMax))){
            crt.setCriteriaFloorMin(floorMin);
            crt.setCriteriaFloorMax(floorMax);
        }
        
        
        if((!"".equals(priceMin))&&(!"".equals(priceMax))){
            CriteriaPrice crtP = new CriteriaPrice();
            crtP.setPriceMin(priceMin);
            crtP.setPriceMax(priceMax);
            crtPList.add(crtP);
        }
//        lt75
//        75to124
//        125to199
//        200to299
//        gt300
        if(priceCheckbox!=null)
        for (String s :priceCheckbox){
            switch(s){
                case "lt75":
                {
                    CriteriaPrice crtP = new CriteriaPrice();
                    crtP.setPriceMin("0");
                    crtP.setPriceMax("75");
                    crtPList.add(crtP);
                    break;
                }
                case "75to124":
                {
                    CriteriaPrice crtP = new CriteriaPrice();
                    crtP.setPriceMin("75");
                    crtP.setPriceMax("124");
                    crtPList.add(crtP);
                    break;
                }
                case "125to199":
                {
                    CriteriaPrice crtP = new CriteriaPrice();
                    crtP.setPriceMin("125");
                    crtP.setPriceMax("199");
                    crtPList.add(crtP);
                    break;
                }
                case "200to299":
                {
                    CriteriaPrice crtP = new CriteriaPrice();
                    crtP.setPriceMin("200");
                    crtP.setPriceMax("299");
                    crtPList.add(crtP);
                    break;
                }
                case "gt300":
                {
                    CriteriaPrice crtP = new CriteriaPrice();
                    crtP.setPriceMin("300");
                    crtP.setPriceMax("10000");
                    crtPList.add(crtP);
                    break;
                }
            }
        }
        
        if(!crtPList.isEmpty())
            crt.setCriteriaPriceList(crtPList);
        crt.setSortingType(sortingType);
        int x =1;
        return crt;
    }   
}
