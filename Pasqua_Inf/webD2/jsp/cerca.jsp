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
          
          String sql = "select * from Sblendorio where "+ request.getParameter("Informazione") +" like ?";
          
          PreparedStatement PrepStmt = conn.prepareStatement(sql);
          
          //PrepStmt.setString (1, request.getParameter("Informazione"));
          //PrepStmt.setString (2, request.getParameter("Informazione"));
          PrepStmt.setString (1, "%"+ request.getParameter("cerca")+"%");
          
          ResultSet rs = PrepStmt.executeQuery();
          
          out.print("<table>");
		  out.print("<tr><th align=left> Nome </th> <th align=left> Cognome </th><th align=left> Email </th><th align=left> Username </th></tr>");
          while(rs.next()){
              String nome = rs.getString("Nome");
              String cognome = rs.getString("Cognome");
              String email = rs.getString("Email");
              String user = rs.getString("Username");
              out.print("<tr><td>"+ nome +"</td><td>"+ cognome +"</td><td>"+ email +"</td><td>"+ user +"</td></tr>");
          }
          
          out.print("</table>");
          
          rs.close();
          
          conn.close();
          %>