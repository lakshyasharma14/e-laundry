<%@page language="java" import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<%
 Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/laundry shop","root","");
Statement s=con.createStatement();
ResultSet rs;
String r=request.getParameter("");
rs=s.executeQuery("select Roll_No from login where Roll_No="+request.getParameter("roll_no.") +" and Password='"+request.getParameter("password")+"'");
%>