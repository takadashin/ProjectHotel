<%-- 
    Document   : index
    Created on : 29-Mar-2016, 5:37:15 PM
    Author     : khai
--%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="com.humber.ca.RoomSLBeanRemote"%>
<%@page import="com.humber.ca.Rooms"%>
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

</head>

<body>

    <!-- Navigation -->
    <%@include file='layout/header.jsp'%>

    <!-- Page Content -->
    <div class="container">

        <div class="row">
            <%@include file='layout/menu.jsp'%>
            

            <div class="col-md-9">

                

                <div class="row">

                      <%
             InitialContext ic = new InitialContext();
        Object o = ic.lookup(RoomSLBeanRemote.class.getName());
        RoomSLBeanRemote roomSession = (RoomSLBeanRemote) o;
        
          
        
         List<Rooms> itemList = roomSession.findEmptyRoom();
            
            
            Iterator i = itemList.iterator();
            out.println("<table style='  border-collapse: collapse;' class='object_book' border=1 collapse=0>");
            int count = 0;
            while ( i.hasNext() ) {
//                out.println("<tr>");
            count++;
            if(count > 20)
                break;
              Rooms item = (Rooms) i.next();
//              out.println("<td>"+ item.toString()+ "</td>");
//             
//              out.println("</tr>");
                %>
                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
                            <img style="height:150px;" src="<%="resource/img/"+item.getImg().split("/")[0]%>" alt="">
                            <div class="caption">
                                <h4 class="pull-right">$<%=item.getPrice() %></h4>
                                <h4><a href="detail.jsp?id=<%=item.getId()%>">Room <%=item.getId()%></a>
                                </h4>
                                
                                <p><%=item.getDescription().length()> 50?item.getDescription().substring(0, 50):item.getDescription() %></p>
                            </div>
                            <div class="ratings">
                                <p class="pull-right">Capacity: <%=item.getCapacity()%> peoples</p>
                                <p>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                </p>
                            </div>
                        </div>
                    </div>
                    <%
            }
            out.println("</table>");
            if(count == 0)
            {
                out.println("<div>Not found</div>");
            }
            %>

                   

                </div>

            </div>

        </div>

    </div>
    <!-- /.container -->

    <%@include file='layout/footter.jsp'%>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="resource/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="resource/js/bootstrap.min.js"></script>

</body>

</html>

