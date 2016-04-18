<%-- 
    Document   : index
    Created on : 12-Apr-2016, 10:50:59 AM
    Author     : khai
--%>
<%@page import="java.math.BigInteger"%>
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
                    Object o = ic.lookup(RoomSLBeanRemote.class.getName());
                    RoomSLBeanRemote roomSession = (RoomSLBeanRemote) o;
                      
                    
                    if(request.getParameter("btninsert")!= null)   
                    {
                        if(request.getParameter("editid") == null)
                        {
                            boolean check = roomSession.Insert(new BigInteger(request.getParameter("txt_price")),new BigInteger(request.getParameter("txt_cap")),
                                request.getParameter("txt_img"),new BigInteger(request.getParameter("txt_floor")),request.getParameter("txt_area"));
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
                           
                             boolean check = roomSession.Update(new BigDecimal(request.getParameter("editid")),new BigInteger(request.getParameter("txt_price")),new BigInteger(request.getParameter("txt_cap")),
                                request.getParameter("txt_img"),new BigInteger(request.getParameter("txt_floor")),request.getParameter("txt_area"));
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
                    Rooms newobject = null;
                    if(request.getParameter("editid") != null)
                        {
                       
                        newobject = (Rooms) roomSession.SearchByID(new BigDecimal(request.getParameter("editid")));
                        }
             %>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <form method="POST" action="adminroomdetail.jsp<%=(request.getParameter("editid")!= null)?"?editid="+request.getParameter("editid"):""%>">
                        <div class="form-group">
                            <label for="comment" >ID</label>
                            <label for="comment" ><%=(newobject!=null)?newobject.getId():""%></label>
                        </div>
                        <div class="form-group">
                            <label for="comment" >Price</label>
                            <input type="text" class="form-control num_only" value="<%=(newobject!=null)?newobject.getPrice():""%>" name="txt_price" aria-describedby="basic-addon1">
                        </div>
                        <div class="form-group">
                            <label for="comment">Capacity</label>
                            <input type="text" class="form-control num_only" value="<%=(newobject!=null)?newobject.getCapacity():""%>" name="txt_cap" aria-describedby="basic-addon1">
                        </div>
                        <div class="form-group">
                            <label for="comment" >Image</label>
                            <input type="text" class="form-control" value="<%=(newobject!=null)?newobject.getImg():""%>" name="txt_img" aria-describedby="basic-addon1">
                            <input type='file' name='file_img' />
                        </div>
                         <div class="form-group">
                            <label for="comment" >Floor</label>
                            <input type="text" class="form-control num_only" value="<%=(newobject!=null)?newobject.getFloor():""%>" name="txt_floor" aria-describedby="basic-addon1">
                        </div>
                        <div class="form-group">
                            <label for="comment">Description</label>
                            <textarea class="form-control" rows="5" name="txt_area"><%=(newobject!=null)?newobject.getDescription():""%></textarea>
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
