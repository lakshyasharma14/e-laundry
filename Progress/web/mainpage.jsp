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
				<div class="col-sm-3 col-xs-6 exstylegrid current-selection"><a href="mainpage.jsp" class="main-link">New Orders</a></div>
				<div class="col-sm-3 col-xs-6 exstylegrid hover-control"><a href="oldorders.jsp" class="main-link">Previous Orders</a></div>
				<div class="col-sm-3 col-xs-6 exstylegrid hover-control"><a href="info.jsp" class="main-link">User Info</a></div>
				<div class="col-sm-3 col-xs-6 exstylegrid hover-control"><a href="pickdel.jsp" class="main-link">Pickup/Delivery Details</a></div>
			</div>
                        <hr>
                        <div class="row exstylegrid2" style="border-radius: 10px;">
                            <div class="col-sm-6 wow">
                                <h2 class="head-grid">Update current order</h2>
                                <form method="pull" action="mainpage.jsp">
                                    <%
                                        String opt=request.getParameter("dept");
                                        rs=s.executeQuery("select *from department");
                                    %>
                                    <select name="dept" style="color:black;" onchange="submit()">
                                        <option></option>
                                        <%
                                            while(rs.next())
                                            {
                                        %><option style="color:black;" value="<%out.println(rs.getString(1));%>" <%if(opt==null){out.println("style=\"color:green;\"");}
                                            else if(opt.equals(rs.getString(1)+"%OD%OA")){out.println("selected");}%>><%out.println(rs.getString(2));%></option>
                                           <% }
                                        %>
                                    </select>
                                </form>
                                    <br>
                                    <form method="post" action="addOrders.jsp">
                                    <%
                                        
                                        if(opt==null)
                                        {}
                                        else
                                        {
                                            rs=s.executeQuery("select * from jobs where dept_id="+opt);
                                    %><select name="job_id" style="color:black;" required="">
                                                <option></option>
                                            <%
                                            while(rs.next())
                                            {
                                                %><option style="color:black;" value="<%out.println(rs.getString(1));%>"><%out.println(rs.getString(2));%></option>
                                            <%}
                                            %></select>
                                            <br>
                                            <label for="rollNum" class="form-labels" style="color:#040443;margin:10px 0;">Quantity</label>
                                            <input type="text" name="qty" class="form-control form-group-members" id="rollNume" placeholder="Quantity" required="" pattern="[0-9]{1,2}" maxlength="2">
                                            <br>
                                            <button type="submit" class="btn btn-default btn-lg" style="margin-top:10px; margin-bottom: 20px;">Add to Bill</button>
                                            <br>
                                            <%
                                        }
                                    %>
                                </form>
                            </div>
                            <div class="col-sm-6 leftb wow">
                                <h2 class="head-grid">Current Order</h2>
                                <table style="margin:20px auto; color:#040443;" class="tab">
                                    <thead>
                                        <tr>
                                            <th style="width:100px;">Type</th>
                                            <th style="width:200px;">Description</th>
                                            <th style="width:70px;">Quantity</th>
                                            <th style="width:70px;">Due</th>
                                            <th style="width:100px;"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% rs=s.executeQuery("select job_desc,Qty,Due,s.bill_no,j.job_id from jobs j,dry_clean w,services s where s.bill_no=w.bill_no and w.job_id=j.job_id and s.Roll_no="+session.getAttribute("roll_no.")+" and s.Status=\"P\"");%>
                                        <%while(rs.next())
                                        {%>
                                        <tr>
                                            <td>Dry Clean</td>
                                            <td><%out.println(rs.getString(1));%></td>
                                            <td><%out.println(rs.getString(2));%></td>
                                            <td><%out.println(rs.getString(3));%></td>
                                            <td><a href="deleteProcOrder.jsp?mode=dry_clean&bill_no=<%out.println(rs.getString(4));%>&job_id=<%out.println(rs.getString(5));%>" class="btn btn-default">X</a></td>
                                        </tr>
                                        <%}%>
                                        <% rs=s.executeQuery("select job_desc,Qty,Due,s.bill_no,j.job_id from jobs j,washing w,services s where s.bill_no=w.bill_no and w.job_id=j.job_id and s.Roll_no="+session.getAttribute("roll_no.")+" and s.Status=\"P\"");%>
                                        <%while(rs.next())
                                        {%>
                                        <tr>
                                            <td>Washing</td>
                                            <td><%out.println(rs.getString(1));%></td>
                                            <td><%out.println(rs.getString(2));%></td>
                                            <td><%out.println(rs.getString(3));%></td>
                                            <td><a href="deleteProcOrder.jsp?mode=washing&bill_no=<%out.println(rs.getString(4));%>&job_id=<%out.println(rs.getString(5));%>" class="btn btn-default">X</a></td>
                                        </tr>
                                        <%}%>
                                        <% rs=s.executeQuery("select job_desc,Qty,Due,s.bill_no,j.job_id from jobs j,ironing w,services s where s.bill_no=w.bill_no and w.job_id=j.job_id and s.Roll_no="+session.getAttribute("roll_no.")+" and s.Status=\"P\"");%>
                                        <%while(rs.next())
                                        {%>
                                        <tr>
                                            <td>Ironing</td>
                                            <td><%out.println(rs.getString(1));%></td>
                                            <td><%out.println(rs.getString(2));%></td>
                                            <td><%out.println(rs.getString(3));%></td>
                                            <td><a href="deleteProcOrder.jsp?mode=ironing&bill_no=<%out.println(rs.getString(4));%>&job_id=<%out.println(rs.getString(5));%>" class="btn btn-default">X</a></td>
                                        </tr>
                                        <%}%>
                                    </tbody>
                                </table>
                                        <% ResultSet r=s.executeQuery("select *from services where Status=\"P\" and Roll_no="+session.getAttribute("roll_no."));
                                    if(r.next()==true)
                                    {
                                        
                                    %>
                                    <a href="clearPOrder.jsp?bill_no=<%out.println(r.getString("bill_no"));%>" class="btn btn-lg btn-default">Clear Order</a>
                                    <a href="submitPOrder.jsp?bill_no=<%out.println(r.getString("bill_no"));%>" class="btn btn-lg btn-default">Submit Order</a>
                                    <%}
                                %>
                            </div>
                        </div>
		</div>
                
	</div>

	<div class="Bottom">
            All Rights Reserved  R.S Dry Clean <%
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