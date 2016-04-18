<%-- 
    Document   : index
    Created on : 12-Apr-2016, 10:50:59 AM
    Author     : khai
--%>
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
                    <h1 class="page-header">User Record</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
              <%
                    InitialContext ic = new InitialContext();
                    Object o = ic.lookup(UserSLBeanRemote.class.getName());
                    UserSLBeanRemote serviceSession = (UserSLBeanRemote) o;
                    
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
                        <th>ID</th>
                        <th>FIRSTNAME</th>
                        <th>LASTNAME</th>
                        <th>EMAIL</th>
                        <th>PASSWORD</th>
                        <th>ADDRESS</th>
                        <th>CITY</th>
                        <th>STATE</th>
                        <th>COUNTRY</th>
                        <th>ZIP</th>
                        <th>PHONE</th>
                        <th>COMPANY</th>
                        <th>TYPE</th>
                       <th>Operation</th>
                      </tr>
                    </thead>
                    <tbody>
                   <%
                     List<Users> itemList = serviceSession.findAll();
                     Iterator i = itemList.iterator();

           
                    while ( i.hasNext() ) {
                        Users item = (Users) i.next();
                        %>
                    <form action="adminpersonlist.jsp" method="POST">
                            <input type="hidden" value="<%=item.getId()%>" name="idaction">
                        <tr>
                   <td><%=item.getId()%></td>
                   <td><%=item.getFirstname()%></td>
                   <td><%=item.getLastname()%></td>
                   <td><%=item.getEmail()%></td>
                   <td><%=item.getPassword()%></td>
                   <td><%=item.getAddress()%></td>
                   <td><%=item.getCity()%></td>
                   <td><%=item.getState()%></td>
                   <td><%=item.getCountry()%></td>
                   <td><%=item.getZip()%></td>
                   <td><%=item.getPhone()%></td>
                   <td><%=item.getCompany()%></td>
                   <td><%=item.getType()%></td>
                   <td><button type="submit" class="btn btn-danger" name="deletebtn">Delete</button>
                       <a href="adminpersondetail.jsp?editid=<%=item.getId()%>" class="btn btn-info">Edit</a>
                   </td>
                   </tr>
                   </form>
                        <%
                    }
                   %>
                      
                    </tbody>
                  </table>
                   <a href="adminpersondetail.jsp" class="btn btn-info">Insert</a>
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

</body>

</html>
