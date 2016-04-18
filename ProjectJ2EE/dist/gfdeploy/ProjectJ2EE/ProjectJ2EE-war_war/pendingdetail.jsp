<%-- 
    Document   : index
    Created on : 29-Mar-2016, 5:37:15 PM
    Author     : khai
--%>

<%@page import="com.humber.ca.Services"%>
<%@page import="com.humber.ca.ServiceSLBeanRemote"%>
<%@page import="com.humber.ca.PendingSLBeanRemote"%>
<%@page import="com.humber.ca.Pendings"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.humber.ca.Rooms"%>
<%@page import="com.humber.ca.RoomSLBeanRemote"%>
<%@page import="com.humber.ca.UserSLBeanRemote"%>
<%@page import="com.humber.ca.Users"%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="com.humber.ca.BookSLBeanRemote"%>
<%@page import="com.humber.ca.Bookings"%>
<%@page import="javax.naming.InitialContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Booking Hotel Room HomePage</title>

    <!-- Bootstrap Core CSS -->
    <link href="resource/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="resource/css/shop-homepage.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.7.14/css/bootstrap-datetimepicker.min.css" rel="stylesheet"/>
    
</head>

<body>

    <!-- Navigation -->
    <%@include file='layout/header.jsp'%>

    <!-- Page Content -->
    <div class="container">

        <div class="row">
            <%@include file='layout/menu.jsp'%>
            

            <div class="col-md-9">
                   <%
                    InitialContext ic = new InitialContext();
                    Object o = ic.lookup(PendingSLBeanRemote.class.getName());
                    PendingSLBeanRemote roomSession = (PendingSLBeanRemote) o;
                    DateFormat df = new SimpleDateFormat("MM/dd/yyyy hh:mm a"); 
                    Date today = Calendar.getInstance().getTime();
                    RoomSLBeanRemote roomobSession = (RoomSLBeanRemote) ic.lookup(RoomSLBeanRemote.class.getName());
                    ServiceSLBeanRemote serviceSession = (ServiceSLBeanRemote) ic.lookup(ServiceSLBeanRemote.class.getName());
                    
                    if(request.getParameter("btninsert")!= null)   
                    {
                        if(request.getParameter("editid") == null)
                        {
                           
                            //04/20/2016 7:25 PM
                            
                            boolean check = roomSession.Insert(new BigDecimal(request.getParameter("cb_room")),new BigDecimal(request.getParameter("cb_service")),df.parse(request.getParameter("dtp_timecall")),request.getParameter("optradio"));
                        if(check)
                        {%>
                            <div class="alert alert-success" role="alert">  <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>Insert success</div>
                        <%
                            }
                        else{
                                 %>
                            <div class="alert alert-danger" role="alert">  <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>Insert not success</div>
                        <%
                                }
                        }
                        else
                        {
                          
                             boolean check = roomSession.Update(new BigDecimal(request.getParameter("editid")),new BigDecimal(request.getParameter("cb_room")),new BigDecimal(request.getParameter("cb_service")),df.parse(request.getParameter("dtp_timecall")),request.getParameter("optradio"));
                            if(check)
                        {%>
                            <div class="alert alert-success" role="alert">  <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>Update success</div>
                        <%
                            }
                        else{
                                 %>
                            <div class="alert alert-danger" role="alert">  <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>Update not success</div>
                        <%
                                }
                        }
                    }
                    Pendings newobject = null;
                    if(request.getParameter("editid") != null)
                        {
                       
                        newobject = (Pendings) roomSession.SearchByID(new BigDecimal(request.getParameter("editid")));
                        }
                    
                    List<Rooms> allroom = roomobSession.findAll();
                    if(newobject==null)
                        allroom = roomobSession.findUserRoom(new BigDecimal(checkuser.getUserID()));
                    List<Services> allservice = serviceSession.findAll();
             %>
            <!-- /.row -->

            
            <div class="row">
                <div class="col-lg-12">
                    <form method="POST" action="pendingdetail.jsp<%=(request.getParameter("editid")!= null)?"?editid="+request.getParameter("editid"):""%>">
                       
                        <div class="form-group">
                            <label for="comment" >Room</label>
                            <select class="form-control" name="cb_room">
                                <%if(newobject!=null)
                                out.println(" <option value='"+newobject.getRoomid().getId()+"'>Room "+newobject.getRoomid().getId()+"</option>");
                                else                               
                                for(Rooms item : allroom)
                                {
                                    
                                %>
                    
                                <option <%=(newobject!=null)?newobject.getRoomid().getId().equals(item.getId())?"selected":"":""%> value="<%=item.getId()%>">Room <%=item.getId()%></option> <%
                                }
                                %>
                              </select>
                        </div>
                        <div class="form-group">
                            <label for="comment" >Service</label>
                            <select class="form-control" name="cb_service">
                                <%
                                for(Services item : allservice)
                                {
                                %><option <%=(newobject!=null)?newobject.getServiceid().getId().equals(item.getId())?"selected":"":""%> value="<%=item.getId()%>"> <%=item.getName()%></option> <%
                                }
                                %>
                              </select>
                        </div>
                        <div class="form-group">
                            <label for="comment" >Status </label>
                            <label class="radio-inline"><input  type="radio" <%=(newobject!=null)?newobject.getStatus()!=null?newobject.getStatus().equals("A")?"checked":"":"":""%> value="A" name="optradio">Active</label>
                            <label class="radio-inline"><input type="radio"  <%=(newobject!=null)?newobject.getStatus()!=null?newobject.getStatus().equals("D")?"checked":"":"":""%> value="D" name="optradio">De Active</label>

                        </div>
                         <div class="form-group">
                            <label for="comment" >Time call</label>
                        </div>   
                       <div class="col-sm-6 form-group">
                                        <div class='input-group date' id='datetimepicker1'>
                                            <input type='text' class="form-control" name="dtp_timecall"  value="<%=(newobject!=null)?newobject.getTimecall()!=null?df.format(newobject.getTimecall()):df.format(today):df.format(today)%>"/>
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                        </div>
                        </div>
                              
                        <button type="submit" class="btn btn-info pull-right" name="btninsert"><%=(request.getParameter("editid")!= null)?"Save":"Insert"%></button>
                    </form>
                </div>
                <!-- /.col-lg-12 -->
            </div>
                <!-- /.col-lg-12 -->
            

        </div>

    </div>
    <!-- /.container -->

    <%@include file='layout/footter.jsp'%>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="resource/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="resource/js/bootstrap.min.js"></script>
     <script src="resource/js/moment.min.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.7.14/js/bootstrap-datetimepicker.min.js"></script>

</body>
 <script>
    $(document).ready(function () {
  //called when key is pressed in textbox
        $('#datetimepickercheckin').datetimepicker({
            
        
            ignoreReadonly: true           
        });
        $('#datetimepickercheckout').datetimepicker({
            
        
            ignoreReadonly: true           
        });
        
      
       }); 
          </script>
</html>

