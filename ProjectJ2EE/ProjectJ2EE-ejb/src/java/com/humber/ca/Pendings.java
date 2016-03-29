/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.humber.ca;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author khai
 */
@Entity
@Table(name = "PENDINGS")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Pendings.findAll", query = "SELECT p FROM Pendings p"),
    @NamedQuery(name = "Pendings.findById", query = "SELECT p FROM Pendings p WHERE p.id = :id"),
    @NamedQuery(name = "Pendings.findByTimecall", query = "SELECT p FROM Pendings p WHERE p.timecall = :timecall"),
    @NamedQuery(name = "Pendings.findByStatus", query = "SELECT p FROM Pendings p WHERE p.status = :status")})
public class Pendings implements Serializable {
    private static final long serialVersionUID = 1L;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "ID")
    private BigDecimal id;
    @Column(name = "TIMECALL")
    @Temporal(TemporalType.TIMESTAMP)
    private Date timecall;
    @Size(max = 2)
    @Column(name = "STATUS")
    private String status;
    @JoinColumn(name = "ROOMID", referencedColumnName = "ID")
    @ManyToOne
    private Rooms roomid;
    @JoinColumn(name = "SERVICEID", referencedColumnName = "ID")
    @ManyToOne
    private Services serviceid;

    public Pendings() {
    }

    public Pendings(BigDecimal id) {
        this.id = id;
    }

    public BigDecimal getId() {
        return id;
    }

    public void setId(BigDecimal id) {
        this.id = id;
    }

    public Date getTimecall() {
        return timecall;
    }

    public void setTimecall(Date timecall) {
        this.timecall = timecall;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Rooms getRoomid() {
        return roomid;
    }

    public void setRoomid(Rooms roomid) {
        this.roomid = roomid;
    }

    public Services getServiceid() {
        return serviceid;
    }

    public void setServiceid(Services serviceid) {
        this.serviceid = serviceid;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Pendings)) {
            return false;
        }
        Pendings other = (Pendings) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.humber.ca.Pendings[ id=" + id + " ]";
    }
    
}
