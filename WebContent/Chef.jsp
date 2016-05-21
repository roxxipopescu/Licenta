<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Chef Page</title>
	<link rel="stylesheet" href="bootstrap.min.css">
    <script src="bootstrap.min.js"></script>
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
%>
<div class="span7 text-center">
<h3>Welcome <%=userName %> to your chef page.</h3>
</div>
<div class="span7 text-right">
 <form action="LogoutServlet" method="post">
    <input type="submit" value="Logout" class="btn btn-danger ">
  </form>
</div>
<br/><br/><br/><br/>

<div class="row">
<div class="col-md-4 text-center">
<div class="seat">
<form method = "post" action="SeatServlet"> 
<input type="image"  src="seat.png" alt="Submit">
</form>
</div>

<div class="smalltable">
<form method = "post" action="SmallTableServlet"> 
<input type="image" id="1" src="smallT.png" alt="Submit">
</form>
</div>

<div class="seat">
<form method = "post" action="SeatServlet"> 
<input type="image" src="seat2.png" alt="Submit">
</form>
</div>
</div>

<div class="col-md-4 text-center">
<div class="seat">
<form method = "post" action="SeatServlet"> 
<input type="image" src="seat.png" alt="Submit">
</form>
</div>

<div class="row">

<div class="col-md-4 text-right ">
<div class="seat3">
<form method = "post" action="SeatServlet"> 
<input type="image" src="seat3.png" alt="Submit">
</form>
</div>
</div>
<div class="col-md-4 text-center">
<div class="smallt">
<form method = "post" action="SmallTableServlet"> 
<input type="image" name="2" src="smallT.png" alt="Submit">
</form>
</div>
</div>
<div class="col-md-4 ">
<div class="seat4">
<form method = "post" action="SeatServlet"> 
<input type="image" src="seat4.png" alt="Submit">
</form>
</div>
</div>

</div>

<div class="seat">
<form method = "post" action="SeatServlet"> 
<input type="image" src="seat2.png" alt="Submit">
</form>
</div>
</div>

<div class="col-md-4 text-center">
<div class="seat">
<form method = "post" action="SeatServlet"> 
<input type="image" src="seat.png" alt="Submit">
</form>
</div>

<div class="smalltable">
<form method = "post" action="SmallTableServlet"> 
<input type="image" name="3" src="smallT.png" alt="Submit">
</form>
</div>

<div class="seat">
<form method = "post" action="SeatServlet"> 
<input type="image" src="seat2.png" alt="Submit">
</form>
</div>
</div>

</div>

<br/><br/><br/>

<div class="row">
<div class="col-md-6 text-center">

<div class="row">
<div class="col-md-4 text-center">
<div class="seatBigLeft">
<form method = "post" action="SeatServlet"> 
<input type="image" src="seat.png" alt="Submit">
</form>
</div>
</div>

<div class="col-md-4 text-center">
<div class="seat">
<form method = "post" action="SeatServlet"> 
<input type="image" src="seat.png" alt="Submit">
</form>
</div>
</div>

<div class="col-md-4 text-center">
<div class="seatBigRight">
<form method = "post" action="SeatServlet"> 
<input type="image" src="seat.png" alt="Submit">
</form>
</div>
</div>
</div>

<div class="bigtable">
<form method = "post" action="SmallTableServlet"> 
<input type="image" name="4" src="bigTable.png" alt="Submit">
</form>
</div>

<div class="row">
<div class="col-md-4 text-center">
<div class="seatBigLeft">
<form method = "post" action="SeatServlet"> 
<input type="image" src="seat2.png" alt="Submit">
</form>
</div>
</div>

<div class="col-md-4 text-center">
<div class="seat">
<form method = "post" action="SeatServlet"> 
<input type="image" src="seat2.png" alt="Submit">
</form>
</div>
</div>

<div class="col-md-4 text-center">
<div class="seatBigRight">
<form method = "post" action="SeatServlet"> 
<input type="image" src="seat2.png" alt="Submit">
</form>
</div>
</div>
</div>


</div>


<div class="col-md-6 text-center">

<div class="seat">
<form method = "post" action="SeatServlet"> 
<input type="image" src="seat.png" alt="Submit">
</form>
</div>

<div class="row">

<div class="col-md-4 text-right ">
<div class="seat3d">
<form method = "post" action="SeatServlet"> 
<input type="image" src="seat3.png" alt="Submit">
</form>
</div>
</div>
<div class="col-md-4 text-center">
<div class="smallt">
<form method = "post" action="SmallTableServlet"> 
<input type="image" name="5" src="smallT.png" alt="Submit">
</form>
</div>
</div>
<div class="col-md-4 ">
<div class="seat4d">
<form method = "post" action="SeatServlet"> 
<input type="image" src="seat4.png" alt="Submit">
</form>
</div>
</div>

</div>

<div class="seat">
<form method = "post" action="SeatServlet"> 
<input type="image" src="seat2.png" alt="Submit">
</form>
</div>
</div>





</div>

<br/><br/>

</body>
</html>