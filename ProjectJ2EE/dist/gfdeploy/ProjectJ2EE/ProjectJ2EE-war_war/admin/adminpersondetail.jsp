<%-- 
    Document   : index
    Created on : 12-Apr-2016, 10:50:59 AM
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

    <%@include file='layout/headcode.jsp'%>

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <%@include file='layout/navigation.jsp'%>
        
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Room Information Editor</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
              <%
                    InitialContext ic = new InitialContext();
                    Object o = ic.lookup(UserSLBeanRemote.class.getName());
                    UserSLBeanRemote roomSession = (UserSLBeanRemote) o;
                      
                    Users newobject = null;
                    
                    if(request.getParameter("btninsert")!= null)   
                    {
                        if(request.getParameter("editid") == null)
                        {
                            boolean check = roomSession.Insert(request.getParameter("txt_fname"), request.getParameter("txt_lname"), request.getParameter("txt_email"), request.getParameter("txt_pass"), request.getParameter("txt_address"), request.getParameter("txt_city"), request.getParameter("txt_state"),  request.getParameter("txt_country"), request.getParameter("txt_zip"), request.getParameter("txt_phone"), request.getParameter("txt_company"),request.getParameter("txt_type"));
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
                           
                             boolean check = roomSession.Update(new BigDecimal(request.getParameter("editid")),request.getParameter("txt_fname"), request.getParameter("txt_lname"), request.getParameter("txt_email"), request.getParameter("txt_pass"), request.getParameter("txt_address"), request.getParameter("txt_city"), request.getParameter("txt_state"),  request.getParameter("txt_country"), request.getParameter("txt_zip"), request.getParameter("txt_phone"), request.getParameter("txt_company"),request.getParameter("txt_type"));
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
                    if(request.getParameter("editid") != null)
                        {
                       
                        newobject = (Users) roomSession.SearchByID(new BigDecimal(request.getParameter("editid")));
                        }

             %>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <form method="POST" action="adminpersondetail.jsp<%=(request.getParameter("editid")!= null)?"?editid="+request.getParameter("editid"):""%>">
                        <div class="form-group">
                            <label for="comment" >ID</label>
                            <label for="comment" ><%=(newobject!=null)?newobject.getId():""%></label>
                        </div>
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
                            <input type="text" class="form-control " value="<%=(newobject!=null)?newobject.getPassword():""%>" name="txt_pass" aria-describedby="basic-addon1">
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
                        <div class="form-group">
                            <label for="comment" >Type</label>
                            <input type="text" class="form-control num_only" maxlength="1" value="<%=(newobject!=null)?newobject.getType():""%>" name="txt_type" aria-describedby="basic-addon1">
                        </div>
                        <button type="submit" class="btn btn-info pull-right" name="btninsert"><%=(request.getParameter("editid")!= null)?"Save":"Insert"%></button>
                    </form>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->
       
    </div>
    <!-- /#wrapper -->
    
    <!-- jQuery -->
    <script src="../resource/bower_components/jquery/dist/jquery.min.js"></script>
    
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
    <script src="../resource/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../resource/bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="../resource/bower_components/raphael/raphael-min.js"></script>
    <script src="../resource/bower_components/morrisjs/morris.min.js"></script>
    <script src="../resource/js/morris-data.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../resource/dist/js/sb-admin-2.js"></script>
    
</body>

</html>
