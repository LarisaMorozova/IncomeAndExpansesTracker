<%-- 
    Document   : contacts
    Created on : Oct 25, 2016, 5:33:33 PM
    Author     : larisamorozova
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Income and outcome</title>

        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/main.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">

    </head>
    <%
        session.setAttribute("currentpage", "contacts.jsp");
    %>

    <body>
        <div class="nav">
            <div class="container">
                <ul class="pull-left">
                    <li><a href="incomes.jspl">Incomes</a></li>
                    <li><a href="expenses.jsp">Expenses</a></li>
                    <li><a href="reports.jsp">Reports</a></li>
                </ul>
                <%
                    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
                %>  
                <ul class="pull-right">
                    <li><a href="signup.jsp">Sign Up</a></li>
                    <li><a href="login.jsp">Log In</a></li>
                    <li class="active">Contacts</li>
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
                    <div class="col-md-12">
                        <h1>Contacts</h1>
                        <p>Please contact me if any questions</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="learn-more">
            <div class="container">
                <div class="row row-content">
                    <div class="col-xs-12">
                        <h3>Contact Author: </h3>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-sm-offset-1">
                        <p>You can follow me on:<br/>
                            <p><a class="btn btn-social-icon btn-github" href="https://github.com/LarisaMorozova"><i class="fa fa-github"></i></a>: Follow me on GitHub</p>
                            <p><a class="btn btn-social-icon btn-linkedin" href="https://www.linkedin.com/in/larisa-morozova-07a33157"><i class="fa fa-linkedin"></i></a>: Follow me on LinkedIn</p>
                            <p><a class="btn btn-social-icon btn-youtube" href="https://www.youtube.com/user/florzyk21"><i class="fa fa-youtube"></i></a>: Follow me on Youtube</p>
                            
                        
                        <p>Contact form will follow in next release</p>
                    </div>
                </div>
            </div>
        </div>

        <footer class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-10">
                        <h5>Links: </h5>
                        <ul class="list-unstyled">
                            <li><a href="index.jsp">Home</a></li>
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
