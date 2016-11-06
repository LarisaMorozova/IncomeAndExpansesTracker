<%-- 
    Document   : signin
    Created on : Oct 25, 2016, 10:18:34 PM
    Author     : larisamorozova
--%>

<%@page import="java.util.Properties"%>
<%@page import="java.io.InputStream"%>
<%@page import="financeplanning.PasswordHash"%>
<%@ page import ="java.sql.*" %>
<%
    String userid = request.getParameter("uname");
    String pwd = request.getParameter("pass");
    String hashPass= PasswordHash.getEncryptedPassword(pwd);
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
    ResultSet rs;
    
    rs = st.executeQuery("select * from users where uname='" + userid + "' and pass='" + hashPass + "'");
    if (rs.next()) {
        session.setAttribute("userid", userid);
        //out.println("welcome " + userid)
        //out.println("<a href='logout.jsp'>Log out</a>");
        String username = (String) session.getAttribute("userid");
        String pagename = (String) session.getAttribute("currentpage");
        if (pagename == null) {
            pagename = "index.jsp?login_"+ username;
        }
        response.sendRedirect(pagename);
    } else {
        out.println("Invalid password <a href='index.jsp'>try again</a>");
    }
%>
