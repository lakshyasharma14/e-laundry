<%@page language="java" import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<% response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);
  Class.forName("com.mysql.jdbc.Driver");
  Connection con=DriverManager.getConnection("jdbc:mysql://localhost/laundry shop","root","");
  Statement s=con.createStatement();
  ResultSet rs;
  
    if ((session.getAttribute("roll_no.") == null) || (session.getAttribute("roll_no.") == "")) {
        
%>
<link rel="stylesheet" type="text/css" href="bootstrap/bootstrap.css">
<h3>You are not logged in</h3><br/>
<a href="index.jsp" class="btn btn-lg btn-default">Please Login</a>
<%} 
else
{
     rs=s.executeQuery("select isAdmin from login where Roll_no="+session.getAttribute("roll_no.")+" and isAdmin=\"Y\" ");
            if(rs.next()==false)
                {response.sendRedirect("mainpage.jsp");}
    try
    {   
        
        String s3=request.getParameter("bill_no");
        s.execute("update services set Status='D' where status='R' and bill_no="+s3);
    }catch(Exception e)
    {

    }
    response.sendRedirect("admin.jsp");
}
%>