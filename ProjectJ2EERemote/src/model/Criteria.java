/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.HashMap;
import java.util.List;

/**
 *
 * @author Ziyi
 */
public class Criteria {
    String criteriaFloorMin;
    String criteriaFloorMax;
    String criteriaDateMin;
    String criteriaDateMax;
    List<CriteriaPrice> criteriaPriceList;
    
    public final String DEFAULT = "b.ID ASC";
    public final String PRICE_ASC = "r.PRICE ASC";
    public final String PRICE_DESC = "r.PRICE DESC";
    public final String FLOOR_ASC = "r.FLOOR ASC";
    public final String FLOOR_DESC = "r.FLOOR DESC";
    public final String CHECKIN_ASC = "b.CHECKIN ASC";
    public final String CHECKIN_DESC = "b.CHECKIN DESC";
    
    String sortingType = DEFAULT;

    public String getCriteriaFloorMin() {
        return criteriaFloorMin;
    }

    public void setCriteriaFloorMin(String criteriaFloorMin) {
        this.criteriaFloorMin = criteriaFloorMin;
    }

    public String getCriteriaFloorMax() {
        return criteriaFloorMax;
    }

    public void setCriteriaFloorMax(String criteriaFloorMax) {
        this.criteriaFloorMax = criteriaFloorMax;
    }

    public String getCriteriaDateMin() {
        return criteriaDateMin;
    }

    public void setCriteriaDateMin(String criteriaDateMin) {
        this.criteriaDateMin = criteriaDateMin;
    }

    public String getCriteriaDateMax() {
        return criteriaDateMax;
    }

    public void setCriteriaDateMax(String criteriaDateMax) {
        this.criteriaDateMax = criteriaDateMax;
    }

    public List<CriteriaPrice> getCriteriaPriceList() {
        return criteriaPriceList;
    }

    public void setCriteriaPriceList(List<CriteriaPrice> criteriaPriceList) {
        this.criteriaPriceList = criteriaPriceList;
    }

    public String getSortingType() {
        return sortingType;
    }

    public void setSortingType(String sortingType) {
        this.sortingType = sortingType;
    }
}
