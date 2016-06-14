<%@ page import="com.dao.OrderDao" %>
<%@ page import="com.model.Order" %>
<%@ page import="com.dao.MenuDao" %>
<%@ page import="com.model.Menu" %>
<%@ page import="org.hibernate.cfg.Configuration" %>
<%@ page import="java.util.List" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
#dropd {
height: 28px;
width: 175px;
}
input {
text-align: center;
}
</style>
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
  
  Order a = (Order)request.getSession().getAttribute("toBeUpdated");
  
  MenuDao menuDao = new MenuDao(new Configuration().configure().buildSessionFactory());
  List<Menu> myMenuList = null;
  myMenuList = menuDao.findMenuItems();
  Menu m = myMenuList.get(0);
%>



<div class="span7 text-center">
<h2>Edit order: <%= a.getDish() %>  </h2>

<div class="row">
<div class="col-md-12 ">
<div class="col-md-6 text-left">
   </div>
   <div class="col-md-6 text-right">
    <input type="submit" class="btn btn-primary" value="Back" id="back" onclick="location.href = 'http://localhost:8080/RestaurantManager/Table.jsp'; " >
  </div>
  </div>
  </div>

<br/><br/>

 <form method="post"  action="edit_order">
<h4>Quantity:</h4>
<input type="text" name="quantity"  value="<%=a.getQuantity() %>">
<h4>Dish:</h4>
<select name="dish" id="dropd" >
<%
   for (Menu mymenu : myMenuList) {
	   if (mymenu.getDish().equals(a.getDish()))
	   {
%>
	<option selected><%=mymenu.getDish() %></option>
	<% 
	   } 
	   else{
	%>	
    <option><%=mymenu.getDish() %></option>
  <%
  } }
  %> 
</select>


<h4>Specifications:</h4>
<input type="text" name="specifications"  value="<%=a.getSpecifications() %>">
<h4>Fidelity Card Discount:</h4>
<input type="text" name="fidelitycarddiscount"  value="<%=a.getFidelityCardDiscount() %>">


<br/><br/><br/>
<div class="col-md-12 text-center">
<input type="submit"  class="btn btn-primary" name="update_final" value="Update" onclick="return confirm('Order was updated!');">
</div>
</form>
</div>

</body>
</html>