<%-- 
    Document   : addincome
    Created on : Oct 26, 2016, 4:01:33 PM
    Author     : larisamorozova
--%>

<%@page import="java.util.Properties"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.lang.*" %>
<%
    DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
    java.util.Date incomesDate = formatter.parse(request.getParameter("income_date"));
    java.sql.Date incomeDate = new java.sql.Date(incomesDate.getTime());
    out.print(incomeDate);
    double amount = Double.parseDouble((request.getParameter("amount")));
    out.print(amount);
    String description = request.getParameter("description");
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

    Connection con = DriverManager.getConnection(dbconnection+databaseName,
            dbuser, dbpass);
    Statement st = con.createStatement();
    
    int i = st.executeUpdate("INSERT INTO incomes(income_date, amount, description, category) VALUES('"+incomeDate+"', '"+amount+"', '"+description+"', '"+category+"')");
  
if (i > 0) {
        //session.setAttribute("userid", user);
        response.sendRedirect("incomes.jsp?success=1");
       // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
    } else {
        response.sendRedirect("incomes.jsp?error=1");
    }
%>