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
  
  FidelityCardsDao fcDao = new FidelityCardsDao(new Configuration().configure().buildSessionFactory());
  List<FidelityCards> myList = null;
  myList = fcDao.findFidelityCards();
  if(!myList.isEmpty()){
  FidelityCards i = myList.get(0);
  }
    
  %>

<br/>
<h3 align = "center">Fidelity Card Owners</h3>

<div class="row">
<div class="col-md-12 ">
<div class="col-md-6 text-left">
   </div>
   <div class="col-md-6 text-right">
    <input type="submit" class="btn btn-primary" value="Back" id="back" onclick="goBack()" >
  </div>
  </div>
  </div>


<div class="span7 text-center">
 <input type="submit" class="btn btn-primary"  value="Send invitations " onclick="window.location = 'http://localhost:8080/RestaurantManager/SendInvitations.jsp';">
 </div>
 <br/>
<div class="row">
<div class="col-md-2">
</div>
 <div class="col-md-8 ">
    <table class="table" align="center" border="3">
        <thead>
        <tr>
        <th>Card id</th>
        <th>Name</th>
        <th>Surname</th>
        <th>Birth date</th>
        <th>Email Address</th>
        <th>Actions</th>
        </tr>
		 </thead>
        <tbody>
        <%
        for (FidelityCards fcards : myList)
        {        	        
        %>        
        <tr>
        <td> <%=fcards.getId() %></td>
        <td> <%=fcards.getName() %></td>
        <td> <%=fcards.getSurname() %></td>
        <td> <%=fcards.getBirthdate() %></td>
        <td> <%=fcards.getEmail() %></td>
        <td> <div class="row">
        <div class="col-md-5">
        <div class="col-md-1 text-left">
     		<form method="post" action="crud_fclient">
                 <input type="hidden" name="idf" value="<%=fcards.getId()%>" />
                 <input type="submit" class="btn btn-link" name="update_fclient" value="Update">
             </form>
             </div>
               <div class="col-md-3">               
               </div>
             <div class="col-md-1 text-right">
             <form method="post" action="crud_fclient">
                 <input type="hidden" name="idf" value="<%=fcards.getId()%>"/>
                 <input type="submit" class="btn btn-link" name="delete_fclient"  value="Delete" onclick="return confirm('Member will be deleted!');" >
             </form>   
             </div>
             </div>    
             </div>     
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
   
 
   
<form method="post" action="crud_fclient">  
   <div class = "row">
   <div class="col-md-4 text-right">  
   <h4 id="namef">Name:</h4>
    <input type="text" name="name" />
   <h4 id="surnamef">Surame:</h4>
    <input type="text" name="surname" />
    </div>
     <div class="col-md-3 text-right ">
   <h4 id="bdayf">Birth date:</h4>
    <input id="bdf"  type="date" name="bday" />
   <h4 id="emailf">Email address:</h4>
    <input id="email2f" type="email" name="email" /> 
    </div>
     <div class="col-md-4 text-left">   
    
    <input type="submit" id="buttf" class="btn btn-primary" name="add_fclient" value="Add new member">
    </div>
   </div>
</form>
  
<script>
function goBack() {
    window.history.back();
}
</script>
</body>
</html>