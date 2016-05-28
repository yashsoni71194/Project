<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="css/Registerstyle.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href='http://fonts.googleapis.com/css?family=Oxygen:400,300,700' rel='stylesheet' type='text/css'>
</head>
<body>
<div class="main">
	
      <h1>Registration Details</h1>
		<form action="Registration.jsp">
		   <div class="lable">
		        <div class="col_1_of_2 span_1_of_2">	<input type="text" class="text" value="First Name" name="first_name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'First Name';}" id="active"></div>
                <div class="col_1_of_2 span_1_of_2"><input type="text" class="text" value="Last Name" name="last_name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Last Name';}"></div>
                <div class="clear"> </div>
		   </div>
		   <div class="lable-2">
		        <input type="text" class="text" value="Username" name="user_id" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Username';}">
		        <input type="password" class="text" value="password" name="password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password ';}">
		        <input type="password" class="text" value="password" name="confirmpassword" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password ';}">
		  	<p>	DATE OF BIRTH : <input type="date" class="text" name="birth_date"/>
		  		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Gender : <input type="radio" name="gender" value="Male"/>Male <input type="radio" name="gender" value="Female"/>Female</p><br/>
		   		<input type="text" class="text" value="Contact Number"  name="number" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Contact number';}">
		   </div>
		   <h3>By creating an account, you agree to our <span class="term"><a>Terms & Conditions</a></span></h3>
		   <div class="submit">
			  <input type="submit" onclick="myFunction()" value="Create account" >
		   </div>
		   <div class="clear"> </div>
		</form>
		</div>
		 
</body>
</html>