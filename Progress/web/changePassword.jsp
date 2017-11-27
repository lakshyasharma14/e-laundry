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
        String op=request.getParameter("oldP");
        String p1=request.getParameter("newP1");
        String p2=request.getParameter("newP2");
        ResultSet rs=s.executeQuery("select *from login where Roll_no="+session.getAttribute("roll_no.")+" and Password='"+op+"'");
        if(rs.next()==true)
        {
            if(p1.equals(p2))
            {
                s.execute("update login set password='"+p1+"' where Roll_no="+session.getAttribute("roll_no."));
                %>
                <script type="text/javascript">
                    alert("Password Changed!!");
                    window.location.href = "info.jsp";
                                       
                </script>
                <%
            }
            else
            {
                %>
                <script type="text/javascript">
                    alert("Password Don't Match!!");
                    window.location.href = "cPass.jsp";
                                       
                </script>
                <%
            }
            
        }
        else
        {
            %>
                <script type="text/javascript">
                    alert("Wrong Password!!");
                    window.location.href = "cPass.jsp";
                </script>
                <%
        }
        
    }catch(Exception e)
    {
        out.println(e);
        %>
       
        <%
    }
}
%>