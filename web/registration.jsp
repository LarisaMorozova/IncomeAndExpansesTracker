<%-- 
    Document   : registration
    Created on : Oct 25, 2016, 9:31:16 PM
    Author     : larisamorozova
--%>


<%@page import="java.util.Properties"%>
<%@page import="java.io.InputStream"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.lang.*" %>
<%@ page import="financeplanning.*" %>

<%
    String user = request.getParameter("uname");
    String pwd = request.getParameter("pass");
    String cpwd = request.getParameter("cpass");
    String email = request.getParameter("email");
    System.out.println("user: " + user + " pwd: " + pwd + " email: " + email);
    if (user != null && !user.isEmpty() && pwd != null && !pwd.isEmpty() && 
        cpwd != null && !cpwd.isEmpty() && email != null && !email.isEmpty() && 
        cpwd.equals(pwd)) {
        System.out.println("HERE!!!");
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
        //ResultSet rs;
        String hashedPassword = PasswordHash.getEncryptedPassword(pwd);
        int i = st.executeUpdate("insert into users( uname, email, pass, regdate) values ('" + user + "','" + email + "','" + hashedPassword + "', CURDATE())");
        if (i > 0) {
            //session.setAttribute("userid", user);
            response.sendRedirect("index.jsp?success=1");
            // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
        }
    } else {
        response.sendRedirect("signup.jsp?error=1");
    }

%>
