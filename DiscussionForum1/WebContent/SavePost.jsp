<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.Connection" %>
    <%@ page import="connection.Connect" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Discussion Forum</title>
</head>
<body>

<% 

String postMessage=request.getParameter("text_area1");  // get the postmessage
HttpSession s = request.getSession();
String userid=(String)s.getAttribute("Userid");
String postTitle=request.getParameter("PostTitle");
String topic=request.getParameter("Options");

String fbemail=(String)s.getAttribute("fbemail");

Calendar cal =Calendar.getInstance();
Date date=new Date(cal.getTime().getTime());


int views=0;
int likes=0;
int LikedByUser=0;

Connection conn=Connect.getConnection();
PreparedStatement ps=conn.prepareStatement("insert into postinfo values (?,?,?,?,?,?,?,?)"); //storing the post details into database
ps.setString(1,null);
ps.setString(2, userid);
ps.setString(3, postTitle);
ps.setString(4, topic);
ps.setString(5, postMessage);
ps.setDate(6, date);
ps.setInt(7, views);
ps.setInt(8, likes);


int row=ps.executeUpdate();
if(row>0)
    response.sendRedirect("Viewposts.jsp");  // if post added successfully in database

%>



</body>
</html>