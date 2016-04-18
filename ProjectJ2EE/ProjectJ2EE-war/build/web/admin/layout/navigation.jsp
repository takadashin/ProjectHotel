<%-- 
    Document   : navigation
    Created on : 12-Apr-2016, 2:06:52 PM
    Author     : khai
--%>

  <%@page import="com.humber.ca.UserSFBeanRemote"%>
<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.jsp">SB Admin v2.0</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                       
                        <li><%
                            if(request.getParameter("btnlogout")!= null)   
                            {
                                session.removeAttribute("beansession");
                            }
                            UserSFBeanRemote checkuser = (UserSFBeanRemote) session.getAttribute("beansession");
                            if(checkuser != null)
                            {
                                %>
                                 <form method="POST">
                                     <input type="submit" style="margin-top: 7px;" class="btn btn-default" name="btnlogout" value="Hi <%=checkuser.getUserName() %> Sign out"/>
                        </form>
                                 <%
                            }
                            else
                                response.sendRedirect("login.jsp");
                            
                        %>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <%@include file='menu.jsp'%>
            <!-- /.navbar-static-side -->
        </nav>