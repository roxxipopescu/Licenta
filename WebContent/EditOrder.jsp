<%@ page import="com.dao.OrderDao" %>
<%@ page import="com.model.Order" %>
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
  
  Order a = (Order)request.getSession().getAttribute("toBeUpdated");
%>

<h1>Edit order: <%= a.getDish() %>  </h1>

 <form method="post"  action="edit_order">

<div class="col-md-6 text-center">
<h4>Quantity:</h4>
<input type="text" name="quantity"  value="<%=a.getQuantity() %>">
<h4>Dish:</h4>
<input type="text" name="dish"  value="<%=a.getDish() %>">
<h4>Specifications:</h4>
<input type="text" name="specifications"  value="<%=a.getSpecifications() %>">
<h4>Fidelity Card Discount:</h4>
<input type="text" name="fidelitycarddiscount"  value="<%=a.getFidelityCardDiscount() %>">
</div>

<br/>
<div class="col-md-12 text-center">
<input type="submit"  class="btn btn-primary" name="update_final" value="Update" onclick="return confirm('Order was updated!');">
</div>
</form>

</body>
</html>