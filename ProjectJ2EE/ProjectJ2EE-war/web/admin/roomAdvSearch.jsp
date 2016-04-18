<%-- 
    Document   : index
    Created on : 2016-4-1, 23:50:37
    Author     : Ziyi
--%>

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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        </style>
    </head>
    <body>
        
        <h1>Advanced Search of Room Reservation:</h1>
        <form method="POST" action="roomAdvSearch.jsp">
            <table>
                <tr>
                    <td>
                        Date:
                    </td>
                    <td>
                        From:&nbsp;
                        <input type="text" name="dateMin" id="dateMin" value=""/>
                        To:&nbsp;
                        <input type="text" name="dateMax" id="dateMax" value=""/>
                    </td>
                </tr>
                <tr>
                    <td>
                        Room Floor: 
                    </td>
                    <td>
                        From:&nbsp;
                        <select name="floorMin" id="floorMin">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </select>
                        To:&nbsp;
                        <select name="floorMax" id="floorMax">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        Room Price:
                    </td>
                    <td>
                        From:&nbsp;
                        <input type="text" name="priceMin" id="priceMin" value=""/>
                        To:&nbsp;
                        <input type="text" name="priceMax" id="priceMax" value=""/>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input type="checkbox" name="priceCheckbox" id="priceCheckbox" value="lt75"/>Less than C$75 <br /> 
                        <input type="checkbox" name="priceCheckbox" id="priceCheckbox" value="75to124"/>C$75 to C$124 <br /> 
                        <input type="checkbox" name="priceCheckbox" id="priceCheckbox" value="125to199"/>C$125 to C$199 <br /> 
                        <input type="checkbox" name="priceCheckbox" id="priceCheckbox" value="200to299"/>C$200 to C$299 <br /> 
                        <input type="checkbox" name="priceCheckbox" id="priceCheckbox" value="gt300"/>Greater than C$300 <br /> 
                    </td>
                </tr>
                <tr>
                    <td>
                        
                    </td>
                    <td>
                        <!--<input type="text" name="priceFrom" id="priceFrom" value="" placeholder="min"/>
                        &nbsp;to&nbsp;
                        <input type="text" name="priceTo" id="priceTo" value="" placeholder="max"/>-->
                        <input type="submit" value="Search">
                    </td>
                </tr>
            </table>
            
        </form>
        
        
        <h3>Search Result</h3>
        <%
            Context cxt = new InitialContext();
            RoomAdminSLBeanRemote sessionBeanRoomRemote = (RoomAdminSLBeanRemote) cxt.lookup(RoomAdminSLBeanRemote.class.getName());
            
            Utility utility = Utility.getInstance();

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
        <table>
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
                        out.println("<td>"+itemList[6].toString() +"</td>");
                        out.println("<td>");
//                        out.println("<a href=\"roomEdit.jsp?editId="+itemList[0].toString() +"\">Edit</a>");
//                        out.println("<a href=\"index.jsp?deleteId="+itemList[0].toString() +"\">Delete</a>");
                        out.println("</td>");
                        out.println("</tr>");
                    
                    }
                }
            %>           
        </table>
        <br/>
        
        
    </body>
</html>
