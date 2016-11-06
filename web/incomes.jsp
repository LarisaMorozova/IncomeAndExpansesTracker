<%-- 
    Document   : incomes
    Created on : Oct 25, 2016, 5:32:21 PM
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
        session.setAttribute("currentpage", "incomes.jsp");
    %>
    <body>
        <div class="nav">
            <div class="container">
                <ul class="pull-left">
                    <li class="active">Incomes</li>
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
                    <div class="col-md-12">
                        <h1>Incomes</h1>
                        <p>Keep track on your incomes</p>
                    </div>
                </div>
            </div>
        </div>
        <%
            if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
        %>
        <div class="container">
            <div class="row">
                <div class="cont">You are not logged in<br/>
                    <a href="login.jsp">Please Login</a><br/>
                </div>
            </div>
        </div>
        <%} else {
        %>
        <div class="learn-more">
            <div class="container">
                <div class="row">
                    <div class="col-md-10">
                        <h3>Incomes</h3>
                        <form method="post" action="addincome.jsp">
                            <div class="input-group-btn">
                                <div class="col-md-3">
                                    <div class="input-group" id="date">
                                        <input type="date" name="income_date" class="form-control">
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="input-group">
                                        <input type="text" name="amount" class="form-control" placeholder="Amount">
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="input-group">
                                        <input type="text" name="description" class="form-control" placeholder="Description">
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="input-group">
                                        <select name="category" class="form-control">
                                            <option value="salary">Salary</option>
                                            <option value="others">Others</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-xs-1">
                                    <button type="submit" class="btn btn-info">Add</button>
                                </div>

                            </div>

                        </form>
                        <%
                            String query = request.getQueryString();
                            if (query != null && query.contains("success")) {%>
                        <br/>
                        <div>
                            <p style='color:green'>Data added successfully into database.</p>
                        </div>
                        <%
                        } else if (query != null && query.contains("error")) {
                        %>
                        <br/>
                        <div>
                            <p style='color:red'>Data wasn't added successfully into database.</p>
                        </div>
                        <%
                            } else {
                            }
                        %>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <%
        }
    %>

    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-md-10">
                    <h5>Links: </h5>
                    <ul class="list-unstyled">
                        <li><a href="index.jsp">Home</a></li>
                        <li class="active">Incomes</li>
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