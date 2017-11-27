<%@page language="java" import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<%
 Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/laundry shop","root","");
Statement s=con.createStatement();
//ResultSet rs;
String p1=request.getParameter("Password");
String p2=request.getParameter("RPassword");
if(p1.equals(p2)){
    try{
        s.execute("insert into user values ("+request.getParameter("Roll_No.")+",'"+request.getParameter("Username")+"','"+request.getParameter("Email")+"',"+request.getParameter("Mobile")+",'"+request.getParameter("Hostel")+"','"+request.getParameter("Room_No.")+"',SYSDATE())");
        s.execute("insert into login values ("+request.getParameter("Roll_No.")+","+p1+",'Y',9999,'N')");
        s.execute("insert into log_table values(Timestamp(sysdate()),'Register User:"+request.getParameter("Roll_no.")+"')");
        response.sendRedirect("index.jsp");

    }catch(Exception e)
    {
//        out.println(e);
      response.sendRedirect("regfail.jsp");
    }
}
else
    {

%>
<link rel="stylesheet" type="text/css" href="bootstrap/bootstrap.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<h2>Passwords do not match please try again</h2>
<a href="register.jsp" class="btn btn-default btn-lg">Sign Up</a>
<%
}
%>