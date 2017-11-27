<%@page language="java" import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<% response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);
  String s1=request.getParameter("job_id");
  String s2=request.getParameter("mode");
  String s3=request.getParameter("bill_no");
  
    if ((session.getAttribute("roll_no.") == null) || (session.getAttribute("roll_no.") == "")) {
%>
<link rel="stylesheet" type="text/css" href="bootstrap/bootstrap.css">
<h3>You are not logged in</h3><br/>
<a href="index.jsp" class="btn btn-lg btn-default">Please Login</a>
<%} 
else
{
    try
    {   
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost/laundry shop","root","");
        Statement sd=con.createStatement();
        Statement sw=con.createStatement();
        Statement si=con.createStatement();
        sd.execute("delete from "+s2+" where bill_no="+s3+" and job_id="+s1);
        ResultSet rsd,rsw,rsi;
        rsd=sd.executeQuery("select *from dry_clean where bill_no="+s3);
        rsw=sw.executeQuery("select *from washing where bill_no="+s3);
        rsi=si.executeQuery("select *from ironing where bill_no="+s3);
        if(rsd.next()!=true && rsw.next()!=true && rsi.next()!=true)
        {
            sd.execute("delete from services where bill_no="+s3);
        }
    }catch(Exception e)
    {

    }
    response.sendRedirect("mainpage.jsp");
}
%>