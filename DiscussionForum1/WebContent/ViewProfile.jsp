<%@page import="connection.Connect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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

#profile_pic
{
height:200px;
width:200px;
border:3px black solid;
}

#left_panel
{
position:absolute;
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

#fblogo
{
height:100px;
width:100px;
border:5px black solid;
border-radius:15px;
margin-left: 600px;
}

</style>
<link type="text/css" rel="stylesheet" href="css/Navbar.css"/>
</head>
<body>

<div id="header">


<h1>Welcome to Profile Page </h1>
<img id="image1" src="img/Logo.jpg"/>
</div>
<br/>


<ul id="left_panel">
  <li><a href="Profile.jsp">HomePage</a></li>
  <li><a href="Viewposts.jsp">View Posts</a></li>
  <li><a href="CreatePost.jsp ">Create Post</a></li>
  <li><a href="SearchPosts.jsp">Search Posts</a></li>
  <li><a href="MyPosts.jsp">My Posts</a></li>
  <li><a href="Notifications.jsp">Notifications</a></li>
  <li><a href="ViewProfile.jsp">View Profile</a></li>
  <li><a href="Logout.jsp ">Logout</a></li>
</ul>

<% 
HttpSession s = request.getSession();
String user_id=(String)s.getAttribute("Userid");
try
{
    Connection conn=Connect.getConnection();
    PreparedStatement ps=conn.prepareStatement("select * from register where user_id=?");
    ps.setString(1,user_id);
    ResultSet rs=ps.executeQuery();
	if(rs.next()){
%>

<div style="margin-left:15%;padding:1px 16px;height:500px;">
	<form action="EditProfile.jsp">  
  <table cellpadding="15" border="5"  width="100%">
  		<tr style="background-color: white;" >
  		<td><img src="Images/<%=user_id%>.jpg" id="profile_pic" onerror="this.src='Images/default.png'"></td>
  		<td></td>
  		</tr>
  		
  		<tr>
  			<td>First Name :</td>
  			<td><label id="first_name"> <%=rs.getString("Firstname") %></label></td>
  		</tr>
  		
  		<tr>
  			<td>Last Name :</td>
  			<td><label id="last_name"> <%=rs.getString("Lastname") %></label></td>
  		</tr>
  		
  		<tr>
  			<td>User Id :</td>
  			<td><label id="user_id"> <%=rs.getString("user_id") %></label></td>
  		</tr>
  		
  		<tr>
  			<td>Date Of Birth :</td>
  			<td><label id="dob"> <%=rs.getString("dob") %></label></td>
  		</tr>
  		
  		<tr>
  			<td>Gender :</td>
  			<td><label id="gender"> <%=rs.getString("gender") %></label></td>
  		</tr>
  		
  		<tr>
  			<td>Contact no :</td>
  			<td><label id="number"> <%=rs.getString("number") %></label></td>
  		</tr>
  </table>

<input type="submit" value="Edit">
</form>
</div>

<% }
	else{
%>
<h1 align="center">View your profile on facebook </h1>
<a href="http://www.facebook.com" target="_blank"><img id="fblogo" src="img/fb.png"/></a>
<%	    
	}
}
catch(Exception e)
{
    System.out.println(e);
}
%>


</body>
</html>