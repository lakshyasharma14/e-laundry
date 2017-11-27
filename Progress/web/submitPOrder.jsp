<%@page language="java" import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<% response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);
  String s3=request.getParameter("bill_no");
  
    if ((session.getAttribute("roll_no.") == null) || (session.getAttribute("roll_no.") == "")) {
%>
<link rel="stylesheet" type="text/css" href="bootstrap/bootstrap.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<h3>You are not logged in</h3><br/>
<a href="index.jsp" class="btn btn-lg btn-default">Please Login</a>
<%} 
else
{
    try
    {   
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost/laundry shop","root","");
        Statement s=con.createStatement();
        ResultSet rs=s.executeQuery("select *from services where bill_no="+s3+" and Status=\"P\" and Roll_no="+session.getAttribute("roll_no."));
        if(rs.next()==true)
        {
            s.execute("update services set status=\"NR\" where bill_no="+s3);
            response.sendRedirect("mainpage.jsp");
        }
        else
        {
            response.sendRedirect("mainpage.jsp");
        }
    }catch(Exception e)
    {

    }
}
%>