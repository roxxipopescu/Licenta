<%@ page import="com.dao.UserDao" %>
<%@ page import="com.model.User" %>
<%@ page import="org.hibernate.cfg.Configuration" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit order</title>
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/font.css">
    <link rel='shortcut icon' href='favicon/favicon.ico' type='image/x-icon' >   
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
  
  String imaj="";
  int height=0;
  int width=0;
  
  User a = (User)request.getSession().getAttribute("toBeUpdated");
  
  if (a.getRole().equals("waiter"))
	  {imaj="images/waiter.png";
	  height=200;
	  width=180;
	  }
  else if (a.getRole().equals("chef"))
	  {imaj="images/cheficon.png";
	  height=200;
	  width=180;
	  }
  else if (a.getRole().equals("admin"))
	  {imaj="images/ceo.png";
	  height=200;
	  width=180;
	  }
	
  List<String> roles = Arrays.asList("waiter", "chef", "admin");
  
  
%>

<div class="span7 text-center">
<h2>Edit employee: <%=a.getFirstName() %> <%= a.getLastName() %>  </h2>

</div>
<div class="row">
<div class="col-md-12 ">
<div class="col-md-6 text-left">
   </div>
   <div class="col-md-6 text-right">
    <input type="submit" class="btn btn-primary" value="Back" id="back" onclick="location.href = 'http://localhost:8080/RestaurantManager/Admin.jsp'; " >
  </div>
  </div>
  </div>
  <div class="col-md-12 text-center ">
  <img src="<%=imaj%>" height="<%=height %>" width="<%=width %>">
</div>
  <br/>
 <form method="post"  action="update_employee">
 <div class="col-md-12">
<div class="col-md-6 text-center">
<h4>Name:</h4>
<input type="text" style="text-align:center;" name="name" size="17" value="<%=a.getFirstName() %>">
<h4>Surame:</h4>
<input type="text" style="text-align:center;" name="surname" size="17" value="<%=a.getLastName() %>">
<h4>Role:</h4>
<select name="role" id="dropd" style="width: 143px; height: 26px;"  >
<%
	for (int i=0; i<3; i++)
	{ 
		if (a.getRole().equals(roles.get(i)))
			{	
%>
		<option selected><%=a.getRole() %></option>	
		<%}
		else {
		%>	
		 <option><%=roles.get(i) %></option>
				
<%
			}
	}
%>
</select>

<h4>Birthdate:</h4>
<input type="date" style="width: 143px; text-align:center;" name="birthdate"  value="<%=a.getBirthdate() %>">
</div>
<div class="col-md-6 text-center">
<h4>Username:</h4>
<input type="text" style="text-align:center;" name="username" size="17" value="<%=a.getUserName() %>">
<h4>Password:</h4>
<input type="text" style="text-align:center;" name="password" size="17" value="<%=a.getPassword() %>">
<h4>Telephone:</h4>
<input type="text" style="text-align:center;" name="telephone" size="17" value="<%=a.getTelephone() %>">
<h4>Contract Number:</h4>
<input type="text" style="text-align:center;" name="contractnb" size="17" value="<%=a.getContractnb() %>">
</div>
</div>

<br/>
<div class="col-md-12 text-center">
 <input type="submit"  class="btn btn-primary" name="update_final" value="Update" onclick="return confirm('User has been updated!');">
</div>
 </form>

</body>
</html>