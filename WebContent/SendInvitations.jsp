<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Email Invitations</title>
<link rel="stylesheet" href="bootstrap.min.css">
    <script src="bootstrap.min.js"></script>
    <link rel='shortcut icon' href='favicon.ico' type='image/x-icon' >
</head>
<body background="bkg.jpg">
<h3 align = "center">Event Invitation</h3>
<br/><br/>

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
   <textarea rows="3" cols="25">
   </textarea>
    </div>
    </div>
    <br/><br/><br/>
    <div class="span7 text-center">
     <input type="submit" class="btn btn-info" name="send_email" value="Send invitaion" onclick="return confirm('Invitation sent!');">
     </div>
   <br/><br/>
   <div class="row">
    <div class="col-md-5 text-center ">
    </div>
    <div class="col-md-5  ">
    <form action="">
	<input type="checkbox" name="vehicle" value="Bike">roxxi.popescu@gmail.com<br>
	<input type="checkbox" name="vehicle" value="Car">ana_blandiana@gmail.com <br>
	<input type="checkbox" name="vehicle" value="Bike">peter.scotch@gmail.com<br>
	<input type="checkbox" name="vehicle" value="Car">ionpop@gmail.com 
	</form>
    </div>
    </div>
 
   
   <br/><br/><br/>
   <div class="row">
   <div class="span7 text-center">
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