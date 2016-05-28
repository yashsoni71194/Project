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
<body onload="hidediv()">

<script type="text/javascript">

function hidediv()
{
	document.getElementById("tabledata").style.visibility="visible";
	}
function displaydiv()
{
var search_parameter=document.getElementById("options").value;
document.getElementById("tabledata").style.visibility="visible";
window.location.replace("SearchPosts.jsp?search_parameter="+search_parameter); 
}

</script>

<div id="header">
<h1 style="margin-top: 3px; margin-bottom: 1px;font-size:.9cm ;margin-top: 35px">"Free Discussion is the very</h1><h1 style="margin-top: 1px;font-size:.9cm"> life of truth"</h1>
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
  <li><a href="Logout.jsp">Logout</a></li>
</ul>


<div style="margin-left:15%;padding:1px 16px;height:50px;">
<table id="table1">
<tr>  
<td>Select Topic </td>
<td>
<select id="options">
  <option value="Technology">Technology</option>
  <option value="Sports">Sports</option>
  <option value="Programming">Programming</option>
  <option value="Politics">Politics</option>
  <option value="Other">Other</option>
</select>
</td>
<td>
<input type="button" name="searchbutton" value="Search" onclick="displaydiv()"/>
</td>
</tr>
</table>
</div>

<div id="tabledata" style="margin-left:15%;padding:1px 16px;height:500px; ">

<table cellpadding="15" border="5"  width="100%" >
 
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
String search_parameter=request.getParameter("search_parameter");  // get the selected search parameter from dropdown list
try{
    Connection conn=Connect.getConnection();
    PreparedStatement ps=conn.prepareStatement("select * from postinfo where Topic=?"); // select the post based on the selected parameter
    ps.setString(1,search_parameter);
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