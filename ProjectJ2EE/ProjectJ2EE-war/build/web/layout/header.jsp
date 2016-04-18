
  <%@page import="com.humber.ca.UserSFBeanRemote"%>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.jsp">Hotel California</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    
                    <li>
                        <a href="room.jsp">Room</a>
                    </li>
                    <li>
                        <a href="bookings.jsp">Booking a room</a>
                    </li>
                    <li>
                        <a href="photo.jsp">Photo Gallery</a>
                    </li>
                    <li>
                        <a href="service.jsp">Services</a>
                    </li>
                    <li>
                        <a href="contact.jsp">Contact</a>
                    </li>
                    <li>
                        <%
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
                                %><a href="login.jsp">Log in</a><%
                            
                        %>
                       
                         
                    </li>
                    <li>
                        <%
                                if(checkuser != null)
                            {
                            %><a href="register.jsp?editid=1">User Profile</a><%
                            }
                        %>
                        
                    </li>
                </ul>
                
            </div>
            
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
