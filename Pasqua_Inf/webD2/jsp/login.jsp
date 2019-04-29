<%@ page contentType="text/html"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*,java.text.*"%>

<html>
    <body>
        <%
          String connection = "jdbc:sqlserver://213.140.22.237\\SQLEXPRESS:1433;databaseName=XFactor;user=imborinise.davide;password=xxx123#";
          Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
          Connection conn = DriverManager.getConnection(connection);
          
          Statement stmt = conn.createStatement();
          
          String sql = "select * from Sblendorio where Username ='" + request.getParameter("username") + "' and Password ='" + request.getParameter("psw")+"'";
          
          ResultSet rs = stmt.executeQuery(sql);
          
          if(rs.next()){
              out.println(" Benvenuto " + rs.getString("Nome"));
          }else{
              out.println("Utente non trovato " + request.getParameter("username")+ " o password sbagliata.");
          }
          
          rs.close();
          
          conn.close();
          %>