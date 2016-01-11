<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Seat</title>
<link rel="stylesheet" href="bootstrap.min.css">
    <script src="bootstrap.min.js"></script>
    <link rel='shortcut icon' href='favicon.ico' type='image/x-icon' >
</head>
<body background="bkg.jpg">

<h2 align="center">Seat no. 1</h2>

<br/><br/>

<div class="span7 text-center">
<h4>Dish:</h4>
<input type="text" name="dish">
<h4>Quantity:</h4>
<input type="text" name="qty">
<h4>Specifications:</h4>
<input type="text" name="specs">
<br/><br/>
<input type="submit"  class="btn btn-info" name="add_food" value="Add">
</div>

<br/><br/>

 <div class="col-md-12 text-right">
   <input type="submit" class="btn btn-danger" value="Place Order" onclick="return confirm('Order has been placed!');" >
    </div>
    
<br/><br/>

<div class="row">
 <div class="col-md-12">
    <table class="table" border="5">
        <thead>
        <tr>
        <th>Quantity</th>
         <th>Dish</th>
          <th>Specifications</th>
          <th>Actions</th>
        </tr>
		 </thead>
        <tbody>
        <tr>
        <td> 2</td>
        <td> Dry martinies</td>
        <td> 2 olives</td>
        <td> <form method="post" action="crud_food">
                    <input type="hidden" name="id"  />
                    <input type="submit" class="btn btn-link" name="update_food" value="Update">
                </form>
                <form method="post" action="crud_flight">
                    <input type="hidden" name="id" />
                    <input type="submit" class="btn btn-link" name="delete_food"  value="Delete" onclick="return confirm('Are you sure you want to delete this item?');" >
                </form>
        </td>
        </tr>
        </tbody>
         </table>
    </div>
   </div>
   
   <br/><br/>
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