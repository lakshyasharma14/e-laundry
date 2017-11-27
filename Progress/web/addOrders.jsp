<%@page language="java" import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<% response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);
  String s1=request.getParameter("job_id");
  String s2=request.getParameter("qty");
  
    if ((session.getAttribute("roll_no.") == null) || (session.getAttribute("roll_no.") == "")) {
%>
<link rel="stylesheet" type="text/css" href="bootstrap/bootstrap.css">
<h3>You are not logged in</h3><br/>
<a href="index.jsp" class="btn btn-lg btn-default">Please Login</a>
<%} 
else if(s1==null || s2==null)
{
response.sendRedirect("mainpage.jsp");
}
else{
    Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/laundry shop","root","");
Statement s=con.createStatement();
ResultSet rs;


try
{
    rs=s.executeQuery("select *from services where Roll_no=\""+session.getAttribute("roll_no.")+"\" and Status=\"P\"");
if(rs.next()==false)
{
    s.execute("insert into services values(24,\""+session.getAttribute("roll_no.")+"\",sysdate(),\"P\",0,null,null)");
}
rs=s.executeQuery("select *from services where Roll_no=\""+session.getAttribute("roll_no.")+"\" and Status=\"P\"");
rs.next();
String s3=rs.getString("bill_no");

if(s1.charAt(0)=='1')
{
    try
    {
        s.execute("insert into dry_clean values("+s3+","+s1+","+s2+",0)");
    }catch(Exception e)
    {
        s.execute("update dry_clean set qty=qty+"+s2+" where bill_no="+s3+" and job_id="+s1);
    }
}
else if(s1.charAt(0)=='2')
{
   try
    {
        s.execute("insert into washing values("+s3+","+s1+","+s2+",0)");
    }catch(Exception e)
    {
        s.execute("update washing set qty=qty+"+s2+" where bill_no="+s3+" and job_id="+s1);
    }
}

else if(s1.charAt(0)=='3')
{
    try
    {
        s.execute("insert into ironing values("+s3+","+s1+","+s2+",0)");
    }catch(Exception e)
    {
        s.execute("update ironing set qty=qty+"+s2+" where bill_no="+s3+" and job_id="+s1);
    }
}
response.sendRedirect("mainpage.jsp");
}catch(NullPointerException e)
{
    %>
    <link rel="stylesheet" type="text/css" href="bootstrap/bootstrap.css">
<h3>Item Already Exists!! Please remove it and then add again</h3><br/>
<%out.println(e);%>
<a href="mainpage.jsp" class="btn btn-lg btn-default">Back</a>
<%    
}





}%>