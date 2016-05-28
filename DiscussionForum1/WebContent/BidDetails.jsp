<%@page import="java.sql.ResultSet"%>
<%@page import="connection.Connect"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Discussion Forum</title>
</head>
<body>

<% 
HttpSession s = request.getSession();
String current_user=(String)s.getAttribute("Userid");
String bid_amount=request.getParameter("bid_amt");
String post_title=(String)s.getAttribute("post_title");
String posted_by_user=(String)s.getAttribute("posted_by_user");

try
{
    Connection conn=Connect.getConnection();
    PreparedStatement ps=conn.prepareStatement("select * from postinfo where PostTitle=?");
    ps.setString(1,post_title);
    ResultSet rs=ps.executeQuery();
    
    if(rs.next())
    {
    PreparedStatement ps5=conn.prepareStatement("insert into bids values(?,?,?,?,?,?)");
    ps5.setString(1,null);
    ps5.setString(2,rs.getString("PostId"));
    ps5.setString(3,post_title);
    ps5.setString(4,rs.getString("user_id"));
    ps5.setString(5,bid_amount);
    ps5.setString(6,current_user);
    
  	ps5.executeUpdate();
	response.sendRedirect("Display_content.jsp?PostTitle="+post_title);

	}
}
catch(Exception e)
{
    System.out.println(e);
}
	
%>
</body>
</html>