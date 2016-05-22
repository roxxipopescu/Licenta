<%@ page import="com.model.User" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
%>


<h3 align="center"><%=a.getFirstName() %>'s income from clients</h3>
<br/>	

<div class="row">
 <div class="col-md-6 ">
    <table class="table" align="center" border="3">
        <thead>
        <tr>
        <th>Date</th>
        <th>Order</th>
        <th>Check no.</th>
        <th>Check value</th>
        <th style="text-align:center">Actions</th>
        </tr>
		 </thead>
        <tbody>
        <tr>
        <td> 12/12/2014</td>
        <td> Penne Carbonara</td>
        <td> 120031</td>     
        <td> 32.00 $</td>
        <td>
        <div class="row">
 			<div class="col-md-6 text-center ">	      
        		<form method="post" action="crud_history">
                    <input type="hidden" name="id"  />
                    <input type="submit" class="btn btn-link" name="update_history" value="Update">
                </form>
               </div>
               <div class="col-md-2  ">	  
                <form method="post" action="crud_history">
                    <input type="hidden" name="id" />
                    <input type="submit" class="btn btn-link" name="delete_history"  value="Delete" onclick="return confirm('Are you sure you want to delete this item?');" >
                </form>
                </div>
             </div>   
        </td>
        </tr>
        <tr>
        <td> 25/01/2015</td>
        <td> Duck Confit Burger | Sweet Potatoes</td>
        <td> 283712</td>     
        <td> 135.55 $</td>
        <td>
        <div class="row">
 			<div class="col-md-6 text-center ">	      
        		<form method="post" action="crud_history">
                    <input type="hidden" name="id"  />
                    <input type="submit" class="btn btn-link" name="update_history" value="Update">
                </form>
               </div>
               <div class="col-md-2  ">	  
                <form method="post" action="crud_history">
                    <input type="hidden" name="id" />
                    <input type="submit" class="btn btn-link" name="delete_history"  value="Delete" onclick="return confirm('Are you sure you want to delete this item?');" >
                </form>
                </div>
             </div>   
        </td>
        </tr>
        <tr>
        <td> 03/04/2015</td>
        <td> Cheese Plate | Corcova Wine</td>
        <td> 890023</td>     
        <td> 63.25 $</td>
        <td>
        <div class="row">
 			<div class="col-md-6 text-center ">	      
        		<form method="post" action="crud_history">
                    <input type="hidden" name="id"  />
                    <input type="submit" class="btn btn-link" name="update_history" value="Update">
                </form>
               </div>
               <div class="col-md-2  ">	  
                <form method="post" action="crud_history">
                    <input type="hidden" name="id" />
                    <input type="submit" class="btn btn-link" name="delete_history"  value="Delete" onclick="return confirm('Are you sure you want to delete this item?');" >
                </form>
                </div>
             </div>   
        </td>
        </tr>
        <tr>
        <td> 23/10/2015</td>
        <td> Tiramisu | Noble 5 Wine</td>
        <td> 455233</td>     
        <td> 86.89 $</td>
        <td>
        <div class="row">
 			<div class="col-md-6 text-center ">	      
        		<form method="post" action="crud_history">
                    <input type="hidden" name="id"  />
                    <input type="submit" class="btn btn-link" name="update_history" value="Update">
                </form>
               </div>
               <div class="col-md-2  ">	  
                <form method="post" action="crud_history">
                    <input type="hidden" name="id" />
                    <input type="submit" class="btn btn-link" name="delete_history"  value="Delete" onclick="return confirm('Are you sure you want to delete this item?');" >
                </form>
                </div>
             </div>   
        </td>
        </tr>
        </tbody>
         </table>
    </div>
    
    <div class="col-md-1 text-center">
     <h4>Date:</h4>
    <input type="text" name="date" />
    
    </div>
    <div class="col-md-1 text-center">
   <h4>Order:</h4>
    <input type="text" name="order" />
    
    </div>
    <div class="col-md-1 text-center">
   <h4>Check no.:</h4>
    <input type="text" name="checknb" /> 
     <br/><br/> 
    <input type="submit" class="btn btn-info" name="add_fclient" value="Add">
    </div>
    <div class="col-md-1 text-center">
    <h4>Value:</h4>
    <input type="text" name="value" /> 
   
    
    </div>
   </div>

<br/><br/><br/>
   
   <div class="row">
   <div class="col-md-12 text-center">
   <input type="submit" class="btn btn-default" value="Back" onclick="goBack()" >
    </div>
    </div>

<script>
function goBack() {
    window.history.back();
}
</script>
</body>
</html>