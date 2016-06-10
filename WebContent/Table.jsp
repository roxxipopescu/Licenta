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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Table Service</title>
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
%>

<%
  int currentUserId = (int) session.getAttribute("id");
  OrderDao orderDao = new OrderDao(new Configuration().configure().buildSessionFactory());
  List<Order> myList = null;
  myList = orderDao.findOrders();
  Order a = myList.get(0);
  MenuDao menuDao = new MenuDao(new Configuration().configure().buildSessionFactory());
  List<Menu> myMenuList = null;
  myMenuList = menuDao.findMenuItems();
  Menu m = myMenuList.get(0);
  
  %>
 
<form method="post"  action="crud_order">
<h2 align="center" >Table no. 1 </h2>

<div class="col-md-12 text-right">
    <input type="submit" value="Reserve this table" class="btn btn-primary" onclick="">  
  </div>
 
 
<br/><br/>
<div class="span7 text-center">
<h4>Dish:</h4>
<input list="dishes" name="dishname" type="text" >
<datalist id="dishes">
<%
   for (Menu mymenu : myMenuList) {
%>
    <option value="<%=mymenu.getDish() %>"/>
  <%
  } 
  %> 
</datalist>
<h4>Quantity:</h4>
<input type="text" name="quantity">
<h4>Specifications:</h4>
<input type="text" name="specifications">
<h4>Fidelity card discount:</h4>
<input type="text" name="fidelitycarddiscount">
<br/><br/>
<input type="hidden" name="idUser" value="<%=currentUserId %>" />
<input type="submit"  class="btn btn-primary" name="add_order" value="Add">
</div>
</form>
<br/><br/>

<form method="post"  action="crud_order">
<div class="row">
<div class="col-md-12 ">
<div class="col-md-6 text-left">
  <input type="submit" value="Close Order" class="btn btn-danger" name="close_order" onclick="return confirm('Are you sure you want to close current order?');">  
</div>
<div class="col-md-6 text-right">
   <input type="submit" class="btn btn-danger" name="place_order" value="Place Order" onclick="return confirm('Order has been placed!');" >
    </div>
</div>
</div>
</form>
    
<br/>

<div class="row">
 <div class="col-md-12">
    <table class="table" border="5">
        <thead>
        <tr>
        <th>Quantity</th>
         <th>Dish</th>
          <th>Specifications</th>
          <th>Fidelity card no. & Discount</th>
          <th>Actions</th>
        </tr>
		 </thead>
        <tbody>
        <%
            for (Order myorder : myList) {
        %>
         <TR>
         <TD> <%= myorder.getQuantity()%>  </TD>
            <TD> <%= myorder.getDish()%>  </TD>
            <TD>	<%= myorder.getSpecifications()%>  </TD>
           <TD><%= myorder.getFidelityCardDiscount()%> </TD>
            
          
        <td> <form method="post" action="crud_order">
                    <input type="hidden" name="id" value="<%=myorder.getId() %>" />
                    <input type="submit" class="btn btn-link" name="update_order" value="Update">
                </form>
                <form method="post" action="crud_order">
                    <input type="hidden" name="id" value="<%=myorder.getId() %>" />
                    <input type="submit" class="btn btn-link" name="delete_order"  value="Delete" onclick="return confirm('Are you sure you want to delete this item?');" >
                </form>
        </td>
        </tr>
         <%
            }
        %>
        </tbody>
         </table>
    </div>
   </div>
   
   <br/>
    <div class="row">
   <div class="col-md-12 text-center">
   <input type="submit" class="btn btn-default" value="Back" onclick="location.href = 'http://localhost:8080/RestaurantManager/User.jsp'; " >
    </div>
    </div>
    
</body>
</html>