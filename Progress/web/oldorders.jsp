<!DOCTYPE html>
<%@page language="java" import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<% response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);
    if ((session.getAttribute("roll_no.") == null) || (session.getAttribute("roll_no.") == "")) {
%>
<link rel="stylesheet" type="text/css" href="bootstrap/bootstrap.css">
<h3>You are not logged in</h3><br/>
<a href="index.jsp" class="btn btn-lg btn-default">Please Login</a>
<%}
    else
        {
    %>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="mainpage.css">
	<link href="https://fonts.googleapis.com/css?family=Abril+Fatface" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="bootstrap/bootstrap.css">
	<title>New Orders</title>
        <style type="text/css">
            .jumbotron
            {
                background:rgba(37,93,255,0.4);
            }
            
            .jumbotron h1
            {
                font-weight: 700;
                color:#040443;
            }
            .tab th,td
            {
                padding:4px;
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
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/laundry shop","root","");
                    Statement s=con.createStatement();
                    ResultSet rs=s.executeQuery("Select Name from user where Roll_No=\""+session.getAttribute("roll_no.")+"\"");
                    rs.next();
                    String str=rs.getString(1); %>
                    <span style="font-size:20px; padding-right:20px;">Welcome <% out.println(str); %></span>
             <a href="logout.jsp" class="btn btn-lg btn-default">Log Out</a>
         </div>
	<div class="middle">
		<div class="container">
			<div class="row">
				<div class="col-sm-3 col-xs-6 exstylegrid hover-control"><a href="mainpage.jsp" class="main-link">New Orders</a></div>
				<div class="col-sm-3 col-xs-6 exstylegrid current-selection"><a href="oldorders.jsp" class="main-link">Previous Orders</a></div>
				<div class="col-sm-3 col-xs-6 exstylegrid hover-control"><a href="info.jsp" class="main-link">User Info</a></div>
				<div class="col-sm-3 col-xs-6 exstylegrid hover-control"><a href="pickdel.jsp" class="main-link">Pickup/Delivery Details</a></div>
			</div>
                        <hr>
                        <div class="jumbotron">
                            <h1>Orders</h1>
                            <hr>
                            <% rs=s.executeQuery("select bill_no,Dos, Status,Total_due from services where roll_no="+session.getAttribute("roll_no."));%>
                            <table  style="font-size:27.714px;color:#040443; margin:20px auto; text-align: center;" class="tab">
                                <thead>
                                    <th>Bill No</th>
                                    <th>Date of Sub</th>
                                    <th>Status</th>
                                    <th>Due</th>
                                    <th style="width:71px;"></th>
                                </thead>
                                <tbody>
                                    <%while(rs.next())
                                    {%>
                                        <tr>
                                            <td><%out.println(rs.getString(1));%></td>
                                            <td><%out.println(rs.getString(2));%></td>
                                            <td><%out.println(rs.getString(3));%></td>
                                            <td><%out.println(rs.getString(4));%></td>
                                            <td style="width:71px;"><a href="checkOrder.jsp?bill_no=<%out.println(rs.getString(1));%>" class="btn btn-default">Check</a></td>
                                        </tr>
                                        <%}%>
                                </tbody>
                            </table>
                        </div>
		</div>
                
                
	</div>

	<div class="Bottom">
		<p>All Rights Reserved  R.S Dry Clean</p>
	</div>
</div>


</body>
</html>
<%
}
%>