<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>History of orders</title>
<link rel="stylesheet" href="bootstrap.min.css">
    <script src="bootstrap.min.js"></script>
    <link rel='shortcut icon' href='favicon.ico' type='image/x-icon' >
</head>
<body background="bkg.jpg">
	<h3 align="center">Costumer's history of orders</h3>
<br/>	
<h4>Roxana</h4>
<br/><br/>

<div class="row">
 <div class="col-md-6 ">
    <table class="table" align="center" border="3">
        <thead>
        <tr>
        <th>Date</th>
        <th>Dish</th>
        <th>Suggestions</th>
         <th>Fidelity card no. | Discount</th>
        <th style="text-align:center">Actions</th>
        </tr>
		 </thead>
        <tbody>
        <tr>
        <td> 12/12/2015</td>
        <td> Penne Carbonara</td>
        <td> -</td>     
         <td> 01231 | 30%</td>    
        <td>
        <div class="row">
 			<div class="col-md-5 text-center ">	      
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
        <td> 03/01/2016</td>
        <td> Grilled Chicken Breast with Fries</td>
        
        <td> -</td>     
          <td> 01231 | 30%</td>  
        <td>
        <div class="row">
 			<div class="col-md-5 text-center ">	      
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
        <td> 05/01/2016</td>
        <td> BBQ Texas Burger</td>
        <td> medium done</td>  
        <td> 01231 | 30%</td>       
        <td>
        <div class="row">
 			<div class="col-md-5 text-center ">	      
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
    
    <div class="col-md-2 text-center">
     <h4>Date:</h4>
    <input type="text" name="date" />
    
    </div>
    <div class="col-md-2 text-center">
   <h4>Dish:</h4>
    <input type="text" name="dish" />
     <br/><br/> 
    <input type="submit" class="btn btn-info" name="add_fclient" value="Add latest meal">
    </div>
    <div class="col-md-2 text-center">
   <h4>Suggestions:</h4>
    <input type="text" name="sugg" /> 
   
    
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