<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Calorie Calculator</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link rel='shortcut icon' href='favicon.ico' type='image/x-icon' >
<link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">


</head>
<body background="bkg.jpg">
<h3 align="center">Calorie Calculator</h3>
<br/><br/>
<div class="span7 text-center">
<h4>Maximum calorie intake:</h4>

<input type="text" name="maxcal">
<br/><br/>
<h4>Desired meal:</h4>

<div class="dropdown" >
  <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Meal type
  <span class="caret" ></span></button>
  <ul class="dropdown-menu">
    <li><a href="#">Main dish</a></li>
    <li><a href="#">Side dish</a></li>
  </ul>
</div>

<br/>
<input type="text" name="dish">
<br/><br/>
<input type="submit" class="btn btn-info" value="Generate">
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

$(".dropdown-menu li a").click(function(){
	  $(this).parents(".dropdown").find('.btn').html($(this).text() + ' <span class="caret"></span>');
	  $(this).parents(".dropdown").find('.btn').val($(this).data('value'));
	});
</script>

</body>
</html>