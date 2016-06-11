<%@ page import="com.model.User" %>
<%@ page import="com.model.Income" %>
<%@ page import="com.dao.IncomeDao" %>
<%@ page import="com.dao.OrderDao" %>
<%@ page import="com.model.Order" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="org.hibernate.cfg.Configuration" %>
<%@ page import="java.util.List" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee's income</title>
	<link rel="stylesheet" href="bootstrap.min.css">
    <script src="bootstrap.min.js"></script>
    <link rel='shortcut icon' href='favicon.ico' type='image/x-icon' >
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
  
  User a = (User)request.getSession().getAttribute("toViewIncome");
  
  IncomeDao incomeDao = new IncomeDao(new Configuration().configure().buildSessionFactory());
  List<Income> myList = null;
  myList = incomeDao.findIncomes();
  Income i = myList.get(0);
  
  OrderDao orderDao = new OrderDao(new Configuration().configure().buildSessionFactory());
  List<Order> myOrderList = null;
  myOrderList = orderDao.findOrders();
  Order o = myOrderList.get(0);
%>


<h3 align="center"><%=a.getFirstName() %>'s income from clients</h3>
<br/>	<br/><br/>

<div class="row">
<div class="col-md-3">
</div>
 <div class="col-md-6"  align="center">
    <table class="table" align="center" border="3">
        <thead>
        <tr>
        <th>Date</th>
        <th>Dishes</th>        
        <th>Check value</th>
        <th style="text-align:center">Actions</th>
        </tr>
		 </thead>
        <tbody>
        <% for (Income myincome : myList) 
        	if(myincome.getWaiterId()==a.getId())
        	{
        %>
        <tr>
        <td><%=myincome.getDate() %></td>
        
        <td>
        
        <%=myincome.getOrderedDishes() %> <br/>
        
        
         </td> 
        <td><%=myincome.getOrderTotalCost() %> $</td>
        <td style="text-align:center">        	            		  
                <form method="post" action="crud_history">
                    <input type="hidden" name="id" value="<%=myincome.getId() %>"/>
                    <input type="submit" class="btn btn-link" name="delete_history"  value="Delete" onclick="return confirm('Are you sure you want to delete this item?');" >
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
 

<br/><br/><br/>
   
   <div class="row">
   <div class="col-md-12 text-center">
   <input type="submit" class="btn btn-default" value="Back" onclick="location.href = 'http://localhost:8080/RestaurantManager/Admin.jsp'; " >
    </div>
    </div>


</body>
</html>