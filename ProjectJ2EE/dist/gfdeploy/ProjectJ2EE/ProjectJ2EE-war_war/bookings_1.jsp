<%-- 
    Document   : index
    Created on : 29-Mar-2016, 5:37:15 PM
    Author     : khai
--%>

<%@page import="com.humber.ca.UserSFBeanRemote"%>
<%@page import="com.humber.ca.UserSLBeanRemote"%>
<%@page import="com.humber.ca.Users"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.math.BigDecimal"%>
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
                    <form method="POST" action="login.jsp">
                        <%
                        InitialContext ic = new InitialContext();
                        Object o = ic.lookup(UserSLBeanRemote.class.getName());
                        UserSLBeanRemote serviceSession = (UserSLBeanRemote) o;
                        UserSFBeanRemote sbstring;
                        sbstring = (UserSFBeanRemote) session.getAttribute("beansession");
                        if(sbstring == null)
                        {
                            if(request.getParameter("btnlogin")!= null)   
                            {
                                out.println("Ok");
//                                
                                sbstring =  (UserSFBeanRemote) ic.lookup(UserSFBeanRemote.class.getName());
                                Users ob = (Users) serviceSession.authentication(request.getParameter("txt_email"), request.getParameter("txt_pass"));
                                if(ob != null)
                                {
                                    sbstring.setUserID(ob.getId().toString());
                                    sbstring.setUserName(ob.getFirstname()+" "+ob.getLastname());
                                    sbstring.setUserType(ob.getType().toString());
                                    
                                    session.setAttribute("beansession", sbstring);
                                    if(ob.getType().trim().equals("A"))
                                    {
                                         response.sendRedirect("admin");
                                    }
                                    else
                                        response.sendRedirect("index.jsp");
                                }
                            }
//                        
                        }
                        else
                        {
                            if(sbstring.getUserType().trim().equals("A"))
                                    {
                                         response.sendRedirect("/admin");
                                    }
                                    else
                                        response.sendRedirect("index.jsp");
                        }
                        %>
                        
                        
                       
                        <div class="form-group">
                            <label for="comment" >Email</label>
                            <input type="text" class="form-control"  value="" name="txt_email" aria-describedby="basic-addon1">
                        </div>
                        <div class="form-group">
                            <label for="comment" >Password</label>
                            <input type="password" class="form-control"  value="" name="txt_pass" aria-describedby="basic-addon1">
                        </div>
                        
                        <button type="submit" class="btn btn-info pull-right" name="btnlogin">Login</button>
                    </form>
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

</body>

</html>

