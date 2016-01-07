<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Fidelity Card Owners</title>
<link rel="stylesheet" href="bootstrap.min.css">
    <script src="bootstrap.min.js"></script>
    <link rel='shortcut icon' href='favicon.ico' type='image/x-icon' >
</head>
<body background="bkg.jpg">
<br/>
<h3 align = "center">Fidelity Card Owners</h3>
<br/>
<div class="span7 text-center">
 <form method="post" action="InvitationServlet">
 <input type="submit" class="btn btn-primary" name="send_invitation" value="Send invitations ">
 </form>
 </div>
 <br/>
<div class="row">
 <div class="col-md-12 ">
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
        <tr>
        <td> 01231</td>
        <td> Roxana</td>
        <td> Popescu</td>
        <td> 25-01-1994</td>
        <td> roxxi.popescu@gmail.com</td>
        <td>	
       
                <div class="row">
        		<div class="col-md-3">
                 <form method="post" action="crud_fclient">
                    <input type="hidden" name="id"  />
                    <input type="submit" class="btn btn-link" name="view_fclient" value="View history">
                </form>
                </div>
                <div class="col-md-2">
        		<form method="post" action="crud_fclient">
                    <input type="hidden" name="id"  />
                    <input type="submit" class="btn btn-link" name="update_fclient" value="Update">
                </form>
               </div>
               <div class="col-md-2">
                <form method="post" action="crud_fclient">
                    <input type="hidden" name="id" />
                    <input type="submit" class="btn btn-link" name="delete_fclient"  value="Delete" onclick="return confirm('Are you sure you want to delete this item?');" >
                </form>
                </div>
                 
                </div>
        </td>
        </tr>
         <tr>
        <td> 12012</td>
        <td> Ana</td>
        <td> Blandiana</td>
        <td> 12-12-1967</td>
        <td> ana_blandiana@gmail.com </td>
        <td>	
        <div class="row">
        <div class="col-md-3">
                 <form method="post" action="crud_fclient">
                    <input type="hidden" name="id"  />
                    <input type="submit" class="btn btn-link" name="view_fclient" value="View history">
                </form>
                </div>
                <div class="col-md-2">
        		<form method="post" action="crud_fclient">
                    <input type="hidden" name="id"  />
                    <input type="submit" class="btn btn-link" name="update_fclient" value="Update">
                </form>
               </div>
               <div class="col-md-2">
                <form method="post" action="crud_fclient">
                    <input type="hidden" name="id" />
                    <input type="submit" class="btn btn-link" name="delete_fclient"  value="Delete" onclick="return confirm('Are you sure you want to delete this item?');" >
                </form>
                </div>
                 
                </div>
        </td>
        </tr>
         <tr>
        <td> 43253</td>
        <td> Peter</td>
        <td> Scotch</td>
        <td> 04-03-1957</td>
        <td> peter.scotch@gmail.com </td>
        <td>	
        <div class="row">
        <div class="col-md-3">
                 <form method="post" action="crud_fclient">
                    <input type="hidden" name="id"  />
                    <input type="submit" class="btn btn-link" name="view_fclient" value="View history">
                </form>
                </div>
                <div class="col-md-2">
        		<form method="post" action="crud_fclient">
                    <input type="hidden" name="id"  />
                    <input type="submit" class="btn btn-link" name="update_fclient" value="Update">
                </form>
               </div>
               <div class="col-md-2">
                <form method="post" action="crud_fclient">
                    <input type="hidden" name="id" />
                    <input type="submit" class="btn btn-link" name="delete_fclient"  value="Delete" onclick="return confirm('Are you sure you want to delete this item?');" >
                </form>
                </div>
                 
                </div>
        </td>
        </tr>
         <tr>
        <td> 12012</td>
        <td> Ion</td>
        <td> Pop</td>
        <td> 29-08-1992</td>
        <td> ionpop@gmail.com </td>
        <td>	
        <div class="row">
        <div class="col-md-3">
                 <form method="post" action="crud_fclient">
                    <input type="hidden" name="id"  />
                    <input type="submit" class="btn btn-link" name="view_fclient" value="View history">
                </form>
                </div>
                <div class="col-md-2">
        		<form method="post" action="crud_fclient">
                    <input type="hidden" name="id"  />
                    <input type="submit" class="btn btn-link" name="update_fclient" value="Update">
                </form>
               </div>
               <div class="col-md-2">
                <form method="post" action="crud_fclient">
                    <input type="hidden" name="id" />
                    <input type="submit" class="btn btn-link" name="delete_fclient"  value="Delete" onclick="return confirm('Are you sure you want to delete this item?');" >
                </form>
                </div>
                 
                </div>
        </td>
        </tr>
        </tbody>
         </table>
    </div>
   </div>
   
   
   <div class = "row">
   <div class="col-md-4 text-center">
   <h4>Name:</h4>
    <input type="text" name="name" />
   <h4>Surame:</h4>
    <input type="text" name="surname" />
    </div>
     <div class="col-md-4 text-center ">
   <h4>Birth date:</h4>
    <input type="text" name="bday" />
   <h4>Email address:</h4>
    <input type="text" name="email" />
    </div>
     <div class="col-md-4 text-center">
   <h4>Card number:</h4>
    <input type="text" name="cardid" /><br/><br/>
    <input type="submit" class="btn btn-info" name="add_fclient" value="Add new member">
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