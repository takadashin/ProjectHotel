<%-- 
    Document   : index
    Created on : 29-Mar-2016, 5:37:15 PM
    Author     : khai
--%>

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
                    PendingSLBeanRemote serviceSession = (PendingSLBeanRemote) o;
                    if(request.getParameter("deletebtn")!= null)   
                    {
                        try{
                            serviceSession.delete(new BigDecimal(request.getParameter("idaction")));
                            %>
                            <div class="alert alert-success" role="alert">  <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>Delete success</div>
                            <%
                        }
                        catch(Exception ex)
                        {
                            %>
                            <div class="alert alert-success" role="alert">  <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span><%=ex.getMessage()%></div>
                            <%
                        }
                        
                       

                    }
             %>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <table class="table">
                    <thead>
                      <tr>
                      
                        <th>SERVICEID</th>
                        <th>ROOMID</th>
                        <th>STATUS</th>
                        <th>TIMECALL</th>
                        <th>Operation</th>
                      </tr>
                    </thead>
                    <tbody>
                   <%
                     if(checkuser == null)
                    {
                        response.sendRedirect("login.jsp");
                    }
                    else if(request.getParameter("editid")!= null)   
                    {
                     List<Pendings> itemList = serviceSession.findByRoomID(new BigDecimal(request.getParameter("editid")));
                     //List<Pendings> itemList = serviceSession.findAll();
                        Iterator i = itemList.iterator();

           
                    while ( i.hasNext() ) {
                        Pendings item = (Pendings) i.next();
                        %>
                        <form action="pendinglist.jsp?editid=<%=request.getParameter("editid")%>" method="POST">
                            <input type="hidden" value="<%=item.getId()%>" name="idaction">
                        <tr>
                            
                            
                            <td><%=item.getServiceid().getName()%></td>
                            <td><%=item.getRoomid().getId()%></td>
                             <td><%=item.getStatus()!= null?item.getStatus().equals("A")?"Active":"De Active":"Not set"%></td>
                            <td><%=item.getTimecall()%></td>
                   
                            <td><button type="submit" class="btn btn-danger" name="deletebtn">Delete</button>
                       <a href="pendingdetail.jsp?editid=<%=item.getId()%>" class="btn btn-info">Edit</a>
                   </td>
                   </tr>
                    </form>
                        <%
                    }
                    }
                     else
                         response.sendRedirect("index.jsp");
                   %>
                      
                    </tbody>
                  </table>
                   <a href="pendingdetail.jsp" class="btn btn-info">Insert</a>
                </div>
                <!-- /.col-lg-12 -->
            </div>
                   
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

