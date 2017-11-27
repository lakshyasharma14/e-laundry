<%@page language="java" import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/laundry shop","root","");
Statement s=con.createStatement();
s.execute("insert into Log_Table values(Timestamp(sysdate()),\"Logged out:"+session.getAttribute("roll_no.")+"\")");
session.removeAttribute("roll_no.");
session.invalidate();
response.sendRedirect("index.jsp");
%>