<%@ page import="org.hibernate.cfg.Configuration" %>
<%@ page import="java.util.List" %>
<%@ page import="com.dao.RestaurantTablesDao" %>
<%@ page import="com.model.RestaurantTables" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Waiter Page</title>
	<link rel="stylesheet" href="bootstrap.min.css">
    <script src="bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/RestaurantManager/font.css">
    <link rel='shortcut icon' href='favicon.ico' type='image/x-icon' >
   <link rel="stylesheet" type="text/css" href="/RestaurantManager/smallTable.css">
</head>
<body background="Untitled.png">
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
  
  RestaurantTablesDao rtDao = new RestaurantTablesDao(new Configuration().configure().buildSessionFactory());
  List<RestaurantTables> myrtList = null;
  myrtList = rtDao.findRestaurantTables();
   
  
%>
<div class="span7 text-center">
<h3>Welcome <%=userName %> to your waiter page.</h3>
</div>
<br/><br/>
<div class="row">
<div class="col-md-12">
<div class="col-md-1 text-right">     
    <input type="submit" value="Fidelity Card Owners" class="btn btn-primary" onclick="window.location = 'http://localhost:8080/RestaurantManager/FidelityCardOwners.jsp';"> 
</div>

<div class="col-md-11 text-right">
 <form action="LogoutServlet" method="post">
    <input type="submit" value="Logout" class="btn btn-danger ">
  </form>
</div>
 
</div>
</div>

<br/><br/>
<br/>

<div class="row">

<div class="col-md-4 text-center">
<% if  (myrtList.get(0).getState().equals("free"))
	{	
%>
		<img src="one.png" id="one">
	<%}
   else  if  (myrtList.get(0).getState().equals("reserved")){
%>
		<img src="onered.png" id="one">
	<%}
%>
<div class="seat">
<img  src="seat.png" >
</div>

<div class="smalltable">
<form method="post"  action="assign_tables">
<input type="hidden" name="tablenb" value="<%= myrtList.get(0).getId() %>">
<input type="image"  src="smallT.png" alt="Submit" >
</form>
</div>

<div class="seat">
<img src="seat2.png" >
</div>
</div>

<div class="col-md-4 text-center">
<% if  (myrtList.get(1).getState().equals("free"))
	{	
%>
		<img src="2.png" id="two">
	<%}
   else  if  (myrtList.get(1).getState().equals("reserved")){
%>
		<img src="2red.png" id="two">
	<%}
%>
<div class="seat"> 
<img src="seat.png" >
</div>

<div class="row">

<div class="col-md-4 text-right ">
<div class="seat3">
<img src="seat3.png" >
</div>
</div>
<div class="col-md-4 text-center">
<div class="smallt">
<form method="post" action="assign_tables">
<input type="hidden" name="tablenb" value="<%= myrtList.get(1).getId() %>">
<input type="image"  src="smallT.png" alt="Submit" >
</form>
</div>
</div>
<div class="col-md-4 ">
<div class="seat4">
<img src="seat4.png" >

</div>
</div>

</div>

<div class="seat">
<img src="seat2.png" >
</div>
</div>

<div class="col-md-4 text-center">
<% if  (myrtList.get(2).getState().equals("free"))
	{	
%>
		<img src="3.png" id="three">
	<%}
   else  if  (myrtList.get(2).getState().equals("reserved")){
%>
		<img src="3red.png" id="three">
	<%}
%>
<div class="seat">
<img src="seat.png" >
</div>

<div class="smalltable">
<form method="post" action="assign_tables">
<input type="hidden" name="tablenb" value="<%= myrtList.get(2).getId() %>">
<input type="image"  src="smallT.png" alt="Submit">
</form>
</div>

<div class="seat">
<img src="seat2.png">
</div>
</div>

</div>

<br/><br/><br/>

<div class="row">
<div class="col-md-6 text-center">

<div class="row">
<div class="col-md-4 text-center">

<div class="seatBigLeft">
<img src="seat.png">
</div>
</div>

<div class="col-md-4 text-center">
<% if  (myrtList.get(3).getState().equals("free"))
	{	
%>
		<img src="4.png" id="four" >
	<%}
   else  if  (myrtList.get(3).getState().equals("reserved")){
%>
		<img src="4red.png" id="four">
	<%}
%>
<div class="seat">
<img src="seat.png" >
</div>
</div>

<div class="col-md-4 text-center">
<div class="seatBigRight">
<img src="seat.png" >
</div>
</div>
</div>

<div class="bigtable">
<form method="post" action="assign_tables">
<input type="hidden" name="tablenb" value="<%= myrtList.get(3).getId() %>">
<input type="image"  src="bigTable.png" alt="Submit" >
</form>
</div>

<div class="row">
<div class="col-md-4 text-center">
<div class="seatBigLeft">
<img src="seat2.png" >
</div>
</div>

<div class="col-md-4 text-center">
<div class="seat">
<img src="seat2.png">
</div>
</div>

<div class="col-md-4 text-center">
<div class="seatBigRight">
<img src="seat2.png" >
</div>
</div>
</div>


</div>


<div class="col-md-6 text-center">
<% if  (myrtList.get(4).getState().equals("free"))
	{	
%>
		<img src="5.png" id="five">
	<%}
   else  if  (myrtList.get(4).getState().equals("reserved")){
%>
		<img src="5red.png" id="five">
	<%}
%>
<div class="seat">
<img src="seat.png" >
</div>

<div class="row">

<div class="col-md-4 text-right ">

<div class="seat3d">
<img src="seat3.png" >
</div>
</div>
<div class="col-md-4 text-center">
<div class="smallt">
<form method="post" action="assign_tables">
<input type="hidden" name="tablenb" value="<%= myrtList.get(4).getId() %>">
<input type="image"  src="smallT.png" alt="Submit">
</form>
</div>
</div>
<div class="col-md-4 ">
<div class="seat4d">
<img src="seat4.png" >
</div>
</div>

</div>

<div class="seat">
<img src="seat2.png">
</div>
</div>




</div>



<br/><br/>

</body>
</html>