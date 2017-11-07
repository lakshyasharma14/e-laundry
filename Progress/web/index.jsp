<% response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);
    if ((session.getAttribute("roll_no.") == null) || (session.getAttribute("roll_no.") == "")) {
%>
 <%@page language="java" import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>                  
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="index.css">
    <link href="https://fonts.googleapis.com/css?family=Abril+Fatface" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="bootstrap/bootstrap.css">
	<title>E-laundry Login</title>
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
		<div class="middle">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                        <img src="index/mainlogo.png" class="page_photo1" alt="">
                        <p class="small_line">Your one Stop Destination for laundry Service In TU</p>
                    </div>
                    <div class="col-sm-6">

                        <form class="contain_form form_font" action="checklogin.jsp">
                            <h3 class="login_heading">Login</h3>

                            <hr>

                            <div class="form-group">
                                <label for="rollNum" class="form-labels">Roll Number</label>
                                <input type="text" name="roll_no." class="form-control form-group-members" id="rollNume" placeholder="Roll Number" required="" pattern="[0-9]{9}" maxlength="9">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1" class="form-labels">Password</label>
                                <input type="password" name="password" class="form-control form-group-members" id="exampleInputPassword1" placeholder="Password" required="" pattern="[0-9a-zA-Z]{6,10}">
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" id="remeberme">Remember Me
                                </label>
                            </div>
                            <p class="form-control">Not a user? <a href="register.jsp">Sign Up</a></p>

                            <button type="submit" class="btn btn-default">Login</button>
                        </form>
      
                 
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
<%}
  else
      {
      response.sendRedirect("mainpage.jsp");
      }
  %>