<%@ page contentType="text/html"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*,java.text.*"%>

<html>
    <body>
        <%
          String connection = "jdbc:sqlserver://213.140.22.237\\SQLEXPRESS:1433;databaseName=XFactor;user=imbroinise.davide;password=xxx123#";
          Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
          Connection conn = DriverManager.getConnection(connection);
          
          String sql = "select * from Sblendorio where Username = ? and Password = ?";
          
          PreparedStatement PrepStmt = conn.prepareStatement(sql);
          
          PrepStmt.setString (1, request.getParameter("username"));
          PrepStmt.setString (2, request.getParameter("psw"));
          
          ResultSet rs = PrepStmt.executeQuery();
          
          if(rs.next()){
              out.println(" Benvenuto " + rs.getString("Nome"));
          }else{
              out.println("Utente non trovato " + request.getParameter("username")+ " o password sbagliata.");
          }
          
          rs.close();
          
          conn.close();
          %>