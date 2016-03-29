/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.humber.ca;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.BigInteger;
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
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author khai
 */
@Entity
@Table(name = "BOOKINGS")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Bookings.findAll", query = "SELECT b FROM Bookings b"),
    @NamedQuery(name = "Bookings.findById", query = "SELECT b FROM Bookings b WHERE b.id = :id"),
    @NamedQuery(name = "Bookings.findByCheckin", query = "SELECT b FROM Bookings b WHERE b.checkin = :checkin"),
    @NamedQuery(name = "Bookings.findByCheckout", query = "SELECT b FROM Bookings b WHERE b.checkout = :checkout"),
    @NamedQuery(name = "Bookings.findByCreateAt", query = "SELECT b FROM Bookings b WHERE b.createAt = :createAt"),
    @NamedQuery(name = "Bookings.findByNumadult", query = "SELECT b FROM Bookings b WHERE b.numadult = :numadult"),
    @NamedQuery(name = "Bookings.findByNumchild", query = "SELECT b FROM Bookings b WHERE b.numchild = :numchild")})
public class Bookings implements Serializable {
    private static final long serialVersionUID = 1L;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "ID")
    private BigDecimal id;
    @Column(name = "CHECKIN")
    @Temporal(TemporalType.TIMESTAMP)
    private Date checkin;
    @Column(name = "CHECKOUT")
    @Temporal(TemporalType.TIMESTAMP)
    private Date checkout;
    @Column(name = "CREATE_AT")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createAt;
    @Column(name = "NUMADULT")
    private BigInteger numadult;
    @Column(name = "NUMCHILD")
    private BigInteger numchild;
    @JoinColumn(name = "ROOMID", referencedColumnName = "ID")
    @ManyToOne
    private Rooms roomid;
    @JoinColumn(name = "USERID", referencedColumnName = "ID")
    @ManyToOne
    private Users userid;

    public Bookings() {
    }

    public Bookings(BigDecimal id) {
        this.id = id;
    }

    public BigDecimal getId() {
        return id;
    }

    public void setId(BigDecimal id) {
        this.id = id;
    }

    public Date getCheckin() {
        return checkin;
    }

    public void setCheckin(Date checkin) {
        this.checkin = checkin;
    }

    public Date getCheckout() {
        return checkout;
    }

    public void setCheckout(Date checkout) {
        this.checkout = checkout;
    }

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

    public BigInteger getNumadult() {
        return numadult;
    }

    public void setNumadult(BigInteger numadult) {
        this.numadult = numadult;
    }

    public BigInteger getNumchild() {
        return numchild;
    }

    public void setNumchild(BigInteger numchild) {
        this.numchild = numchild;
    }

    public Rooms getRoomid() {
        return roomid;
    }

    public void setRoomid(Rooms roomid) {
        this.roomid = roomid;
    }

    public Users getUserid() {
        return userid;
    }

    public void setUserid(Users userid) {
        this.userid = userid;
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
        if (!(object instanceof Bookings)) {
            return false;
        }
        Bookings other = (Bookings) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.humber.ca.Bookings[ id=" + id + " ]";
    }
    
}
