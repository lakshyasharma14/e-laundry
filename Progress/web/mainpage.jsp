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
				<div class="col-sm-3 col-xs-6 exstylegrid current-selection"><a href="mainpage.jsp" class="main-link">New Orders</a></div>
				<div class="col-sm-3 col-xs-6 exstylegrid hover-control"><a href="oldorders.jsp" class="main-link">Old Orders</a></div>
				<div class="col-sm-3 col-xs-6 exstylegrid hover-control"><a href="info.jsp" class="main-link">User Info</a></div>
				<div class="col-sm-3 col-xs-6 exstylegrid hover-control"><a href="pickdel.jsp" class="main-link">Pickup/Delivery Details</a></div>
			</div>
                        <hr>
                        <div class="row exstylegrid2">
                            <div class="col-sm-6">
                                <form method="post" action="mainpage.jsp">
                                    <%
                                        rs=s.executeQuery("select *from department");
                                    %>
                                    <select name="dept" style="color:black;" onchange="submit()">
                                        <option></option>
                                        <%
                                            while(rs.next())
                                            {
                                        %><option style="color:black;" value="<%out.println(rs.getString(1));%>"><%out.println(rs.getString(2));%></option>
                                           <% }
                                        %>
                                    </select>
                                </form>
                                    <br>
                                    <form method="post" action="addOrders.jsp">
                                    <%
                                        String opt=request.getParameter("dept");
                                        if(opt==null)
                                        {}
                                        else
                                        {
                                            rs=s.executeQuery("select * from jobs where dept_id="+opt);
                                            %><select name="job_id" style="color:black;">
                                                <option></option>
                                            <%
                                            while(rs.next())
                                            {
                                                %><option style="color:black;" value="<%out.println(rs.getString(1));%>"><%out.println(rs.getString(2));%></option>
                                            <%}
                                            %></select>
                                            <br>
                                            <label for="rollNum" class="form-labels">Quantity</label>
                                            <input type="text" name="qty" class="form-control form-group-members" id="rollNume" placeholder="Quantity" required="" pattern="[0-9]{1,2}" maxlength="2">
                                            <br>
                                            <button type="submit" class="btn btn-default btn-lg">Add to Bill</button>
                                            <br>
                                            <%
                                        }
                                    %>
                                </form>
                            </div>
                            <div class="col-sm-6">
                                <hr>
                                <hr>
                            </div>
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