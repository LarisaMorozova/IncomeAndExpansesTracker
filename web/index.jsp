<%-- 
    Document   : index
    Created on : Oct 25, 2016, 5:29:54 PM
    Author     : larisamorozova
--%>

<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="keywords" content="">
        <meta name="description" content="">
        <meta name="author" content="Larisa Morozova">

        <title>Income and outcome</title>

        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/main.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/bootstrap-social.css" rel="stylesheet">

    </head>

    <body>
        <div class="nav">
            <div class="container">
                <ul class="pull-left">
                    <li><a href="incomes.jsp">Incomes</a></li>
                    <li><a href="expenses.jsp">Expenses</a></li>
                    <li><a href="reports.jsp">Reports</a></li>
                </ul>
                <%
                    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
                %> 
                <ul class="pull-right">
                    <li><a href="signup.jsp">Sign Up</a></li>
                    <li><a href="login.jsp">Log In</a></li>
                    <li><a href="contacts.jsp">Contacts</a></li>
                </ul>
                <%} else {
                %> 
                <ul class="pull-right">
                    <span class="welcome">Welcome, <%=session.getAttribute("userid")%></span>
                    <a href='logout.jsp'>Log out</a>
                </ul>
                <%
                    }
                %>
            </div>
        </div>
        <div class="jumbotron">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <h1>Finance planning</h1>
                        <p>Keep track on your incomes and expenses</p>
                    </div>

                    <div class="col-md-6">
                        <div class="row carousel-holder">
                            <div class="col-md-
                                 ">
                                <div id="mycarousel" class="carousel slide" data-ride="carousel">
                                    <ol class="carousel-indicators">
                                        <li data-target="#mycarousel" data-slide-to="0" class="active"></li>
                                        <li data-target="#mycarousel" data-slide-to="1"></li>
                                        <li data-target="#mycarousel" data-slide-to="2"></li>
                                    </ol>
                                    <div class="carousel-inner">
                                        <div class="item active">
                                            <img class="img-responsive" src="img/incomes.jpg" alt="">
                                        </div>

                                        <div class="item">
                                            <img class="slide-image" src="img/expenses.jpg" alt="">
                                        </div>

                                        <div class="item">
                                            <img class="slide-image" src="img/reports.jpg" alt="">
                                        </div>
                                    </div>

                                    <a class="left carousel-control" href="#mycarousel" data-slide="prev">
                                        <span class="glyphicon glyphicon-chevron-left"></span>
                                    </a>

                                    <a class="right carousel-control" href="#mycarousel" data-slide="next">
                                        <span class="glyphicon glyphicon-chevron-right"></span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <%
            String query = request.getQueryString();
            if (query != null && query.contains("success")) {
        %>
        <div class="learn-more">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        Registration is Successful.
                        Please Login Here <a href='login.jsp'>Go to Login</a>
                    </div>
                </div>
            </div>
        </div>
        <%
        } else if (query != null && query.contains("install_complete")) {%>
        <div class="learn-more">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <p style="color:green">MySQL databases deployment went successfully.</p>
                        <p>Please register <a href='signup.jsp'>here</a></p>
                    </div>
                </div>
            </div>
        </div>
        <%} else {
        %>

        <div class="learn-more">
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <h3 style="color:#8B0000;">Get Started</h3>
                        <p>If you haven't done it already. Please, install mySQL database.
                            Initial database and tables can be setup following link below. 
                            <br/>
                        </p>
                        <p><a href="deploy.jsp">Deploy database</a></p>
                    </div>
                    <div class="col-md-4">
                        <h3 style="color:#191970;">Reports</h3>
                        <p>TBC</p>
                        <p><a href="reports.jsp">Click here</a></p>
                    </div>
                    <div class="col-md-4">
                        <h3 style="color:#191970;">Analysis</h3>
                        <p>TBC</p>
                        <p><a href="#">Click here</a></p>
                    </div>
                </div>
            </div>
        </div>
        <%}%>


        <footer class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-10">
                        <h5>Links: </h5>
                        <ul class="list-unstyled">
                            <li class="active">Home</li>
                            <li><a href="incomes.jsp">Incomes</a></li>
                            <li><a href="expenses.jsp">Expenses</a></li>
                            <li><a href="reports.jsp">Reports</a></li>
                        </ul>
                    </div>

                    <div class="col-md-2">
                        <h5>Follow author: </h5>
                        <div class="nav navbar-nav">
                            <a class="btn btn-social-icon btn-github" href="https://github.com/LarisaMorozova"><i class="fa fa-github"></i></a>
                            <a class="btn btn-social-icon btn-linkedin" href="https://www.linkedin.com/in/larisa-morozova-07a33157"><i class="fa fa-linkedin"></i></a>
                            <a class="btn btn-social-icon btn-youtube" href="https://www.youtube.com/user/florzyk21"><i class="fa fa-youtube"></i></a>
                        </div>
                    </div>
                    <div class="col-xs-12">
                        <p style="padding:10px;"></p>
                        <p align=center>© Copyright 2016 Larisa Morozova</p>
                    </div>
                </div>
            </div>
        </footer>
        <!-- jQuery (necessary for Bootstrap's JavaScrip plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#mycarousel").carousel({interval: 2000});
                $("#carousel-pause").click(function () {
                    $("#mycarousel").carousel('pause');
                });

                $("#carousel-play").click(function () {
                    $("#mycarousel").carousel('cycle');
                });
            });
        </script>
    </body>
</html>
