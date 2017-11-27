<%-- 
    Document   : invalid
    Created on : 7 Nov, 2017, 1:58:10 PM
    Author     : Jashan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if ((session.getAttribute("roll_no.") == null) || (session.getAttribute("roll_no.") == "")) {
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Invalid </title>
        <link href="https://fonts.googleapis.com/css?family=Abril+Fatface" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="bootstrap/bootstrap.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            body{
                font-family:"Source Sans Pro";
            }
        </style>
    </head>
    <body>
        <h2>Invalid Username and Password</h2>
        <h3>Please Try Again</h3>
        <a href="index.jsp" class="btn btn-lg btn-default">Login</a>
    </body>
</html>

<%}
  else
      {
      response.sendRedirect("mainpage.jsp");
      }
  %>