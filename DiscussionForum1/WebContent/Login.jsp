<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.Connection" %>
    <%@ page import="connection.Connect" %>
    <%@ page import="java.sql.PreparedStatement" %>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Discussion Forum</title>
</head>
<body>
<% 
String username=request.getParameter("username");  //getting the username and password submitted through form
String password=request.getParameter("pass");

Connection conn=Connect.getConnection();
PreparedStatement ps=conn.prepareStatement("select * from register where user_id=? and password=?");

ps.setString(1, username);
ps.setString(2,password);

HttpSession s = request.getSession();
ResultSet rs=ps.executeQuery();
if(rs.next())
{
    String name=rs.getString("FirstName");
    s.setAttribute("Name", name);				//passing the name and userid of current user through session
    
    String userid=rs.getString("user_id");
    s.setAttribute("Userid", userid);
	response.sendRedirect("Profile.jsp");		//if login successful then redirect to profile page
}
	else
    response.sendRedirect("LoginFailed.jsp");   //in case the login fails redirect to LoginFailed page
%>


</body>
</html>