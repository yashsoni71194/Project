<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Discussion Forum</title>
 <link type="text/css" rel="stylesheet" href="css/design1.css"/>

</head>
<body style="background-color:whitesmoke">

<script>
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '1021520237933555',
      xfbml      : true,
      version    : 'v2.6'
    });
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
  
</script>


<div id="header">
<h1 style="font-family: sans-serif;font-size: 2cm;color:#f47a00; ;  ;margin-top: 2px;margin-bottom: 0px">Discussion Forum</h1><h2 style="text-align:right;margin-top:0px;font-size: 30px">More Discussion,More Thoughts,More Knowledge..</h2>
<img id="image1" src="img/Logo.jpg"/>
</div>


<script>
  // This is called with the results from from FB.getLoginStatus().
  function statusChangeCallback(response) {
    console.log('statusChangeCallback');
    console.log(response);
    
    if (response.status === 'connected') {
      // Logged into your app and Facebook.
      testAPI();
    
    } else if (response.status === 'not_authorized') {
      // The person is logged into Facebook, but not your app.
     
      alert("Login into app");
      document.getElementById('status').innerHTML = 'Please log ' +
        'into this app.';
    } 
  }

  function checkLoginState() {
    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });
  }

  window.fbAsyncInit = function() {
  FB.init({
    appId      : '1021520237933555',
    cookie     : true,  // enable cookies to allow the server to access 
                        // the session
    xfbml      : true,  // parse social plugins on this page
    version    : 'v2.5' // use graph api version 2.5
  });

  
  FB.getLoginStatus(function(response) {
    statusChangeCallback(response);
  });

  };

  // Load the SDK asynchronously
  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));

  function testAPI() {
	  
	 console.log('Welcome!  Fetching your information.... ');
	  
    FB.api('/me?fields=id,name,email,first_name,last_name', function(response) {
    	var fbusername=response.name;
    	var fbuserid=response.id;									// fetching the facebook user information
    	var fbemail=response.email;									// and passing it in form of parameters to Profile page
    	var fbfirstname=response.first_name;
    	var fblastname=response.last_name;
    	
      console.log('Successful login for: ' + response.name );

    
      window.location.replace("Profile.jsp?email="+fbemail+"&first_name="+fbfirstname+"&last_name="+fblastname+"&fbuserid="+fbuserid);
    });
    
  }
  
  FB.api('/me', function(response) {
	  alert(response.name);
	});
</script>

<!--
  Below we include the Login Button social plugin. This button uses
  the JavaScript SDK to present a graphical Login button that triggers
  the FB.login() function when clicked.
-->



  <div id="status">
</div> 

<div id="fblogin">
<p style="color:blue ;font-size: 15px;font-weight:bold">Login through Facebook !</p>
<fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
</fb:login-button>
</div>
 
<br><br><br><br>

<div id="div1">
         <form action="Login.jsp" method="post">
      
             Username:&nbsp; <input type ="text" name ="username" /><br/><br>
     
             Password:&nbsp;&nbsp; <input type ="password" name ="pass"/><br/>
   
   <pre>              <input id ="input1"type ="submit" value ="Login"/> </pre>
    
  		 </form>
   <a href="Register.jsp">Not Registered Yet !!</a>
 
</div>
      

<div id="footer">
        <p style="text-shadow:4px 4px 8px black"> Developed and Designed By : <em>Our Team</em><br>
        All Rights Reserved</p>
</div>

</body>
</html>