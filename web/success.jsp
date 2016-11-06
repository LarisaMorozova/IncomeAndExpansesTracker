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
                <ul class="pull-right">
                    <%
                        if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
                    %>
                    <span class="welcome">You are not logged in</span>
                    <a href="login.jsp">Please Login</a>
                    <%} else {
                    %>
                    <span class="welcome">Welcome, <%=session.getAttribute("userid")%></span>
                    <a href='logout.jsp'>Log out</a>
                    <%
                        }
                    %>
                </ul>	
            </div>
        </div>
        <div class="jumbotron">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <h1>Finance planning</h1>
                        <p>Keep track on your incomes and expenses</p>
                    </div>

                </div>
            </div>
        </div>

        <div class="learn-more">
            <div class="container">
                <div class="row">
                </div>
            </div>
        </div>

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
    </body>
</html>