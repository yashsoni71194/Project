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
background-color:#2799c5;
color: white;
font-family:sans-serif;
font-size:20px;
padding:10px 10px 10px 10px;
margin-left:10px;
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

tr:nth-child(even)
{
background-color: ;
}
tr:nth-child(odd)
{
background-color: #c5e7f3;
}
td{
font-weight: bold;
}

a{
text-decoration: none;
font-size: 17px;
}

a:hover{
text-decoration:blink;
font-size:20px;
font-color:red;
font-family:Papyrus ;
}

li a:hover{
font-size:27px;
font-family:Papyrus ;
font-weight: bold;
}

</style>

<link type="text/css" rel="stylesheet" href="css/Navbar.css"/>
</head>
<body>
<div id="header">
<h1 style="margin-top: 3px;margin-bottom: 1px;font-size:.9cm ;margin-top: 35px ">"Group Discussion is very valuable,</h1><h1 style="margin-top: 1px;font-size:.9cm">group drafting is less productive"</h1>
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
String id=request.getParameter("id");
HttpSession s = request.getSession();
s.setAttribute("number",id);

try{
    Connection conn=Connect.getConnection();
    PreparedStatement ps=conn.prepareStatement("select * from postinfo"); // selecting all the posts and displaying the contents ont the page
    ResultSet rs=ps.executeQuery();
    while(rs.next())
    {
%>
<tr>
	<td style="width:5%"><%=rs.getString("PostId")  %></td>
	<td style="width:30%"><a href="Display_content.jsp?PostTitle=<%=rs.getString("PostTitle") %>&count=<%=rs.getString("Likes") %> "><%=rs.getString("PostTitle") %></a></td>
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