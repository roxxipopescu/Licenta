<%@ page import="com.dao.OrderDao" %>
<%@ page import="com.model.Order" %>
<%@ page import="com.dao.MenuDao" %>
<%@ page import="com.model.Menu" %>
<%@ page import="com.dao.RestaurantTablesDao" %>
<%@ page import="com.model.RestaurantTables" %>
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
  }
  else if( !session.getAttribute("role").equals("waiter")){
      response.sendRedirect("index.html");}
  else user = (String) session.getAttribute("user");
  String userName = null;
  String sessionID = null;
  Cookie[] cookies = request.getCookies();
  if(cookies !=null){
    for(Cookie cookie : cookies){
      if(cookie.getName().equals("user")) userName = cookie.getValue();
      if(cookie.getName().equals("JSESSIONID")) sessionID = cookie.getValue();
    }
  }

  RestaurantTables t = (RestaurantTables)request.getSession().getAttribute("tableToBeServed");
  
  
  int currentUserId = (int) session.getAttribute("id");
  OrderDao orderDao = new OrderDao(new Configuration().configure().buildSessionFactory());
  List<Order> myList = null;
  myList = orderDao.findOrders();
  if (!myList.isEmpty()){
  Order a = myList.get(0);}
  MenuDao menuDao = new MenuDao(new Configuration().configure().buildSessionFactory());
  List<Menu> myMenuList = null;
  myMenuList = menuDao.findMenuItems();
  Menu m = myMenuList.get(0);
  RestaurantTablesDao rtDao = new RestaurantTablesDao(new Configuration().configure().buildSessionFactory());
  List<RestaurantTables> myrtList = null;
  myrtList = rtDao.findRestaurantTables();
  
  String buttState="";
  
  if (t.getState().equals("reserved"))
	  buttState="Free table";
  else
	  buttState="Reserve this table";
  
  %>
 
<h2 align="center" >Table no. <%=t.getId() %> </h2>

<div class="row">
<div class="col-md-12 ">
<div class="col-md-6 text-left">
<form method="post"  action="crud_order">
	<input type="hidden" name="idTable" value="<%=t.getId() %>" />
   <input type="submit" value="<%=buttState %>" id="resButton" class="btn btn-primary" name="reserve_table"  >  
   </form>
   </div>
   <div class="col-md-6 text-right">
    <input type="submit" class="btn btn-primary" value="Back" id="backt" onclick="location.href = 'http://localhost:8080/RestaurantManager/User.jsp'; " >
  </div>
  </div>
  </div>
 
 
<form method="post"  action="crud_order">
<div class="span7 text-center">
<h4>Quantity:</h4>
<input type="number" min="1" max="20" step="1" id="qtyt"  name="quantity" value="1" />
<h4>Dish/Beverage:</h4>
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
<h4>Specifications:</h4>
<input type="text" name="specifications" style="text-align:center;" value="none">
<h4>Fidelity card discount:</h4>
<input type="number" min="0" max="100" step="1" id="nbt"  name="fidelitycarddiscount" value="0" /> %
<br/><br/>
<input type="hidden" name="idUser" value="<%=currentUserId %>" />
<input type="hidden" name="idTable" value="<%=t.getId() %>" />
<input type="submit"  class="btn btn-primary" name="add_order" id="addt" value="Add">
</div>
</form>
<br/><br/>

<form method="post"  action="crud_order">
<div class="row">
<div class="col-md-12 ">
<div class="col-md-6 text-left">
<input type="hidden" name="idUser" value="<%=currentUserId %>" />
<input type="hidden" name="idTable" value="<%=t.getId() %>">
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
         <th>Dish/Beverage</th>
          <th>Specifications</th>
          <th>Fidelity card discount</th>
          <th>Actions</th>
        </tr>
		 </thead>
        <tbody>
        <%
        if (!myList.isEmpty()) {
            for (Order myorder : myList) {
            	if (myorder.getTableId()==t.getId())
            	{
        %>
         <TR>
         <TD> <%= myorder.getQuantity()%>  </TD>
            <TD> <%= myorder.getDish()%>  </TD>
            <TD>	<%= myorder.getSpecifications()%>  </TD>
           <TD><%= myorder.getFidelityCardDiscount()%> % </TD>
            
          
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
         <%}
            }
        }
        %>
        </tbody>
         </table>
    </div>
   </div>
   
   <br/>
    <div class="row">
   <div class="col-md-12 text-center">
  
    </div>
    </div>

</body>
</html>