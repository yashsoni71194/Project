<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="connection.Connect"%>
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

#feather_left{
	position:absolute;    
    height:150px;
    width:160px;
    right:0px;
    top:5px;
	margin-top:4.8px;   
    background-attachment: fixed;
}

th{
width:100%;
height:10px;
background-color:#866dfc;
color: white;
font-family:sans-serif;
font-size:20px;
padding:10px 10px 10px 10px;
margin-left:10px;
}

</style>
<link type="text/css" rel="stylesheet" href="css/Navbar.css"/>
</head>
<body>

<div id="header">
<h1 style="margin-top: 2px;margin-bottom: 1px ;font-size:.9cm ;margin-top: 35px">"A golden rule for discussion is to use <br></h1><h2 style="margin-top: 1px;font-size:.9cm">Hard fact  and soft voice"</h2>
<img id="image1" src="img/Logo.jpg"/>
<img id="feather_left" src="img/feather.jpg">
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
  <li><a href=" Logout.jsp">Logout</a></li>
</ul>

<div style="margin-left:15%;padding:1px 16px;height:500px;">
<table cellpadding="15" border="5"  width="100%">

	<thead>

	<tr>
	<th style="width:5%">PostId</th>
	<th style="width:30%">PostTitle</th>
	<th style="width:20%">Topic</th>
	<th style="width:15%">PostDate</th>
	<th style="width:5%">Views</th>
	<th style="width:5%">Likes</th>
	<th style="width:20%">PostedBy</th>
	</tr>

	</thead>
<tbody>

<% 
try{
    HttpSession s = request.getSession();
    String userid=(String)s.getAttribute("Userid");
    
    Connection conn=Connect.getConnection();
    PreparedStatement ps=conn.prepareStatement("select * from postinfo where user_id=?"); //select and display all the posts made by the current logged in user
    ps.setString(1, userid);
    ResultSet rs=ps.executeQuery();	
    while(rs.next())
	{
%>
<tr>
	<td style="width:5%"><%=rs.getString("PostId") %></td>
	<td style="width:30%"><%=rs.getString("PostTitle") %></td>
	<td style="width:20%"><%=rs.getString("Topic") %></td>
	<td style="width:15%"><%=rs.getString("PostDate") %></td>
	<td style="width:5%"><%=rs.getString("Views") %></td>
	<td style="width:5%"><%=rs.getString("Likes") %></td>
	<td style="width:20%"><%=rs.getString("user_id") %></td>
</tr>
<%   }
}
catch(Exception e)
{
    System.out.println(e);
}
%>
</tbody>
</table>
</div>
</body>
</html>