<%-- 
    Document   : index
    Created on : 29-Mar-2016, 5:37:15 PM
    Author     : khai
--%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="com.humber.ca.ServiceSLBeanRemote"%>
<%@page import="com.humber.ca.Services"%>
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
        Object o = ic.lookup(ServiceSLBeanRemote.class.getName());
        ServiceSLBeanRemote serSession = (ServiceSLBeanRemote) o;
        
          
        
         List<Services> itemList = serSession.findAll();
            
            
            Iterator i = itemList.iterator();
            out.println("<table  class='object_book table'> ");
               out.println("<thead>");
                out.println("<tr>");
               out.println("<th>Name</th>");
               out.println("<th>Description</th>");
               out.println("<th>Text message</th>");
              out.println("</tr>");
              out.println("</thead>");
              out.println("<tbody>");
            int count = 0;
            while ( i.hasNext() ) {
                out.println("<tr>");
                
            count++;
            if(count > 20)
                break;
              Services item = (Services) i.next();
              out.println("<td>"+ item.getName()+ "</td>");
             out.println("<td>"+ item.getDescription()+ "</td>");
             out.println("<td>"+ item.getTextmsg()+ "</td>");
             
              out.println("</tr>");
               
            }
            out.println("</tbody>");
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

