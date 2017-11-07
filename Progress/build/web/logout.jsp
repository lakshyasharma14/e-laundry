
<%
//session.setAttribute("roll_no.",null);
session.removeAttribute("roll_no.");
session.invalidate();
response.sendRedirect("index.jsp");
%>