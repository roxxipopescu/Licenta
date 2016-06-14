<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add new employee</title>
<link rel="stylesheet" href="bootstrap.min.css">
    <script src="bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/RestaurantManager/font.css">
    <link rel='shortcut icon' href='favicon.ico' type='image/x-icon' >
   <link rel="stylesheet" type="text/css" href="/RestaurantManager/smallTable.css">
</head>
</head>
<body background="dada.png">
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
 <script type="text/javascript">

window.onunload = refreshParent;
function refreshParent() {
    window.opener.location.reload();
}

function closeSelf(){
    self.close();
    return true;
}
</script>
 
 <br/>
  <form method="post"  action="crud_employer" onsubmit="return closeSelf()">
<div class="col-md-12">
<div class="col-md-6 text-center">
<h4>Name:</h4>
<input type="text" name="name" size="17">
<h4>Surame:</h4>
<input type="text" name="surname" size="17">
<h4>Role:</h4>
<input list="roles" name="role" type="text" size="17">
<datalist id="roles">
    <option value="chef"/>
    <option value="waiter"/>
    <option value="admin"/>   
</datalist>
<h4>Birthdate:</h4>
<input type="date" name="birthdate" >
</div>
<div class="col-md-6 text-center">
<h4>Username:</h4>
<input type="text" name="username" size="17">
<h4>Password:</h4>
<input type="text" name="password" size="17">
<h4>Telephone:</h4>
<input type="text" name="telephone" size="17">
<h4>Contract Number:</h4>
<input type="text" name="contractnb" size="17">
</div>
</div>
<br/>
<div class="col-md-12 text-center">
<input type="submit"  class="btn btn-primary" name="add_employer" value="Add" >
</div>
</form> 




</body>
</html>