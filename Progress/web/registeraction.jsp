<%@page language="java" import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<%
 Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/laundry shop","root","");
Statement s=con.createStatement();
//ResultSet rs;
String p1=request.getParameter("Password");
String p2=request.getParameter("RPassword");
if(p1.equals(p2)){
s.execute("insert into user values ("+request.getParameter("Roll_No.")+",'"+request.getParameter("Username")+"','"+request.getParameter("Email")+"',"+request.getParameter("Mobile")+",'"+request.getParameter("Hostel")+"','"+request.getParameter("Room_No.")+"')");
response.sendRedirect("index.jsp");}
else
    {

%>
<dialog open>Passwords do not match please try again</dialog>
<p></p>
<a href="register.jsp">Sign Up</a>
<%
}
%>