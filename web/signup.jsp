<%-- 
    Document   : signup
    Created on : Oct 25, 2016, 5:35:25 PM
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

    <body>
        <div class="nav">
            <div class="container">
                <ul class="pull-left">
                    <li><a href="incomes.jsp">Incomes</a></li>
                    <li><a href="expenses.jsp">Expenses</a></li>
                    <li><a href="reports.jsp">Reports</a></li>
                </ul>
                <ul class="pull-right">
                    <li class="active">Sign Up</li>
                    <li><a href="login.jsp">Log In</a></li>
                    <li><a href="contacts.jsp">Contacts</a></li>
                </ul>	
            </div>
        </div>
        <div class="jumbotron">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h1>Registration Page</h1>
                        <p>Please register first</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="learn-more">
            <div class="container">
                <div class="login-signup">

                    <div role="tabpanel" class="tab-pane" id="profile">
                        <div class="row">

                            <div class="col-sm-6 mobile-pull">
                                <article role="login">
                                    <h3 class="text-center"><i class="fa fa-lock"></i> Create User Account</h3>
                                    <form class="signup" action="registration.jsp" method="post">
                                        <div class="form-group">
                                            <input type="text" name="uname" class="form-control" placeholder="UserName">
                                        </div>
                                        <div class="form-group">
                                            <input type="email" name="email" class="form-control" placeholder="Email Address">
                                        </div>

                                        <div class="form-group">
                                            <input type="password" name="pass" class="form-control" placeholder="Password">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="cpass" class="form-control" placeholder="Confirm Password">
                                        </div>
                                        <div class="form-group">
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox"> Please accept the terms and conditions to proceed with your request.
                                                </label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <input type="submit" class="btn btn-success btn-block"  value="SUBMIT">
                                        </div>
                                    </form>

                                </article>
                            </div>
                        </div>
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
