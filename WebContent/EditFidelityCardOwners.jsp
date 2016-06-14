<%@ page import="org.hibernate.cfg.Configuration" %>
<%@ page import="java.util.List" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.model.FidelityCards" %>
<%@ page import="com.dao.FidelityCardsDao" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Fidelity Card Owners</title>
<link rel="stylesheet" href="bootstrap.min.css">
    <script src="bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/RestaurantManager/font.css">
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
  
  FidelityCardsDao fcDao = new FidelityCardsDao(new Configuration().configure().buildSessionFactory());
  List<FidelityCards> myList = null;
  myList = fcDao.findFidelityCards();
  if(!myList.isEmpty()){
  FidelityCards i = myList.get(0);
  }
  
  FidelityCards f = (FidelityCards)request.getSession().getAttribute("toBeUpdated");
  
  %>


<div class="span7 text-center">
<h2>Edit member: <%= f.getName() %> <%= f.getSurname() %>  </h2>

<div class="row">
<div class="col-md-12 ">
<div class="col-md-6 text-left">
   </div>
   <div class="col-md-6 text-right">
    <input type="submit" class="btn btn-primary" value="Back" id="back" onclick="location.href = 'http://localhost:8080/RestaurantManager/FidelityCardOwners.jsp'; " >
  </div>
  </div>
  </div>

<br/><br/>

 <form method="post"  action="edit_fidelitycard">
<h4>Name:</h4>
<input type="text" name="name"  value="<%=f.getName() %>">
<h4>Surname:</h4>
<input type="text" name="surname"  value="<%=f.getSurname() %>">
<h4>Birth date:</h4>
 <input type="date" name="bday" value="<%=f.getBirthdate() %>" />
<h4>Email:</h4>
<input type="email" name="email"  value="<%=f.getEmail() %>">

<br/><br/><br/>
<div class="col-md-12 text-center">
<input type="submit"  class="btn btn-primary" name="update_fcard" value="Update" onclick="return confirm('Member was updated!');">
</div>
</form>
</div>



</body>
</html>