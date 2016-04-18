<%-- 
    Document   : index
    Created on : 12-Apr-2016, 10:50:59 AM
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

    <%@include file='layout/headcode.jsp'%>

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <%@include file='layout/navigation.jsp'%>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Service</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
              <%
                    InitialContext ic = new InitialContext();
                    Object o = ic.lookup(ServiceSLBeanRemote.class.getName());
                    ServiceSLBeanRemote serviceSession = (ServiceSLBeanRemote) o;
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
                            <div class="alert alert-danger" role="alert">  <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span><%=ex.getMessage()%></div>
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
                        <th>NAME</th>
                        <th>DESCRIPTION</th>
                        <th>TEXTMSG</th>
                       <th>Operation</th>
                      </tr>
                    </thead>
                    <tbody>
                   <%
                     List<Services> itemList = serviceSession.findAll();
                     Iterator i = itemList.iterator();

           
                    while ( i.hasNext() ) {
                        Services item = (Services) i.next();
                        %>
                    <form action="adminservicelist.jsp" method="POST">
                            <input type="hidden" value="<%=item.getId()%>" name="idaction">
                        <tr>
                   <td><%=item.getId()%></td>
                   <td><%=item.getName()%></td>
                   <td><%=item.getDescription()%></td>
                   <td><%=item.getTextmsg()%></td>
                   
                   <td><button type="submit" class="btn btn-danger" name="deletebtn">Delete</button>
                       <a href="adminservicedetail.jsp?editid=<%=item.getId()%>" class="btn btn-info">Edit</a>
                   </td>
                   </tr>
                         </form>
                        <%
                    }
                   %>
                      
                    </tbody>
                  </table>
                   <a href="adminservicedetail.jsp" class="btn btn-info">Insert</a>
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
