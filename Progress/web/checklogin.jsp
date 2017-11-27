<%@page language="java" import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<%
 Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/laundry shop","root","");
Statement s=con.createStatement();
ResultSet rs;
String r=request.getParameter("roll_no.");
rs=s.executeQuery("select *from login where Roll_No="+request.getParameter("roll_no.") +" and Password='"+request.getParameter("password")+"'");
if(rs.next()==true)
    {
       session.setAttribute("roll_no.",r);
       if(request.getParameter("remme")=="" || request.getParameter("remme")==null || rs.getString("isAdmin").equals("Y"))
       {session.setMaxInactiveInterval(30);}
       response.sendRedirect("mainpage.jsp");
    }
else
    {
     response.sendRedirect("invalid.jsp");
    }
%>