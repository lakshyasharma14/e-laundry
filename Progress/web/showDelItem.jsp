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
     rs=s.executeQuery("select isAdmin from login where Roll_no="+session.getAttribute("roll_no.")+" and isAdmin=\"Y\"");
            if(rs.next()==false)
                {response.sendRedirect("mainpage.jsp");}
    %>
    <html>
        <head>
            <link rel="stylesheet" type="text/css" href="bootstrap/bootstrap.css">
            <title>Delivery List</title>
        </head>
        <body style="padding:20px;"> 
            <% rs=s.executeQuery("select s.Roll_no,bill_no,Del_date,Total_due,Mobile_No,Hostel from services s,user u where u.Roll_no=s.Roll_no and status='R' and Del_mode='Delivery' order by bill_no ");%>
            <h1 style="font-size: 60px; color:#040443; text-align: center;">Delivery List</h1>
                            <table  style="font-size:27.714px;color:#040443; margin:20px auto; text-align: center;" class="tab">
                                <thead>
                                    <th style="width:150px; text-align: center;">Bill No</th>
                                    <th style="width:150px; text-align: center;">Bill No</th>
                                    <th style="width:150px; text-align: center;">Delivery Date</th>
                                    <th style="width:150px; text-align: center;">Due</th>
                                    <th style="width:150px; text-align: center;">Mobile No</th>
                                    <th style="width:150px; text-align: center;">Hostel</th>
                                    <th style="width:71px; text-align: center;"></th>
                                </thead>
                                <tbody>
                                    <%while(rs.next())
                                    {%>
                                        <tr>
                                            <td style="width:150px; text-align: center;"><%out.println(rs.getString(1));%></td>
                                            <td style="width:150px; text-align: center;"><%out.println(rs.getString(2));%></td>
                                            <td style="width:150px; text-align: center;"><%out.println(rs.getString(3));%></td>
                                            <td style="width:150px; text-align: center;"><%out.println(rs.getString(4));%></td>
                                            <td style="width:150px; text-align: center;"><%out.println(rs.getString(5));%></td>
                                            <td style="width:150px; text-align: center;"><%out.println(rs.getString(6));%></td>
                                            <td style="width:71px;"><a href="updateDel.jsp?bill_no=<%out.println(rs.getString(2));%>" class="btn btn-default">Mark as Delivered</a></td>
                                        </tr>
                                        <%}%>
                                </tbody>
                            </table>
                                <a href="admin.jsp" style="font-size:30px ;" class="btn btn-success">Back</a>
        </body>
    </html>
    <%
    try
    {   
        
        
    }catch(Exception e)
    {

    }
}
%>