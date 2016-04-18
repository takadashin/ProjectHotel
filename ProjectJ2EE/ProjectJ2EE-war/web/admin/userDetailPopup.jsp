<%-- 
    Document   : userDetailPopup
    Created on : 2016-4-16, 23:07:08
    Author     : Ziyi
--%>
<%@page import="java.util.Date"%>
<%@page import="com.humber.ca.Bookings"%>
<%@page import="com.humber.ca.BookingAdminSLBeanRemote"%>
<%@page import="com.humber.ca.UserAdminSLBeanRemote"%>
<%@page import="com.humber.ca.Users"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.math.BigInteger"%>
<%@page import="javax.persistence.Query"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.humber.ca.Utility"%>
<%@page import="com.humber.ca.Rooms"%>
<%@page import="com.humber.ca.BaseSLBeanRemote"%>
<%@page import="com.humber.ca.RoomAdminSLBeanRemote"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.ejb.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Detail</title>
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
        </style>
    </head>
    <body>
        <%
            Context cxt = new InitialContext();
            RoomAdminSLBeanRemote sessionBeanRoomRemote = (RoomAdminSLBeanRemote) cxt.lookup(RoomAdminSLBeanRemote.class.getName());
            UserAdminSLBeanRemote userAdminSLBeanRemote = (UserAdminSLBeanRemote)cxt.lookup(UserAdminSLBeanRemote.class.getName());
            BookingAdminSLBeanRemote bookingAdminSLBeanRemote = (BookingAdminSLBeanRemote)cxt.lookup(BookingAdminSLBeanRemote.class.getName());
        
            BigDecimal userId = new BigDecimal(request.getParameter("userId"));
            Users u = (Users)userAdminSLBeanRemote.getById(userId);           
        %>
        <table>
            <th>ColumnName</th>
            <th>Value</th>
            <tr>
                <td>ID</td>
                <td><%=u.getId().toString() %></td>
            </tr>
            <tr>
                <td>FirstName</td>
                <td><%=u.getFirstname() %></td>
            </tr>
            <tr>    
                <td>LastName</td>
                <td><%=u.getLastname() %></td>
            </tr>
            <tr>    
                <td>Email</td>
                <td><%=u.getEmail() %></td>
            </tr>
            <tr>    
                <td>Password</td>
                <td><%=u.getPassword() %></td>
            </tr>
            <tr>    
                <td>Address</td>
                <td><%=u.getAddress() %></td>
            </tr>
            <tr>    
                <td>City</td>
                <td><%=u.getCity() %></td>
            </tr>
            <tr>    
                <td>State</td>
                <td><%=u.getState() %></td>
            </tr>
            <tr>    
                <td>Country</td>
                <td><%=u.getCountry() %></td>
            </tr>
            <tr>    
                <td>ZIP</td>
                <td><%=u.getZip() %></td>
            </tr>
            <tr>    
                <td>Phone</td>
                <td><%=u.getPhone() %></td>
            </tr>
            <tr>    
                <td>Company</td>
                <td><%=u.getCompany() %></td>              
            </tr>
        </table>
    </body>
</html>
