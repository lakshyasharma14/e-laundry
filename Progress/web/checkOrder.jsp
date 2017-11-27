<%@page language="java" import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<% response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);
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
        ResultSet rs;
        String s4;
        rs=sd.executeQuery("select *from services where bill_no="+s3+" and Roll_no="+session.getAttribute("roll_no."));
        if(rs.next()==true)
        {
        
                s4=rs.getString("Total_due");
            %>
            <!DOCTYPE HTML>
            <html>
                <head>
                    <title>Bill Number:<%out.println(s3);%></title>
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                </head>
            <h1 style="text-align: center;">Bill Number <%out.println(s3);%></h1>
            <table border="2" style="margin:20px auto;" class="tab">
                                    <thead>
                                        <tr>
                                            <th style="width:100px;">Type</th>
                                            <th style="width:200px;">Description</th>
                                            <th style="width:70px;">Quantity</th>
                                            <th style="width:70px;">Due</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% rs=sd.executeQuery("select job_desc,Qty,Due from jobs j,dry_clean w,services s where s.bill_no=w.bill_no and s.bill_no="+s3+ " and w.job_id=j.job_id and s.Roll_no="+session.getAttribute("roll_no."));%>
                                        <%while(rs.next())
                                        {%>
                                        <tr>
                                            <td>Dry Clean</td>
                                            <td><%out.println(rs.getString(1));%></td>
                                            <td><%out.println(rs.getString(2));%></td>
                                            <td><%out.println(rs.getString(3));%></td>
                                        </tr>
                                        <%}%>
                                        <% rs=sd.executeQuery("select job_desc,Qty,Due from jobs j,washing w,services s where s.bill_no=w.bill_no and s.bill_no="+s3+ " and w.job_id=j.job_id and s.Roll_no="+session.getAttribute("roll_no."));%>
                                        <%while(rs.next())
                                        {%>
                                        <tr>
                                            <td>Washing</td>
                                            <td><%out.println(rs.getString(1));%></td>
                                            <td><%out.println(rs.getString(2));%></td>
                                            <td><%out.println(rs.getString(3));%></td>
                                        </tr>
                                        <%}%>
                                        <%rs=sd.executeQuery("select job_desc,Qty,Due from jobs j,ironing w,services s where s.bill_no=w.bill_no and s.bill_no="+s3+ " and w.job_id=j.job_id and s.Roll_no="+session.getAttribute("roll_no."));%>
                                        <%while(rs.next())
                                        {%>
                                        <tr>
                                            <td>Ironing</td>
                                            <td><%out.println(rs.getString(1));%></td>
                                            <td><%out.println(rs.getString(2));%></td>
                                            <td><%out.println(rs.getString(3));%></td>
                                            
                                        </tr>
                                        <%}
       %>
                                        <tr>
                                            <td><strong>Total</strong>
                                            <td></td>
                                            <td></td>
                                            <td><%out.println(s4);%></td>
                                        </tr>
                                    </tbody>
                                </table>
                                        <a href="oldorders.jsp">Back</a>
            </html>
        <%}
else{
response.sendRedirect("oldorders.jsp");
}
    }catch(Exception e)
    {

    }
}
%>