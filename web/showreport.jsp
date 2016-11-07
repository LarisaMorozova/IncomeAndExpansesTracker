<%-- 
    Document   : showreport
    Created on : 05-Nov-2016, 19:18:06
    Author     : larisamorozova
--%>

<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.Properties"%>
<%@page import="java.io.InputStream"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.lang.*" %>
<%
    DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
    java.util.Date fromIncomesDate = formatter.parse(request.getParameter("from_date"));
    java.sql.Date fromIncomeDate = new java.sql.Date(fromIncomesDate.getTime());
    java.util.Date toIncomesDate = formatter.parse(request.getParameter("to_date"));
    java.sql.Date toIncomeDate = new java.sql.Date(toIncomesDate.getTime());
    String category = request.getParameter("category");
    InputStream privatestream = application.getResourceAsStream("/dbcon.properties");
    InputStream publicstream = application.getResourceAsStream("/dbconpublic.properties");
    Properties props = new Properties();
    props.load(privatestream);
    props.load(publicstream);
    Class.forName("com.mysql.jdbc.Driver");

    String databaseName = props.getProperty("dbname");
    String dbconnection = props.getProperty("dbconnection");
    String dbuser = props.getProperty("dbuser");
    String dbpass = props.getProperty("dbpass");

    Connection con = DriverManager.getConnection(dbconnection + databaseName,
            dbuser, dbpass);
    Statement st = con.createStatement();
    Statement statemant = con.createStatement();
    Statement statinc = con.createStatement();
    Statement statexp = con.createStatement();
    ResultSet resultset = null;
    ResultSet resultSum = null;
    ResultSet resultincome = null;
    ResultSet resultexpense = null;
    String resultin=null;
    String resultexp = null;
    double difference = 0.00;

    if (category.contains("income")) {
        resultset = st.executeQuery(
                "SELECT income_date, category, description, amount FROM incomes " +
                "WHERE income_date between '" + fromIncomeDate + "' and '" + toIncomeDate +
                "' ORDER BY income_date ASC"
        );
        resultSum = statemant.executeQuery(
                "SELECT SUM(amount) FROM incomes " +
                "WHERE income_date between '" + fromIncomeDate + "' and '" + toIncomeDate + "'"
        );
    } else if (category.contains("expense")) {
        resultset = st.executeQuery(
                "SELECT expense_date, category, description, amount FROM expenses " +
                "WHERE expense_date between '" + fromIncomeDate + "' and '" + toIncomeDate +
                "' Order by expense_date ASC"
        );
        resultSum = statemant.executeQuery(
                "SELECT SUM(amount) FROM expenses " +
                "WHERE expense_date between '" + fromIncomeDate + "' and '" + toIncomeDate + "'"
        );
    } else if(category.contains("allmoney")) {

        resultincome = statinc.executeQuery(
                "SELECT SUM(amount) as sum FROM incomes " +
                "WHERE income_date between '" + fromIncomeDate + "' and '" + toIncomeDate + "';"
        );
        
        resultexpense = statexp.executeQuery(
                "SELECT SUM(amount) as sum FROM expenses " +
                "WHERE expense_date between '" + fromIncomeDate + "' and '" + toIncomeDate + "'"
        );

        resultin = resultincome.getString(1);
        resultexp = resultexpense.getString(1);
        difference = resultincome.getDouble("sum") - 
                resultexpense.getDouble("sum");
    }
%>
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
                    <li class="active">Reports</li>
                </ul>
                <%
                    if ((session.getAttribute("userid") == null)
                            || (session.getAttribute("userid") == "")) {
                %>  
                <ul class="pull-right">
                    <li><a href="signup.jsp">Sign Up</a></li>
                    <li><a href="login.jsp">Log In</a></li>
                    <li><a href="contacts.jsp">Contacts</a></li>
                </ul>
                <%
                } else {
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
                        <h1>Reports</h1>
                        <p>Get reports about your expenses and incomes</p>
                    </div>
                </div>
            </div>
        </div>


        <div class="learn-more">
            <div class="container">
                <div class="row">
                    <div class="col-md-9">
                        <h3>Report</h3>

                    </div>
                    <br/>
                    <%if(category.contains("income") || category.contains("expense")){%>
                    <table class="table">
                        <thead class="thead-inverse">
                            <tr class="bg-primary">
                                <th>Income date</th>
                                <th>Category</th>
                                <th>Description</th>
                                <th>Amount</th>
                            </tr>
                        </thead>
                        <%if (resultset == null && resultSum == null) {%>
                        <p>No data for chosen period. Please, choose different dates.</p>
                        <%}%>
                        <% while (resultset.next()) {%>
                        <tbody>
                            <tr>
                                <td> <%= resultset.getString(1)%></td>
                                <td> <%= resultset.getString(2)%></td>
                                <td> <%= resultset.getString(3)%></td>
                                <td> <%= resultset.getString(4)%></td>
                            </tr>
                            <% } %>
                            <tr>
                                <td style="border-bottom:0px;border-left:0px;border-right:0px;"></td>
                                <td style="border-bottom:0px;border-left:0px;border-right:0px;"></td>
                                <td style="border-bottom:0px;border-left:0px; text-align:right;"> <b>TOTAL:</b></Td>
                                    <% while (resultSum.next()) {%>
                                <td><%= resultSum.getString(1)%> </TD>
                            </tr>
                        </tbody>
                        <% }%>
                    </table>
                    <%}
                        else if(category.contains("allmoney")){%>
                        <table class="table">
                        <thead class="thead-inverse">
                            <tr class="bg-primary">
                                <th>Period</th>
                                <th>Income</th>
                                <th>Expense</th>
                                <th>Difference</th>
                            </tr>
                        </thead>
                        
                        <tbody>
                            <tr>
                                <td> <%=fromIncomeDate + " - " + toIncomeDate%></td>
                                <td> <%= resultin %></td>
                                <td><%= resultexp %></td>
                                <td> <%= difference%></td>
                            </tr>
                        </tbody> 
                    </table>
                             <% }%>
                    <h5 style="text-align: right"><a href='reports.jsp'>Go back</a></h5>
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
                            <li class="active">Reports</li>
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
