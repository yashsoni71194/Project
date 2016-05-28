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
li a:hover{
font-size:27px;
font-family:Papyrus ;
font-weight: bold;
}

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

#profile_pic{
	height:150px;
	width:150px;
	border:3px solid black;
}

</style>
<link type="text/css" rel="stylesheet" href="css/Navbar.css"/>
</head>
<body>

<div id="header">

<h1>Edit Profile </h1>
<img id="image1" src="img/Logo.jpg"/>
</div>

<br/>

<ul>
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
    PreparedStatement ps=conn.prepareStatement("select * from register where user_id=?"); // select the info of current user
    ps.setString(1,user_id);
    ResultSet rs=ps.executeQuery();
	if(rs.next()){
%>

<div style="margin-left:15%;padding:1px 16px;height:500px;">
		
	<img src="Images/<%=user_id%>.jpg" id="profile_pic" onerror="this.src='Images/default.png'"/>
	<form method="post" action="uploadServlet" enctype="multipart/form-data">
	
	<table>
	<tr>
	<td><input type="file" name="photo" size="50"/></td>
	<td><input type="submit" value="Upload Photo"></td>
	</tr>
	</table>
	</form>
	
<form action="SaveProfile.jsp">
  <table cellpadding="15" border="5"  width="100%">
  		<tr>
  			<td>First Name :</td>
  			<td><input type="text" name="tf_firstname" value="<%=rs.getString("Firstname") %>" ></td>
  		</tr>
  		
  		<tr>
  			<td>Last Name :</td>
  			<td><input type="text" name="tf_lastname" value="<%=rs.getString("Lastname") %>"></td>
  		</tr>
  		
  		<tr>
  			<td>User Id :</td>
  			<td><input type="text" name="tf_userid" value="<%=rs.getString("user_id") %>"></td>
  		</tr>
  		
  		<tr>
  			<td>Old Password :</td>
  			<td><input type="password" name="tf_oldpassword" value="<%=rs.getString("password") %>"></td>
  		</tr>
  		
  		<tr>
  			<td>New Password :</td>
  			<td><input type="password" name="tf_newpassword" value="<%=rs.getString("password") %>"></td>
  		</tr>
  		
  		<tr>
  			<td>Date Of Birth :</td>
  			<td><input type="date" name="tf_dob" value="<%=rs.getString("dob") %>"></td>
  		</tr>
  		
  		<tr>
  			<td>Gender :</td>
  			
  			<td><input type="text" name="tf_gender" value="<%=rs.getString("gender") %>"></td>
  		</tr>
  		
  		<tr>
  			<td>Contact no :</td>
  			<td><input type="text" name="tf_number" value="<%=rs.getString("number") %>"></td>
  		</tr>
  		
  		
  </table>
  <input type="submit" value="save">
  
</form>


<% 
	}
}
catch(Exception e)
{
    System.out.println(e);
}
%>

</div>
</body>
</html>