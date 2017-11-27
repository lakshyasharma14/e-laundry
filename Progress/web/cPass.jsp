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
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>New Orders</title>
        <style type="text/css">
            .jumbotron
            {
                background:rgba(255, 132, 0,0.4);
            }
            
            .jumbotron h1
            {
                font-weight: 700;
                color:#040443;
            }
            .poit
            {
                padding-right:20px;
                padding-left:20px;
                color:#040443;
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
                    ResultSet rs=s.executeQuery("Select *from user where Roll_No=\""+session.getAttribute("roll_no.")+"\"");
                    rs.next();
                    String str=rs.getString(2); %>
                    <span style="font-size:20px; padding-right:20px;">Welcome <% out.println(str); %></span>
             <a href="logout.jsp" class="btn btn-lg btn-default">Log Out</a>
         </div>
	<div class="middle">
		<div class="container">
			<div class="row">
				<div class="col-sm-3 col-xs-6 exstylegrid hover-control"><a href="mainpage.jsp" class="main-link">New Orders</a></div>
				<div class="col-sm-3 col-xs-6 exstylegrid hover-control"><a href="oldorders.jsp" class="main-link">Previous Orders</a></div>
				<div class="col-sm-3 col-xs-6 exstylegrid current-selection"><a href="info.jsp" class="main-link">User Info</a></div>
				<div class="col-sm-3 col-xs-6 exstylegrid hover-control"><a href="pickdel.jsp" class="main-link">Pickup/Delivery Details</a></div>
			</div>
                    <hr>    
                        <div class="jumbotron">
                            <h1>Change Password</h1>
                            <hr>
                            <form method="pull" action="changePassword.jsp">
                                <div class="form-group">
                                    <label for="rollNum" class="form-labels">Old Password</label>
                                    <input type="password" name="oldP" class="form-control form-group-members" id="exampleInputPassword1" placeholder="Old Password" required="" pattern="[0-9a-zA-Z]{6,50}">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1" class="form-labels">New Password</label>
                                    <input type="password" name="newP1" class="form-control form-group-members" id="exampleInputPassword1" placeholder="New Password" required="" pattern="[0-9a-zA-Z]{6,50}">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword2" class="form-labels">Retype New Password</label>
                                    <input type="password" name="newP2" class="form-control form-group-members" id="exampleInputPassword2" placeholder="Retype New Password" required="" pattern="[0-9a-zA-Z]{6,50}">
                                </div>
                                <button type="submit" class="btn btn-default">Change Password</button>
                            </form>
                            <br>
                        </div>
		</div>
                
	</div>

	<div class="Bottom">
		All Rights Reserved  R.S Dry Clean<%
                rs=s.executeQuery("select Roll_no from login where isAdmin=\"Y\" and Roll_no="+session.getAttribute("roll_no."));
                if(rs.next())
                {
                    %>
                    <a href="admin.jsp" style="color:red; text-align: left;">Admin Mode</a>
                <%}
                %>
	</div>
</div>


</body>
</html>
<%
}
%>