
<%@page import="java.sql.Date"%>
<%@page import="java.util.Calendar"%>
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
	
#feather_left{
	position:absolute;
    height:150px;
    width:160px;
    right:0px;
    top:5px;
	margin-top:4.8px;   
    background-attachment: fixed;
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

#msg
{
	margin-left:1%;
	padding:1px 16px;
	position: relative;
	border :5px solid #2799c5;
}

#comment_area
{
  left: 50px; 
  top: 50px;
  right: 50px; 
  bottom: 50px;
}

#unlike
{
 	position:absolute;
    border:none;
    height:40px;
    width:40px;
}

h1{
font-family:Papyrus;
}

li a:hover{
font-size:27px;
font-family:Papyrus ;
font-weight: bold;
}

</style>
<link type="text/css" rel="stylesheet" href="css/Navbar.css"/>
<link type="text/css" rel="stylesheet" href="css/comment.css"/>

</head>
<body onload="bidvisibility()">

<script type="text/javascript">

function changeImage()
{	
	var choice;
	var image = document.getElementById("unlike");
    if (image.src.match("img/unliked.png")) {
        image.src = "img/liked.png";
          choice=1;
    } 
    else {
        image.src = "img/unliked.png";
      	choice=0;
    }
}

function bidvisibility()
{
		document.getElementById("bid_visibility").style.visibility="visible";
}

</script>

<div id="header">

<h2 style="font-size: .3 cm ;margin-top: 3px"> "Having a good Discussion is like <br>having riches" </h2>
<img id="image1" src="img/Logo.jpg"/>
<img id="feather_left" src="img/feather.jpg">

</div>

<br/>

<ul >
  <li><a href="Profile.jsp">HomePage</a></li>
  <li><a href="Viewposts.jsp">View Posts</a></li>
  <li><a href="CreatePost.jsp ">Create Post</a></li>
  <li><a href="SearchPosts.jsp">Search Posts</a></li>
  <li><a href="MyPosts.jsp">My Posts</a></li>
  <li><a href="Notifications.jsp">Notifications</a></li>
  <li><a href="ViewProfile.jsp">View Profile</a></li>
  <li><a href="Logout.jsp ">Logout</a></li>
</ul>

<div style="margin-left:15%;padding:1px 5px;position:relative;">
 
<%
String selected=request.getParameter("PostTitle");
int updated_view;
int updated_likes;
HttpSession s=request.getSession();
String user_id_pic=(String)s.getAttribute("Userid");
s.setAttribute("post_title", selected);
try{
    Connection conn=Connect.getConnection();
    PreparedStatement ps=conn.prepareStatement("select PostMessage,Views,user_id,PostId,Likes from postinfo where PostTitle=?");
    ps.setString(1,selected);
    ResultSet rs=ps.executeQuery();
    if(rs.next())
    {
%>
<h1>Title : <%=selected %></h1><br>
<div id="bid_visibility">
<form action="BidDetails.jsp">
<p align="right">Make a bid : <input type="text" size="5" name="bid_amt"> <input type="submit" value="send"></p>
</form>
</div>

<div id="msg">
<h3>
<em>
<%=rs.getString("PostMessage")%>
</em> 
</h3>
</div>

</div>

<div id="div2">

<table style="width:20%" align="right">
<tr>
<td width="30%"><a href="UpdateLikes.jsp" onclick="changeImage()"><img id="unlike" src="img/unliked.png"/></a></td>
<td></td>
</tr>

<tr>
<td></td>
<td>Posted by :</td>
</tr>
<tr>
<td></td>
<% String posted_by=rs.getString("user_id");%>
<td><b><%=rs.getString("user_id") %></b></td>
</tr>
</table>

<table style="width:30%;margin-left: 15%">
<tr>
<td width="30%"   ><pre>  <b>Comment</b></pre></td>


</tr>

</table>
<%
updated_view =rs.getInt("Views")+1;

    PreparedStatement ps2=conn.prepareStatement("update postinfo set Views=? where PostTitle=?");  // updating the no of views of the post in database
    ps2.setInt(1,updated_view);
    ps2.setString(2,selected);
    ps2.executeUpdate();    
}
}
catch(Exception e)
{
    System.out.println(e);
}


%>

<form action="SaveComment.jsp"> 
<div style="margin-left:13%;padding:5px 5px 0px 50px;position: relative;">
<textarea name="comment_section" id="comment_text" rows="7" cols="70" >
</textarea>
</div>

<div style="margin-left:13%;padding:0px 5px 30px 50px;margin-top:0%;position: relative;">
<table>
<tr>
<td><input type="submit"  value="Add Comment"></td>
</tr>
</table>
</div>
</form> 

<%

String comment = request.getParameter("comment_section");
Calendar cal =Calendar.getInstance();
Date date=new Date(cal.getTime().getTime());

try{
    Connection conn=Connect.getConnection();
    PreparedStatement ps4=conn.prepareStatement("select * from comments where PostTitle=?"); //get the comments of current post from the database and displaying it
    ps4.setString(1, selected);
    ResultSet rs4=ps4.executeQuery();
   	while(rs4.next())
   	{
%>

<div class="bubble-list">

<!-- displaying the user picture along with the comment -->
<img id="cmt_image" src="Images/<%=rs4.getString("user_id")%>.jpg" onerror="this.src='Images/default.png'"/>

<div class="bubble clearfix">
				
<table id="comment_info" cellspacing="10">
<tr>
<%String current_user =rs4.getString("user_id"); %>
	<td>Commented by :<b> <%=rs4.getString("user_id") %></b></td>
	<td>Commented on :<%=rs4.getString("CommentDate") %></td>
</tr>

</table>
				<div class="bubble-content">
					<div class="point"></div>

					<p><%=rs4.getString("Comment_data") %></p>
				</div>

</div>
</div>
<br>
<br>
   	    
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


