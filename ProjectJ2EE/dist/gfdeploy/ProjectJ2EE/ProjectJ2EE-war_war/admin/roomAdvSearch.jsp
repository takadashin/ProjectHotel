<%-- 
    Document   : index
    Created on : 2016-4-1, 23:50:37
    Author     : Ziyi
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="model.CriteriaPrice"%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.util.Date"%>
<%@page import="com.humber.ca.Utility"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="javax.persistence.Query"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.humber.ca.Rooms"%>
<%@page import="com.humber.ca.BaseSLBeanRemote"%>
<%@page import="com.humber.ca.RoomAdminSLBeanRemote"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.ejb.*"%>
<%@page import="model.Criteria" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
<!--        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin - Advanced Search</title>
        <style>
            table {
                border-collapse: collapse;
                width: 100%;
            }

            th, td {
                text-align: left;
                padding: 8px;
            }

            tr:nth-child(even){
                background-color: #f2f2f2
            }
/*            tr:hover {background-color: #999999}*/
        </style>-->
        <%@include file='layout/headcode.jsp'%>
    </head>
    <body>
        
        <div id="wrapper">

        <!-- Navigation -->
        <%@include file='layout/navigation.jsp'%>
        
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Advanced Search</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>

            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <form class="form" method="POST" action="roomAdvSearch.jsp">
                        <div class="form-group row">
                            <label for="comment" class="col-sm-2 form-control-label">Date:</label>
                            <div class="col-sm-4">
                                <div class="input-group date" id="dtpMin">
                                            <input class="form-control" name="dateMin" id="dateMin" value="" placeholder="Min" type="text" aria-describedby="basic-addon1" >
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                </div>
<!--                                <input type="text" class="form-control" aria-describedby="basic-addon1" name="dateMin" id="dateMin" value="" placeholder="Min"/>-->
                            </div>
<!--                            <div class="col-xs-1 form-control-label">To</div>-->
                            <div class="col-sm-4">
                                <div class="input-group date" id="dtpMax">
                                            <input class="form-control" name="dateMax" id="dateMax" value="" placeholder="Max" type="text" aria-describedby="basic-addon1" >
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                </div>
<!--                                <input type="text" class="form-control" aria-describedby="basic-addon1" name="dateMax" id="dateMax" value="" placeholder="Max"/>-->
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="comment" class="col-sm-2 form-control-label">Room Floor: </label>
                            <div class="col-sm-4"><input type="text" class="form-control" aria-describedby="basic-addon1" name="floorMin" id="floorMin" value="" placeholder="Min"/></div>
<!--                            <div class="col-xs-1 form-control-label">To</div>-->
                            <div class="col-sm-4"><input type="text" class="form-control" aria-describedby="basic-addon1" name="floorMax" id="floorMax" value="" placeholder="Max"/></div>
                        </div>
                        <div class="form-group row">
                            <label for="comment"class="col-sm-2 form-control-label">Room Price:</label>
                            <div class="col-sm-4"><input type="text" class="form-control" aria-describedby="basic-addon1" name="priceMin" id="priceMin" value="" placeholder="Min"/></div>
<!--                            <div class="col-xs-1 form-control-label">To</div>-->
                            <div class="col-sm-4"><input type="text" class="form-control" aria-describedby="basic-addon1" name="priceMax" id="priceMax" value="" placeholder="Max"/></div>
                        </div>
                        <div class="form-group row">
                            <label for="comment" class="col-sm-2 form-control-label"></label>
                            <div class="col-sm-8">
                                <input type="checkbox" name="priceCheckbox" id="priceCheckbox" value="lt75"/>&nbsp;Less than C$75 <br /> 
                                <input type="checkbox" name="priceCheckbox" id="priceCheckbox" value="75to124"/>&nbsp;C$75 to C$124 <br /> 
                                <input type="checkbox" name="priceCheckbox" id="priceCheckbox" value="125to199"/>&nbsp;C$125 to C$199 <br /> 
                                <input type="checkbox" name="priceCheckbox" id="priceCheckbox" value="200to299"/>&nbsp;C$200 to C$299 <br /> 
                                <input type="checkbox" name="priceCheckbox" id="priceCheckbox" value="gt300"/>&nbsp;Greater than C$300 <br />
                            </div>
                            
                        </div>
                        <div class="form-group row"> 
                            <label for="comment" class="col-sm-2 form-control-label"></label>
                            <div class="col-sm-8"><button type="submit" class="btn btn-info" name="btninsert">Search</button></div>
                        </div>
                    </form>
                    
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="page-header">Search Result</h3>
                </div>
                <!-- /.col-lg-12 -->
            </div>
        <%
            Context cxt = new InitialContext();
            RoomAdminSLBeanRemote sessionBeanRoomRemote = (RoomAdminSLBeanRemote) cxt.lookup(RoomAdminSLBeanRemote.class.getName());
            
            Utility utility = Utility.getInstance();
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd"); 

            Criteria crt = new Criteria();                        
            List result = null;
            if(request.getParameter("floorMin")!=null){
                String dateMin = request.getParameter("dateMin");
                String dateMax = request.getParameter("dateMax");
                String floorMin = request.getParameter("floorMin");
                String floorMax = request.getParameter("floorMax");
                String priceMin = request.getParameter("priceMin");
                String priceMax = request.getParameter("priceMax");
                String[] priceCheckbox = request.getParameterValues("priceCheckbox");
                crt = utility.createCriteria(dateMin, 
                        dateMax, floorMin, floorMax, priceMin, priceMax, priceCheckbox, crt.DEFAULT);
                result = sessionBeanRoomRemote.advancedSearch(crt);
                request.getSession().setAttribute("criteriaForSorting", crt);
            }
            else if(request.getParameter("sortingType")!=null){
                crt = (Criteria)request.getSession().getAttribute("criteriaForSorting");
                crt.setSortingType(request.getParameter("sortingType"));
                result = sessionBeanRoomRemote.advancedSearch(crt);
                request.getSession().setAttribute("criteriaForSorting", crt);
            }
        %>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <table class="table">
                    <thead>
                      <tr>
                        <th>Booking ID</th>
                        <th>User Name</th>
                        <th>Room Floor                
                            <a href="roomAdvSearch.jsp?sortingType=<%=crt.FLOOR_ASC %>"><img src="../resource/img/asc.gif" title="Lower to higher"></a>
                                <a href="roomAdvSearch.jsp?sortingType=<%=crt.FLOOR_DESC %>"><img src="../resource/img/desc.gif" title="Higher to lower"></a>              
                        </th>
                        <th>Checkin
                                <a href="roomAdvSearch.jsp?sortingType=<%=crt.CHECKIN_ASC %>"><img src="../resource/img/asc.gif"  title="Earlier to later"></a>
                                <a href="roomAdvSearch.jsp?sortingType=<%=crt.CHECKIN_DESC %>"><img src="../resource/img/desc.gif"  title="Later to ealier"></a>
                        </th>
                        <th>Checkout</th>
                        <th>Price
                                <a href="roomAdvSearch.jsp?sortingType=<%=crt.PRICE_ASC %>"><img src="../resource/img/asc.gif" title="Lower to higher"></a>
                                <a href="roomAdvSearch.jsp?sortingType=<%=crt.PRICE_DESC %>"><img src="../resource/img/desc.gif" title="Higher to lower"></a>
                        </th>
                        <th>Operations</th>
                      </tr>
                    </thead>
                    <tbody>
                   <%
                
                        if (result!=null){
                            Object[] itemList={new BigDecimal("1"), "", "", new BigInteger("1"), new Date(), new Date(), new BigInteger("1")};
                            for(Object item : result){
                                itemList = (Object[])item;

                                //0 b.ID bigD, 1 u.FN str, 2 u.LN str, 3 r.FLOOR bigInt, 
                                //4 b.CIN date, 5 b,COUT date, 6 r.PRICE bigInt, 7 u.ID bigD, 8 r.ID bigD
                                
                                out.println("<tr>");
                                out.println("<td>"+itemList[0].toString()+"</td>");
                                out.println("<td><a href='#' onclick='javascript:window.open(\"http://localhost:8080/ProjectJ2EE-war/admin/userDetailPopup.jsp?userId="+itemList[7].toString()+"\", \"_blank\", \"scrollbars=1,resizable=1,height=410,width=600\");' title='User Details'>"+(String)itemList[1] + "&nbsp;" +(String)itemList[2] +"</a></td>");
                                out.println("<td>"+itemList[3].toString() +"</td>");
                                out.println("<td>"+((Date)itemList[4]).toString() +"</td>");
                                out.println("<td>"+((Date)itemList[5]).toString() +"</td>");
                                out.println("<td><a href='#' onclick='javascript:window.open(\"http://localhost:8080/ProjectJ2EE-war/detail.jsp?id="+itemList[8].toString()+"\", \"_blank\", \"scrollbars=1,resizable=1,height=600,width=600\");' title='Room Details'>"+itemList[6].toString() +"</a></td>");
                                out.println("<td>");
        //                        out.println("<a href=\"roomEdit.jsp?editId="+itemList[0].toString() +"\">Edit</a>");
        //                        out.println("<a href=\"index.jsp?deleteId="+itemList[0].toString() +"\">Delete</a>");
                                out.println("</td>");
                                out.println("</tr>");

                            }
                        }
                    %>
                    
                    </tbody>
                  </table>
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

    <!-- Bootstrap Core JavaScript -->
    <script src="../resource/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../resource/bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="../resource/bower_components/raphael/raphael-min.js"></script>
    <script src="../resurce/bower_components/morrisjs/morris.min.js"></script>
    <script src="../resource/js/morris-data.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../resource/dist/js/sb-admin-2.js"></script>
    
    <script src="../resource/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../resource/js/bootstrap.min.js"></script>
     <script src="../resource/js/moment.min.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.7.14/js/bootstrap-datetimepicker.min.js"></script>
    
    <script>
    $(document).ready(function () {
  //called when key is pressed in textbox
        $('#dtpMin').datetimepicker({
            
            format: 'YYYY-MM-DD',
            ignoreReadonly: true           
        });
        $('#dtpMax').datetimepicker({
            
            format: 'YYYY-MM-DD',
            ignoreReadonly: true           
        });
        
      
       }); 
    </script>
    </body>
</html>
