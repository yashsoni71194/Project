<%@page import="java.sql.PreparedStatement"%>
<%@page import="connection.Connect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Discussion Forum</title>

<style>

body{
background-color:whitesmoke;
}

#header{
	width:1350px;
	height:150px;
	background-color:#2799c5;
	opacity:1;
	border-radius : 20px;
	color:white;
	font-size:40px;
	text-align:center;
	border: 2px solid #000000;
}

#image1{
    position:absolute;
    border:5px black solid;
    height:150px;
    width:160px;
    left:08px;
    top:5px;
    border-radius: 20px;
    background-attachment: fixed;
}

#discussion_image
{
height:400px;
width:800px;
 border-radius: 10px;
 border:5px solid black;
}


li a:hover{
font-size:27px;
font-family:Papyrus ;
font-weight: bold;
}


td{
width:150px;
height:40px;
background-color:red;
color: white;
font-family:sans-serif;
font-size:20px;
padding:10px 10px 10px 10px;
margin-left:10px;
}

#feather_left{
	position:absolute;
    height:150px;
    width:160px;
    right:0px;
    top:5px;
	margin-top:4.8px;   
    background-attachment: fixed;
}

</style>
<link type="text/css" rel="stylesheet" href="css/Navbar.css"/>
</head>
<body>
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
  
  FB.api('/me', function(response) {
	  alert(response.name);
	});
  
  function logout(){
  FB.logout(function(response) {
	  alert("user logged out ");
	  // user is now logged out
	});
  }
</script>

<div id="header">

<% HttpSession s = request.getSession();
String fbemail=request.getParameter("email");  // getting the email of user if logged in through facebook
String name=(String)s.getAttribute("Name");
String fbpic=request.getParameter("fbuserid");  // getting the id of user assigned by facebook for retrieving profile pic
s.setAttribute("fbpic",fbpic);

if(fbemail !=null)									// if user logged in through fb then replace userid by fbemail id
{													// and redirect to savefbprofilepic.jsp to save profile picture
    s.setAttribute("Userid", fbemail);				// of the facebook user in the computer
    response.sendRedirect("Savefbprofilepic.jsp");
}

%>
<h1 style="font-size:.9cm;margin-top: 55px">"A Discussion is never over ! "</h1>
<img id="image1" src="img/Logo.jpg"/>
<img id="feather_left" src="img/feather.jpg">
</div>

<br/>

<div align="right">
 <fb:login-button autologoutlink="true"></fb:login-button>  
</div>


<ul>															
  <li><a href="Profile.jsp">HomePage</a></li>
  <li><a href="Viewposts.jsp">View Posts</a></li>
  <li><a href="CreatePost.jsp ">Create Post</a></li>
  <li><a href="SearchPosts.jsp">Search Posts</a></li>
  <li><a href="MyPosts.jsp">My Posts</a></li>
  <li><a href="Notifications.jsp">Notifications</a></li>
  <li><a href="ViewProfile.jsp">View Profile</a></li>
  <li><a href="Logout.jsp " onclick="logout();">Logout</a></li>
</ul>

<div style="margin-left:15%;padding:1px 16px;height:500px;">
  <h2>"Discussion group is a group of individuals with similar interest who gather either formally or informally to bring up ideas, solve problems or give comments"</h2>
<image id ="discussion_image" src="img/discussion_image.jpg"/>
</div>

</body>
</html>