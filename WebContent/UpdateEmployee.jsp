<%@ page import="com.dao.UserDao" %>
<%@ page import="com.model.User" %>
<%@ page import="org.hibernate.cfg.Configuration" %>
<%@ page import="java.util.List" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit order</title>
	<link rel="stylesheet" href="bootstrap.min.css">
    <script src="bootstrap.min.js"></script>
    <link rel='shortcut icon' href='favicon.ico' type='image/x-icon' >   
</head>
<body background="bkg.jpg">
<br/>
<%
  String user = null;
  if(session.getAttribute("user") == null){
    response.sendRedirect("index.html");
  }else user = (String) session.getAttribute("user");
  String userName = null;
  String sessionID = null;
  Cookie[] cookies = request.getCookies();
  if(cookies !=null){
    for(Cookie cookie : cookies){
      if(cookie.getName().equals("user")) userName = cookie.getValue();
      if(cookie.getName().equals("JSESSIONID")) sessionID = cookie.getValue();
    }
  }
  
  User a = (User)request.getSession().getAttribute("toBeUpdated");
%>


 <form method="post"  action="update_employee">
 <div class="col-md-12">
<div class="col-md-6 text-center">
<h4>Name:</h4>
<input type="text" name="name" size="17" value="<%=a.getFirstName() %>">
<h4>Surame:</h4>
<input type="text" name="surname" size="17" value="<%=a.getLastName() %>">
<h4>Role:</h4>
<input list="roles" name="role" type="text" size="17" value="<%=a.getRole() %>">
<datalist id="roles">
    <option value="chef"/>
    <option value="waiter"/>
    <option value="admin"/>   
</datalist>
<h4>Birthdate:</h4>
<input type="date" name="birthdate"  value="<%=a.getBirthdate() %>">
</div>
<div class="col-md-6 text-center">
<h4>Username:</h4>
<input type="text" name="username" size="17" value="<%=a.getUserName() %>">
<h4>Password:</h4>
<input type="text" name="password" size="17" value="<%=a.getPassword() %>">
<h4>Telephone:</h4>
<input type="text" name="telephone" size="17" value="<%=a.getTelephone() %>">
<h4>Contract Number:</h4>
<input type="text" name="contractnb" size="17" value="<%=a.getContractnb() %>">
</div>
</div>
<br/>
<div class="col-md-12 text-center">
 <input type="submit"  class="btn btn-primary" name="update_final" value="Update" onclick="return confirm('User has been updated!');">
 </div>
 </form>
</body>
</html>