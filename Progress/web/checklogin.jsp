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
       s.execute("insert into Log_Table values(Timestamp(sysdate()),\"Logged in:"+request.getParameter("roll_no.")+"\")");
       session.setAttribute("roll_no.",r);
       if(request.getParameter("remme")=="" || request.getParameter("remme")==null)
       {session.setMaxInactiveInterval(30);}
       response.sendRedirect("mainpage.jsp");
    }
else
    {
    s.execute("insert into Log_Table values(Timestamp(sysdate()),\"Log in fail:"+request.getParameter("roll_no.")+"\")");
     response.sendRedirect("invalid.jsp");
    }
%>