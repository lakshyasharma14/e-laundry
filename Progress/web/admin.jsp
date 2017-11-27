<!DOCTYPE html>
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
	<link rel="stylesheet" type="text/css" href="mainpage.css">
	<link href="https://fonts.googleapis.com/css?family=Abril+Fatface" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="bootstrap/bootstrap.css">
	<title>New Orders</title>
        <style type="text/css">
            .head-grid{
                color:#040443;
                text-align:center;
                margin-bottom: 30px;
            }
            .tab th,td
            {
                padding:4px;
            }
            .wow
            {
                padding-bottom: 20px;
            }
            .exstylegrid2
            {
                padding:20px;
            }
            .btn2{
                margin-bottom: 10px;
                margin-top:10px;
            }
        </style>
</head>
<body class="main">
<div class="main_container">
	<div class="top_head_style">
		<p class="main_heading">
			<span>
                    <img src="index/thaparlogo.png" alt="" class="main_heading_image">
			</span>

			<span>
                    R.S Dry Cleaners
			</span>
                         
		</p>
	</div>
         <div class="logout">
             <%
                    
                    rs=s.executeQuery("Select Name from user where Roll_No=\""+session.getAttribute("roll_no.")+"\"");
                    rs.next();
                    String str=rs.getString(1); %>
                    <span style="font-size:20px; padding-right:20px;">Welcome <% out.println(str); %></span>
             <a href="logout.jsp" class="btn btn-lg btn-default">Log Out</a>
         </div>
	<div class="middle">
		<div class="container">
                        <hr>
                        <div class="exstylegrid2" style="border-radius: 10px;">
                            <a href="showAll.jsp" class="btn btn-lg btn-primary btn2">All Orders</a>
                            <br>
                            <a href="showNRO.jsp" class="btn btn-lg btn-primary btn2">Not Ready Orders</a>
                            <br>
                            <a href="showDelItem.jsp" class="btn btn-lg btn-primary btn2">Delivery List</a>
                            <br>
                            <a href="showPickItem.jsp" class="btn btn-lg btn-primary btn2">Pickup List</a>
                        </div>
		</div>
                
	</div>

	<div class="Bottom">
            All Rights Reserved  R.S Dry Clean <%
                rs=s.executeQuery("select Roll_no from login where isAdmin=\"Y\" and Roll_no="+session.getAttribute("roll_no."));
                if(rs.next())
                {
                    %>
                    <a href="mainpage.jsp" style="color:red; text-align: left;">User Mode</a>
                <%}
                %>
                
	</div>
</div>


</body>
</html>
<%
}
%>