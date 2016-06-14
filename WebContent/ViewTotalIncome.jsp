<%@ page import="com.model.User" %>
<%@ page import="com.dao.UserDao" %>
<%@ page import="com.model.Income" %>
<%@ page import="com.dao.IncomeDao" %>
<%@ page import="org.hibernate.cfg.Configuration" %>
<%@ page import="java.util.List" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Restaurant's Income</title>
	<link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/font.css">
    <link rel='shortcut icon' href='favicon/favicon.ico' type='image/x-icon' >
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
  
  IncomeDao incomeDao = new IncomeDao(new Configuration().configure().buildSessionFactory());
  List<Income> myList = null;
  myList = incomeDao.findIncomes();
  if(!myList.isEmpty()){
  Income i = myList.get(0);
  }
  
  UserDao userDao = new UserDao(new Configuration().configure().buildSessionFactory());
  List<User> myuList = null;
  myuList = userDao.findUsers();
  String uName="";
  double sum=0.0;
  
  for (Income myincome : myList) {
  	sum=sum+myincome.getOrderTotalCost();
  }
 %>

<h2 align="center">Restaurant finances</h2>
<br/>

<div class="row">
<div class="col-md-12 ">
<div class="col-md-6 text-left">
   </div>
   <div class="col-md-6 text-right">
    <input type="submit" class="btn btn-primary" value="Back" id="back" onclick="location.href = 'http://localhost:8080/RestaurantManager/Admin.jsp'; " >
  </div>
  </div>
  </div>


<div class="row">
<div class="col-md-3">
</div>
 <div class="col-md-6"  align="center">
 
 <h3>Total: <%=sum %>$</h3>
 <br/>
    <table class="table" align="center" border="3">
        <thead>
        <tr>
        <th>Date</th>
        <th>Employees</th>       
        <th>Cost</th>       
        </tr>
		 </thead>
        <tbody>
        <% for (Income myincome : myList) {
        	
        %>
        <tr>
        <td><%=myincome.getDate() %></td>     
        <% for (User u : myuList)
        {
        	if (u.getId()==myincome.getWaiterId())
        		uName=u.getFirstName() +" " + u.getLastName();
        }
        %>         
        <td><%=uName %></td>
       
        <td><%=myincome.getOrderTotalCost() %> $</td>
       
        </tr>       
        <%
            }
        %>
        </tbody>
         </table>
    </div>
   
    </div>
 



</body>
</html>