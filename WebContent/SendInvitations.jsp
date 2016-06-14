<%@ page import="org.hibernate.cfg.Configuration" %>
<%@ page import="java.util.List" %>
<%@ page import= "com.google.api.services.calendar.Calendar"%>
<%@ page import= "com.google.api.services.calendar.model.Event"%>
<%@ page import= "com.google.api.services.calendar.model.Events"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.model.FidelityCards" %>
<%@ page import="com.dao.FidelityCardsDao" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Email Invitations</title>
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/font.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
	<script src="javascript/jquery.googlecalreader-1.1.min.js"></script>
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

<h3 align = "center">Event Invitation</h3>
<br/>
<div class="row">
<div class="col-md-12 ">
<div class="col-md-6 text-left">
   </div>
   <div class="col-md-6 text-right">
    <input type="submit" class="btn btn-primary" value="Back" id="back" onclick="goBack()" >
  </div>
  </div>
  </div>

<br/><br/><br/>

<script src="javascript/getgoogleevents.js"></script>
<script src='https://apis.google.com/js/client.js?onload=handleClientLoad'></script>
<!--  
<div id='content'>
    <h1 id='calendar' style="color:grey">LOADING . . . .</h1>
    <ul id='events'></ul>
    </div>
    <p id='updated' style="font-size:12; color:grey">updating . . . . .</p>
    -->

<br/><br/>
<form method="post" action="sendInvitation" >
 <div class = "row">
   <div class="col-md-3 text-center">
   <h4>Event name:</h4>
    <input type="text" name="eventName" />
    </div>
    <div class="col-md-3 text-center ">
   <h4>Date:</h4>
    <input type="date" name="eventDate" />
    </div>
     <div class="col-md-3 text-center ">
   <h4>Starting hour:</h4>
    <input type="time" name="eventTime"  >
    </div>
    <div class="col-md-3 text-center ">
   <h4>Description:</h4>
   <textarea name="eventDescription" rows="3" cols="25">
   </textarea>
    </div>
    </div>
    <br/><br/><br/><br/>
    <div class="span7 text-center">
     <input type="submit" class="btn btn-primary" name="send_email" value="Send invitaion" onclick="return confirm('Invitation sent!');">
     </div>
   <br/><br/><br/>
   <div class="row">
    <div class="col-md-5 text-center ">
    </div>
    <div class="col-md-5  " id="da">
   
    <% for (FidelityCards fc : myList){   
    %>
	<input type="checkbox" id="list" name="emails" value="<%=fc.getEmail() %>"> <%=fc.getEmail() %><br>	
	<%} %>
	
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