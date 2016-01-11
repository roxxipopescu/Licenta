<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Page</title>
	<link rel="stylesheet" href="bootstrap.min.css">
    <script src="bootstrap.min.js"></script>
    <link rel='shortcut icon' href='favicon.ico' type='image/x-icon' >
    <link href="http://addtocalendar.com/atc/1.5/atc-style-blue.css" rel="stylesheet" type="text/css">
</head>
<body >
<%
  String user = null;
  if(session.getAttribute("user") == null){
    response.sendRedirect("index.html");
  }

  else if(session.getAttribute("role").equals("user")){
    response.sendRedirect("index.html");

  }
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
%>
<h3 align="center">Welcome to the administrator page!</h3>
<div class="span7 text-right">
 <form action="LogoutServlet" method="post">
    <input type="submit" value="Logout" class="btn btn-danger ">
  </form>
</div>
<br/><br/>

<div class="row">
<div class="col-md-6">
<iframe src="https://calendar.google.com/calendar/embed?height=400&amp;wkst=2&amp;bgcolor=%23ffffff&amp;src=roxxi.popescu%40gmail.com&amp;color=%2329527A&amp;ctz=Europe%2FBucharest" style="border-width:0" width="650" height="400" frameborder="0" scrolling="no"></iframe>
</div>

 <div class="col-md-6 ">
 <h4>Employees table</h4>
    <table class="table" border="3">
        <thead>
        <tr>        
        <th>Name</th>
        <th>Address</th>
        <th>Birth date</th>  
        <th>Telephone</th>      
        <th>Contract no.</th>
        <th>Actions</th>
        </tr>
		 </thead>
        <tbody>
        <tr>
        <td>Peter Timber</td>
        <td>Southwest st.</td>
        <td> 12-03-1987</td>
        <td>0757330483</td>
        <td> 20312391</td>
        <td>	
        <form method="post" action="crud_employer">
                    <input type="hidden" name="id"  />
                    <input type="submit" class="btn btn-link" name="view_salary" value="View income">
                </form>
                
        		<form method="post" action="crud_employer">
                    <input type="hidden" name="id"  />
                    <input type="submit" class="btn btn-link" name="update_employer" value="Update">
                </form>
               
                <form method="post" action="crud_employer">
                    <input type="hidden" name="id" />
                    <input type="submit" class="btn btn-link" name="delete_employer"  value="Delete" onclick="return confirm('Are you sure you want to delete this item?');" >
                </form>
                
        </td>
        </tr>
        <tr>
        <td>Charlie McDougal</td>
        <td>Westmister st.</td>
        <td> 25-12-1975</td>
        <td>0744329080</td>
        <td> 15422376</td>
        <td>	
        <form method="post" action="crud_employer">
                    <input type="hidden" name="id"  />
                    <input type="submit" class="btn btn-link" name="view_salary" value="View income">
                </form>
                
        		<form method="post" action="crud_employer">
                    <input type="hidden" name="id"  />
                    <input type="submit" class="btn btn-link" name="update_employer" value="Update">
                </form>
               
                <form method="post" action="crud_employer">
                    <input type="hidden" name="id" />
                    <input type="submit" class="btn btn-link" name="delete_employer"  value="Delete" onclick="return confirm('Are you sure you want to delete this item?');" >
                </form>
                
        </td>
        </tr>
        </tbody>
         </table>
    </div>
   
     <div class="col-md-2">   
    <input type="submit" class="btn btn-primary" name="fmembers" value="View fidelity club members" onclick="window.location = 'http://localhost:8080/RestaurantManager/FidelityCardOwners.jsp';">   
    </div>
   </div>
   
<script type="text/javascript">(function () {
            if (window.addtocalendar)if(typeof window.addtocalendar.start == "function")return;
            if (window.ifaddtocalendar == undefined) { window.ifaddtocalendar = 1;
                var d = document, s = d.createElement('script'), g = 'getElementsByTagName';
                s.type = 'text/javascript';s.charset = 'UTF-8';s.async = true;
                s.src = ('https:' == window.location.protocol ? 'https' : 'http')+'://addtocalendar.com/atc/1.5/atc.min.js';
                var h = d[g]('body')[0];h.appendChild(s); }})();
    </script>

    
    <span class="addtocalendar atc-style-blue"  data-calendars="Google Calendar">
        <var class="atc_event">
            <var class="atc_date_start">2016-01-11 20:00:00</var>
            <var class="atc_date_end">2016-01-11 22:00:00</var>
            <var class="atc_timezone">Europe/Bucharest</var>
            <var class="atc_title">Jazz Concert</var>
            <var class="atc_description">Carla Redak</var>
            <var class="atc_location">Sneakers'n'Burgers</var>
            <var class="atc_organizer">Roxana Popescu</var>
            <var class="atc_organizer_email">roxxi.popescu@gmail.com</var>
        </var>
    </span>




</body>
</html>