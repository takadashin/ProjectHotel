<%-- 
    Document   : index
    Created on : 29-Mar-2016, 5:37:15 PM
    Author     : khai
--%>

<%@page import="java.math.BigInteger"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="com.humber.ca.UserSLBeanRemote"%>
<%@page import="com.humber.ca.Users"%>
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
                    InitialContext ic = new InitialContext();
                    Object o = ic.lookup(UserSLBeanRemote.class.getName());
                    UserSLBeanRemote roomSession = (UserSLBeanRemote) o;
                    
                    Users newobject = null;
                    
                    if(request.getParameter("btninsert")!= null)   
                    {
                        if(request.getParameter("editid") == null)
                        {
                            boolean check = roomSession.Insert(request.getParameter("txt_fname"), request.getParameter("txt_lname"), request.getParameter("txt_email"), request.getParameter("txt_pass"), request.getParameter("txt_address"), request.getParameter("txt_city"), request.getParameter("txt_state"),  request.getParameter("txt_country"), request.getParameter("txt_zip"), request.getParameter("txt_phone"), request.getParameter("txt_company"),"U");
                            if(check)
                        
                        {%>
                            <div class="alert alert-success" role="alert">  <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>Create account success</div>
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
                           
                             boolean check = roomSession.Update(new BigDecimal(checkuser.getUserID()),request.getParameter("txt_fname"), request.getParameter("txt_lname"), request.getParameter("txt_email"), request.getParameter("txt_pass"), request.getParameter("txt_address"), request.getParameter("txt_city"), request.getParameter("txt_state"),  request.getParameter("txt_country"), request.getParameter("txt_zip"), request.getParameter("txt_phone"), request.getParameter("txt_company"),"U");
                            if(check)
                        {
                            checkuser.setUserName(request.getParameter("txt_fname"));

                        
                        %>
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
                    if(request.getParameter("editid") != null)
                        {
                       if(checkuser!= null)
                        newobject = (Users) roomSession.SearchByID(new BigDecimal(checkuser.getUserID()));
                        
                    else{
                    response.sendRedirect("login.jsp");
                    }
                        }

             %>   
                <div class="row">
                <div class="col-lg-12">
                    <form method="POST" action="register.jsp<%=(request.getParameter("editid")!= null)?"?editid="+request.getParameter("editid"):""%>">
                        
                        <div class="form-group">
                            <label for="comment" >First Name</label>
                            <input type="text" class="form-control " value="<%=(newobject!=null)?newobject.getFirstname():""%>" name="txt_fname" aria-describedby="basic-addon1">
                        </div>
                        <div class="form-group">
                            <label for="comment" >Last Name</label>
                            <input type="text" class="form-control " value="<%=(newobject!=null)?newobject.getLastname():""%>" name="txt_lname" aria-describedby="basic-addon1">
                        </div>
                        <div class="form-group">
                            <label for="comment" >Email</label>
                            <input type="text" class="form-control " value="<%=(newobject!=null)?newobject.getEmail():""%>" name="txt_email" aria-describedby="basic-addon1">
                        </div>
                        <div class="form-group">
                            <label for="comment" >Password</label>
                            <input type="password" class="form-control " value="<%=(newobject!=null)?newobject.getPassword():""%>" name="txt_pass" aria-describedby="basic-addon1">
                        </div>
                        <div class="form-group">
                            <label for="comment" >Address</label>
                            <input type="text" class="form-control " value="<%=(newobject!=null)?newobject.getAddress():""%>" name="txt_address" aria-describedby="basic-addon1">
                        </div>
                        <div class="form-group">
                            <label for="comment" >City</label>
                            <input type="text" class="form-control " value="<%=(newobject!=null)?newobject.getCity():""%>" name="txt_city" aria-describedby="basic-addon1">
                        </div>
                        <div class="form-group">
                            <label for="comment" >State</label>
                            <input type="text" class="form-control " value="<%=(newobject!=null)?newobject.getState():""%>" name="txt_state" aria-describedby="basic-addon1">
                        </div>
                        <div class="form-group">
                            <label for="comment" >Country</label>
                            <input type="text" class="form-control " value="<%=(newobject!=null)?newobject.getCountry():""%>" name="txt_country" aria-describedby="basic-addon1">
                        </div>
                        <div class="form-group">
                            <label for="comment" >Zip code</label>
                            <input type="text" class="form-control " value="<%=(newobject!=null)?newobject.getZip():""%>" name="txt_zip" aria-describedby="basic-addon1">
                        </div>
                        <div class="form-group">
                            <label for="comment" >Phone</label>
                            <input type="text" class="form-control num_only" maxlength="10" value="<%=(newobject!=null)?newobject.getPhone():""%>" name="txt_phone" aria-describedby="basic-addon1">
                        </div>
                        <div class="form-group">
                            <label for="comment" >Company</label>
                            <input type="text" class="form-control " value="<%=(newobject!=null)?newobject.getCompany():""%>" name="txt_company" aria-describedby="basic-addon1">
                        </div>
                       
                        <button type="submit" class="btn btn-info pull-right" name="btninsert"><%=(request.getParameter("editid")!= null)?"Save":"Create account"%></button>
                    </form>
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
     <script>
    $(document).ready(function () {
  //called when key is pressed in textbox
  $(".num_only").keypress(function (e) {
     //if the letter is not digit then display error and don't type anything
     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
        //display error message
               return false;
    }
   });
   });
   </script>
    <!-- Bootstrap Core JavaScript -->
    <script src="resource/js/bootstrap.min.js"></script>

</body>

</html>

