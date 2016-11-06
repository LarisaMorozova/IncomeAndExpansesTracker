<%-- 
    Document   : addexpanses
    Created on : Oct 27, 2016, 2:26:45 PM
    Author     : larisamorozova
--%>

<%@page import="java.util.Properties"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page import ="java.sql.*" %>
<%
    DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
    java.util.Date expensesDate = formatter.parse(request.getParameter("expense_date"));
    java.sql.Date expenseDate = new java.sql.Date(expensesDate.getTime());
    double amount = Double.parseDouble((request.getParameter("amount")));
    String description = request.getParameter("description");
    String category = request.getParameter("category");
    Class.forName("com.mysql.jdbc.Driver");
    InputStream stream = application.getResourceAsStream("/dbcon.properties");
    Properties props = new Properties();
    props.load(stream);
    Class.forName("com.mysql.jdbc.Driver");

    String databaseName = "finances";
    String dbconnection = props.getProperty("dbconnection");
    String dbuser = props.getProperty("dbuser");
    String dbpass = props.getProperty("dbpass");

    Connection con = DriverManager.getConnection(dbconnection+databaseName,
            dbuser, dbpass);
    Statement st = con.createStatement();
    int i = st.executeUpdate("INSERT INTO expenses(expense_date, amount, description, category) VALUES('"+expenseDate+"', '"+amount+"', '"+description+"', '"+category+"')");
  
if (i > 0) {
        //session.setAttribute("userid", user);
        response.sendRedirect("expenses.jsp?success=1");
       // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
    } else {
        response.sendRedirect("expenses.jsp?error=1");
    }
%>