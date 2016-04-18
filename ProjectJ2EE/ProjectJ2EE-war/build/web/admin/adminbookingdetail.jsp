<%-- 
    Document   : index
    Created on : 12-Apr-2016, 10:50:59 AM
    Author     : khai
--%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.humber.ca.Rooms"%>
<%@page import="com.humber.ca.RoomSLBeanRemote"%>
<%@page import="com.humber.ca.UserSLBeanRemote"%>
<%@page import="com.humber.ca.Users"%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="com.humber.ca.BookSLBeanRemote"%>
<%@page import="com.humber.ca.Bookings"%>
<%@page import="javax.naming.InitialContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <%@include file='layout/headcode.jsp'%>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.7.14/css/bootstrap-datetimepicker.min.css" rel="stylesheet"/>
    <!--<script src="template/js/moment.min.js"></script>-->
    
   

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
                    Object o = ic.lookup(BookSLBeanRemote.class.getName());
                    BookSLBeanRemote roomSession = (BookSLBeanRemote) o;
                    DateFormat df = new SimpleDateFormat("MM/dd/yyyy hh:mm a"); 
                    Date today = Calendar.getInstance().getTime();
                    RoomSLBeanRemote roomobSession = (RoomSLBeanRemote) ic.lookup(RoomSLBeanRemote.class.getName());
                    UserSLBeanRemote userobSession = (UserSLBeanRemote) ic.lookup(UserSLBeanRemote.class.getName());
                    
                    if(request.getParameter("btninsert")!= null)   
                    {
                        if(request.getParameter("editid") == null)
                        {
                           
                            //04/20/2016 7:25 PM
                            
                            boolean check = roomSession.Insert(new BigDecimal(request.getParameter("cb_room")),new BigDecimal(request.getParameter("cb_user")),df.parse(request.getParameter("dtp_checkin")),df.parse(request.getParameter("dtp_checkout")),new BigInteger(request.getParameter("txt_adult")),new BigInteger(request.getParameter("txt_child")));
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
                          
                             boolean check = roomSession.Update(new BigDecimal(request.getParameter("editid")),new BigDecimal(request.getParameter("cb_room")),new BigDecimal(request.getParameter("cb_user")),df.parse(request.getParameter("dtp_checkin")),df.parse(request.getParameter("dtp_checkout")),new BigInteger(request.getParameter("txt_adult")),new BigInteger(request.getParameter("txt_child")));
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
                    Bookings newobject = null;
                    if(request.getParameter("editid") != null)
                        {
                       
                        newobject = (Bookings) roomSession.SearchByID(new BigDecimal(request.getParameter("editid")));
                        }
                    
                    List<Rooms> allroom = roomobSession.findAll();
                    List<Users> alluser = userobSession.findAll();
             %>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <form method="POST" action="adminbookingdetail.jsp<%=(request.getParameter("editid")!= null)?"?editid="+request.getParameter("editid"):""%>">
                        <div class="form-group">
                            <label for="comment" >ID</label>
                            <label for="comment" ><%=(newobject!=null)?newobject.getId():""%></label>
                        </div>
                        <div class="form-group">
                            <label for="comment" >Room</label>
                            <select class="form-control" name="cb_room">
                                <%
                                for(Rooms item : allroom)
                                {
                                %><option <%=(newobject!=null)?newobject.getRoomid().getId().equals(item.getId())?"selected":"":""%> value="<%=item.getId()%>">Room <%=item.getId()%></option> <%
                                }
                                %>
                              </select>
                        </div>
                        <div class="form-group">
                            <label for="comment" >User</label>
                            <select class="form-control" name="cb_user">
                                <%
                                for(Users item : alluser)
                                {
                                %><option <%=(newobject!=null)?newobject.getUserid().getId().equals(item.getId())?"selected":"":""%> value="<%=item.getId()%>">Mr/Mrs <%=item.getFirstname()+ item.getLastname()%></option> <%
                                }
                                %>
                              </select>
                        </div>
                        
                        <div class="form-group">
                            <label for="comment" >Check In</label>
                            <div class='input-group date' id='datetimepickercheckin'>
                                            <input type='text' class="form-control" name="dtp_checkin"  value="<%=(newobject!=null)?newobject.getCheckin()!=null?df.format(newobject.getCheckin()):df.format(today):df.format(today)%>"/>
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                           </div>
                        </div>   
                       <div class="form-group">
                            <label for="comment" >Check Out</label>
                            <div class='input-group date' id='datetimepickercheckout'>
                                            <input type='text' class="form-control" name="dtp_checkout"  value="<%=(newobject!=null)?newobject.getCheckout()!=null?df.format(newobject.getCheckout()):df.format(today):df.format(today)%>"/>
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                           </div>
                        </div>   
                        <div class="form-group">
                            <label for="comment" >Number of adult</label>
                            <input type="text" class="form-control num_only" maxlength="2" value="<%=(newobject!=null)?newobject.getNumadult():""%>" name="txt_adult" aria-describedby="basic-addon1">
                        </div>
                        <div class="form-group">
                            <label for="comment" >Number of kid</label>
                            <input type="text" class="form-control num_only" maxlength="2" value="<%=(newobject!=null)?newobject.getNumchild():""%>" name="txt_child" aria-describedby="basic-addon1">
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
   
     <script src="../resource/bower_components/jquery/dist/jquery.min.js"></script>
    <script src="../resource/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="../resource/js/moment.min.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.7.14/js/bootstrap-datetimepicker.min.js"></script>
      <!-- Metis Menu Plugin JavaScript -->
    <script src="../resource/bower_components/metisMenu/dist/metisMenu.min.js"></script>



    <!-- Custom Theme JavaScript -->
    <script src="../resource/dist/js/sb-admin-2.js"></script>
    
    
  
    
</body>
 <script>
    $(document).ready(function () {
  //called when key is pressed in textbox
        $('#datetimepickercheckin').datetimepicker({
            
        
            ignoreReadonly: true           
        });
        $('#datetimepickercheckout').datetimepicker({
            
        
            ignoreReadonly: true           
        });
  $(".num_only").keypress(function (e) {
     //if the letter is not digit then display error and don't type anything
     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
        //display error message
               return false;
    }
   });
   
 

   });
   </script>
</html>
