<%-- 
    Document   : index
    Created on : 29-Mar-2016, 5:37:15 PM
    Author     : khai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Booking Hotel Room HomePage</title>

    <!-- Bootstrap Core CSS -->
    <link href="resource/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="resource/css/shop-homepage.css" rel="stylesheet">

</head>

<body>

    <!-- Navigation -->
    <%@include file='layout/header.jsp'%>

    <!-- Page Content -->
    <div class="container">

        <!-- Introduction Row -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">About Us
                    <small>It's Nice to Meet You!</small>
                </h1>
                <p>At Histórico Central Hotel, your satisfaction is our highest priority. We promise to do our very best to accommodate your needs.

If you have a question about the hotel, would like to make arrangements for an upcoming visit, need directions or have a comment regarding a recent stay with us, please feel free to contact us today.</p>
            </div>
        </div>

        <!-- Team Members Row -->
        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">Our Team</h2>
            </div>
            <div class="col-lg-4 col-sm-6 text-center">
                <img class="img-circle img-responsive img-center" src="http://placehold.it/200x200" alt="">
                <h3>Khai Vo
                    <small>Web Developer</small>
                </h3>
                <p>"This hotel is fantastic"</p>
            </div>
            <div class="col-lg-4 col-sm-6 text-center">
                <img class="img-circle img-responsive img-center" src="http://placehold.it/200x200" alt="">
                 <h3>Jason
                    <small>Web Developer</small>
                </h3>
                <p>"No place serve better food than this"</p>
            </div>
            
            <div class="col-lg-4 col-sm-6 text-center">
                <img class="img-circle img-responsive img-center" src="http://placehold.it/200x200" alt="">
                <h3>Zeke
                    <small>Web Developer</small>
                </h3>
                <p>"Do I support to say something?"</p>
            </div>
            
        </div>

        <hr>

        <iframe src="https://www.google.com/maps/d/u/0/embed?mid=z0mMtNba7vV0.kPfXROOgPO5s&z=15" width="100%" height="480"></iframe>

    </div>
    <!-- /.container -->

    <%@include file='layout/footter.jsp'%>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="resource/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="resource/js/bootstrap.min.js"></script>

</body>

</html>

