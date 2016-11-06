<%-- 
    Document   : deploy
    Created on : 02-Nov-2016, 19:56:19
    Author     : larisamorozova
--%>


<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.util.Properties"%>
<%-- 
    Document   : addincome
    Created on : Oct 26, 2016, 4:01:33 PM
    Author     : larisamorozova
--%>

<%@ page import ="java.sql.*" %>
<%@ page import ="java.lang.*" %>
<%
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

    Connection con = DriverManager.getConnection(dbconnection,
            dbuser, dbpass);
    Statement st = con.createStatement();
    int database = st.executeUpdate("CREATE DATABASE IF NOT EXISTS " + databaseName + ";");

    String incomeTB = "CREATE TABLE IF NOT EXISTS " + databaseName + ".incomes"
            + "(id int NOT NULL AUTO_INCREMENT,"
            + "  income_date DATE NOT NULL,"
            + "   amount DOUBLE NOT NULL,"
            + "   description VARCHAR(45),"
            + "   category VARCHAR(45) NOT NULL,"
            + "PRIMARY KEY (id))";

    String expenceTB = "CREATE TABLE IF NOT EXISTS " + databaseName + ".expenses"
            + "(id int NOT NULL AUTO_INCREMENT,"
            + "  expense_date DATE NOT NULL,"
            + "   amount DOUBLE NOT NULL,"
            + "   description VARCHAR(45),"
            + "   category VARCHAR(45) NOT NULL,"
            + "PRIMARY KEY (id))";

    String userTB = "CREATE TABLE IF NOT EXISTS " + databaseName + ".users"
            + "(id int NOT NULL AUTO_INCREMENT,"
            + "  uname VARCHAR(45) NOT NULL,"
            + "   email VARCHAR(45) NOT NULL,"
            + "   pass VARCHAR(45) NOT NULL,"
            + "regdate DATETIME NOT NULL,"
            + "PRIMARY KEY (id))";

    Statement stmt = con.createStatement();
    stmt.execute(userTB);
    stmt.execute(incomeTB);
    stmt.execute(expenceTB);
    response.sendRedirect("index.jsp?install_complete");
%>
