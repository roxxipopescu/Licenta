<%@ page import="com.dao.OrderDao" %>
<%@ page import="com.model.Order" %>
<%@ page import="com.model.Chef" %>
<%@ page import="com.dao.ChefDao" %>
<%@ page import="com.dao.UserDao" %>
<%@ page import="com.model.User" %>
<%@ page import="org.hibernate.cfg.Configuration" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
#center{	
	vertical-align: middle;
	padding-left:10px;
}
#nb{
	text-align: center;
}
</style>
<title>Chef Page</title>
	<link rel="stylesheet" href="bootstrap.min.css">
    <script src="bootstrap.min.js"></script>   
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/RestaurantManager/font.css">
    <link rel='shortcut icon' href='favicon.ico' type='image/x-icon' >
   <link rel="stylesheet" type="text/css" href="/RestaurantManager/smallTable.css">
</head>
<body background="bkg.jpg">
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
  
  UserDao userDao = new UserDao(new Configuration().configure().buildSessionFactory());
  List<User> myList = null;
  myList = userDao.findUsers();
  int myChefId=0;
  
  for (User currentUser : myList){
	  if (currentUser.getUserName().equals(userName))
		  myChefId = currentUser.getId();
  }
  
  ChefDao chefDao = new ChefDao(new Configuration().configure().buildSessionFactory());
  List<Chef> myChefList = null;
  myChefList = chefDao.findChefs();
  if (!myChefList.isEmpty()){
  Chef c = myChefList.get(0);}
  
  
%>
<div class="span7 text-center">
<h3>Welcome <%=userName %> to your chef page.</h3>
</div>
<div class="row">
<div class="col-md-12">
<div class="col-md-1 text-left">   
      
</div>

<div class="col-md-11 text-right">
 <form action="LogoutServlet" method="post">
    <input type="submit" value="Logout" class="btn btn-danger ">
  </form>
</div>
 
</div>
</div>

<br/><br/>

<br/><br/>
<div class="col-md-12 text-center">
<h4>Pending orders</h4>
</div>
<br/><br/><br/>
<div class="row">
<div class="col-md-12">
<div class="col-md-2">
</div>
<div class="col-md-8">
  <table class="table" border="3">
        <thead>
        <tr>    
        <th>Timer</th>    
        <th>Table id</th>
        <th>Waiter name</th>
        <th>Quantity</th>  
        <th>Dish</th>      
        <th>Order placement time</th>
        <th>Preparation time</th>
        <th>Actions</th>
        </tr>
		 </thead>
		 <tbody>
		 <%
        if (!myChefList.isEmpty()) {
            for (Chef mychef : myChefList) {
            	           
        %>
		 <tr>			
		 <td><span id="countdown"></span> <br/> <span id="notifier">minutes</span></td>	  
		  <td><%= mychef.getTableId() %> </td>
		  <td><%= mychef.getWaiterName() %></td>
		  <td><%= mychef.getQuantity() %></td>
		  <td><%= mychef.getDish() %></td>		  
		  <td><%= mychef.getTime() %></td>
		  <td class="center"><input type="number" min="0" max="100" step="1" id="nb"  name="prepTime" value="1" /> min(s)</td>
		  <td><div class="btn btn-link" id="send_timer" >Start timer</div>
              <form method="post" action="chef_ops">
                    <input type="hidden" name="id" value="<%= mychef.getId() %>" />
                    <input type="hidden" name="chefUserId" value="<%= myChefId %>" />
                    <input type="submit" class="btn btn-link" name="delete" value="Order served" onclick="return confirm('This order has been delivered!');">
                </form>
		  </td>
		  </tr>
		  <%
            }
        }
		  %>
		 </tbody>
		 
  </table>
</div>
</div>
</div>
<br/><br/>
<script src="timer.js"></script>
</body>
</html>