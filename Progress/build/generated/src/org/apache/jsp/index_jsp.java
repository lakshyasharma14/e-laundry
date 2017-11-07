package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.Vector _jspx_dependants;

  private org.apache.jasper.runtime.ResourceInjector _jspx_resourceInjector;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.apache.jasper.runtime.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

 response.setHeader("Cache-Control","no-cache"); //HTTP 1.1 
 response.setHeader("Pragma","no-cache"); //HTTP 1.0 
 response.setDateHeader ("Expires", 0); //prevents caching at the proxy server  

      out.write("\n");
      out.write("                   \n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("\t<link rel=\"stylesheet\" type=\"text/css\" href=\"index.css\">\n");
      out.write("    <link href=\"https://fonts.googleapis.com/css?family=Abril+Fatface\" rel=\"stylesheet\">\n");
      out.write("\t<link href=\"https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700\" rel=\"stylesheet\">\n");
      out.write("\t<link rel=\"stylesheet\" type=\"text/css\" href=\"bootstrap/bootstrap.css\">\n");
      out.write("\t<title>E-laundry Login</title>\n");
      out.write("</head>\n");
      out.write("<body class=\"main\">\n");
      out.write("\t<div class=\"main_container\">\n");
      out.write("\t\t<div class=\"top_head_style\">\n");
      out.write("\t\t\t<p class=\"main_heading\">\n");
      out.write("                <span>\n");
      out.write("                    <img src=\"index/thaparlogo.png\" alt=\"\" class=\"main_heading_image\">\n");
      out.write("                </span>\n");
      out.write("\n");
      out.write("                <span>\n");
      out.write("                    R.S Dry Cleaners\n");
      out.write("                </span>\n");
      out.write("            </p>\n");
      out.write("\t\t</div>\n");
      out.write("\t\t<div class=\"middle\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"col-sm-6\">\n");
      out.write("                        <img src=\"index/mainlogo.png\" class=\"page_photo1\" alt=\"\">\n");
      out.write("                        <p class=\"small_line\">Your one Stop Destination for laundry Service In TU</p>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-sm-6\">\n");
      out.write("\n");
      out.write("                        <form class=\"contain_form form_font\" action=\"checklogin.jsp\">\n");
      out.write("                            <h3 class=\"login_heading\">Login</h3>\n");
      out.write("\n");
      out.write("                            <hr>\n");
      out.write("\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <label for=\"rollNum\" class=\"form-labels\">Roll Number</label>\n");
      out.write("                                <input type=\"text\" name=\"roll_no.\" class=\"form-control form-group-members\" id=\"rollNume\" placeholder=\"Roll Number\" required=\"\" pattern=\"[0-9]{9}\" maxlength=\"9\">\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <label for=\"exampleInputPassword1\" class=\"form-labels\">Password</label>\n");
      out.write("                                <input type=\"password\" name=\"password\" class=\"form-control form-group-members\" id=\"exampleInputPassword1\" placeholder=\"Password\" required=\"\" pattern=\"[0-9a-zA-Z]{6,10}\">\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"checkbox\">\n");
      out.write("                                <label>\n");
      out.write("                                    <input type=\"checkbox\" id=\"remeberme\">Remember Me\n");
      out.write("                                </label>\n");
      out.write("                            </div>\n");
      out.write("                            <p class=\"form-control\">Not a user? <a href=\"register.jsp\">Sign Up</a></p>\n");
      out.write("\n");
      out.write("                            <button type=\"submit\" class=\"btn btn-default\">Login</button>\n");
      out.write("                        </form>\n");
      out.write("      \n");
      out.write("                 \n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\t\t</div>\n");
      out.write("\n");
      out.write("\t\t<div class=\"Bottom\">\n");
      out.write("\t\t\t<p>All Rights Reserved  R.S Dry Clean</p>\n");
      out.write("\t\t</div>\n");
      out.write("\t</div>\n");
      out.write("</body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
