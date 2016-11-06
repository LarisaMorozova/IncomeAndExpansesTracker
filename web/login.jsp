<%-- 
    Document   : login
    Created on : Oct 25, 2016, 5:34:37 PM
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
                    <li><a href="signup.jsp">Sign Up</a></li>
                    <li class="active">Log In</li>
                    <li><a href="contacts.jsp">Contacts</a></li>
                </ul>	
            </div>
        </div>
        <div class="jumbotron">
            <div class="container">
                <div class="row">
                    <div class="col-md-8">
                        <h1>Log In Page</h1>
                        <p>Keep track on your incomes and expenses</p>
                    </div>

                    <div class="col-md-4">
                        <form method="post" action="signin.jsp">
                            <div class="form-group">
                                <input type="name" class="form-control" name="uname" placeholder="UserName"><br>
                                <input type="password" class="form-control" name="pass" placeholder="Password">
                                <label class="checkbox-inline" style="margin-top:10px;">
                                    <input type="checkbox" name="approve" value="">
                                    <p style="font-size:14px">Remember me</p>
                                </label>
                            </div>
                            <button type="submit" class="btn btn-info navbar-btn">Login</button>
                            <button type="button" class="btn btn-default btn-btn">Reset</button>
                            <a href="signup.jsp" class="btn btn-info navbar-btn">Sign up</a>

                        </form>
                    </div>
                </div>
            </div>

        </div>
        <div>


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
    </body>
</html>