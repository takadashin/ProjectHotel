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
        <%
            int  i = Integer.parseInt(request.getParameter("id"));
        InitialContext ic = new InitialContext();
        Object o = ic.lookup(RoomSLBeanRemote.class.getName());
        RoomSLBeanRemote roomSession = (RoomSLBeanRemote) o;
        
        Rooms item = (Rooms) roomSession.SearchByID(new BigDecimal(i));
        %>
                <div class="thumbnail">
                      <%
                        String[] img = item.getImg().split("/");
                                if(!img[0].trim().isEmpty())
                                {
                        %>
                    <div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <%
                                    for(int j=1;j<img.length;j++)
                                    {
                                        %><li data-target="#myCarousel" data-slide-to="<%=j%>" ></li>
     <%
                                    }
                                %>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
       <%
       int count = 0;
       for(String index : img)
    {
        %>
        <div class="item <%=count==0?"active":""%>">
      <img src="<%="resource/img/"+index%>" alt="Chania">
    </div>
 <%
 count++;
    }

%>
   
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
                    <%
                                    }
                                
                                %>
                    
                    <div class="caption-full">
                        <h4 class="pull-right">$<%=item.getPrice() %></h4>
                        <h4><a href="detail.jsp?id=<%=item.getId()%>">Room <%=item.getId()%></a>
                        </h4>
                         <p>Floor: <%=item.getFloor()%></p>
                          <p>Capacity <%=item.getCapacity()%> people</p>
                        <p><%=item.getDescription()%></p>
                    </div>
                    <div class="ratings">
                        
                        <p>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star-empty"></span>
                            4.0 stars
                        </p>
                    </div>
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

