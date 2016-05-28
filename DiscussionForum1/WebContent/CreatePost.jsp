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

li a:hover{
font-size:27px;
font-family:Papyrus ;
font-weight: bold;
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


#table1 td{
width:100%;
height:10px;
background-color:#866dfc;
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
<div id="header">
<h1 style="margin-top: 3px;margin-bottom: 1px;font-size:.9cm ;margin-top: 35px">"The aim of an argument or discussion</h1><h1 style="margin-top: 1px;font-size:.9cm ">should not be victory,but progress"</h1>
<img id="image1" src="img/Logo.jpg"/>
<img id="feather_left" src="img/feather.jpg">
</div>
<br/>

<ul>
  <li><a href="Profile.jsp">HomePage</a></li>
  <li><a href="Viewposts.jsp">View Posts</a></li>
  <li><a href="CreatePost.jsp">Create Post</a></li>
  <li><a href="SearchPosts.jsp">Search Posts</a></li>
  <li><a href="MyPosts.jsp">My Posts</a></li>
  <li><a href="Notifications.jsp">Notifications</a></li>
  <li><a href="ViewProfile.jsp">View Profile</a></li>
  <li><a href="Logout.jsp">Logout</a></li>
</ul>

<form action="SavePost.jsp" method="post">
<div style="margin-left:15%;margin-top:0%;padding:1px 16px;height:500px;">
<table id="table1">

<tr>  
<td>Select Topic </td>

<td>
<select name="Options">
  <option value="Technology">Technology</option>
  <option value="Sports">Sports</option>
  <option value="Programming">Programming</option>
  <option value="Politics">Politics</option>
  <option value="Other">Other</option>
</select>
</td>
</tr>

</table>

<table id="post">
<tr></tr>
<tr>
<td>Enter Post Title :
<input type="text" name="PostTitle">
</td>
</tr>
</table>
<pre>
</pre>


<table>
<tr>
<td>Enter Description here !
<textarea name="text_area1" rows="10" cols="155">

</textarea>
</td>
</tr>
</table>

<input type="submit" value="Create Post">


</div>
</form>
</body>
</html>