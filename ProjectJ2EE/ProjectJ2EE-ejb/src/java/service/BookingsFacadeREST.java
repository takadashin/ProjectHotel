/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import com.humber.ca.Bookings;
import com.humber.ca.Rooms;
import com.humber.ca.Users;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;

/**
 *
 * @author khai
 */
@Stateless
@Path("com.humber.ca.bookings")
public class BookingsFacadeREST extends AbstractFacade<Bookings> {
    @PersistenceContext(unitName = "ProjectJ2EE-ejbPU")
    private EntityManager em;

    public BookingsFacadeREST() {
        super(Bookings.class);
    }

    @POST
    @Override
    @Consumes({"application/xml", "application/json"})
    public void create(Bookings entity) {
        super.create(entity);
    }

    @PUT
    @Path("{id}")
    @Consumes({"application/xml", "application/json"})
    public void edit(@PathParam("id") BigDecimal id, Bookings entity) {
        super.edit(entity);
    }

    @DELETE
    @Path("{id}")
    public void remove(@PathParam("id") BigDecimal id) {
        super.remove(super.find(id));
    }

    @GET
    @Path("{id}")
    @Produces({"application/xml", "application/json"})
    public Bookings find(@PathParam("id") BigDecimal id) {
        return super.find(id);
    }

    @GET
    @Override
    @Produces({"application/xml", "application/json"})
    public List<Bookings> findAll() {
        return super.findAll();
    }

    @GET
    @Path("{from}/{to}")
    @Produces({"application/xml", "application/json"})
    public List<Bookings> findRange(@PathParam("from") Integer from, @PathParam("to") Integer to) {
        return super.findRange(new int[]{from, to});
    }

    @GET
    @Path("count")
    @Produces("text/plain")
    public String countREST() {
        return String.valueOf(super.count());
    }
    
    @GET
    @Path("bookroom/{roomid}/{checkin}/{checkout}/{numadult}/{numkid}")
    @Produces("text/plain")
    public String Insert(@PathParam("roomid") BigDecimal RoomID,@PathParam("checkin") String CheckIn,@PathParam("checkout") String CheckOut,@PathParam("numadult") BigInteger numadult,@PathParam("numkid") BigInteger numkid ) {
        try
        {
        
            
            BigDecimal id = em.createQuery("select max(u.id) from Bookings u", BigDecimal.class).getSingleResult();
            id = id.add(new BigDecimal(1));
            Bookings newo = new Bookings();
            newo.setId(id);
            Rooms roomob = (Rooms)em.find(Rooms.class,RoomID);
            Users userob = (Users)em.find(Users.class,new BigDecimal("10"));
            
            newo.setRoomid(roomob);
            newo.setUserid(userob);
            DateFormat df = new SimpleDateFormat("MM-dd-yyyy hh:mm a"); 
            
            newo.setCheckin(df.parse(CheckIn));
            newo.setCheckout(df.parse(CheckOut));
            newo.setNumadult(numadult);
            newo.setNumchild(numkid);
            newo.setCreateAt(Calendar.getInstance().getTime());
            em.persist(newo);
           
         
            return "true";
        }
        catch(Exception ex)
        {
            return "false";
        }
    }
    
    @Override
    protected EntityManager getEntityManager() {
        return em;
    }
    
}
