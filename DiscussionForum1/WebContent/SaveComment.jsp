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
HttpSession s=request.getSession();
String post_title=(String)s.getAttribute("post_title");
String comment = request.getParameter("comment_section");
Calendar cal =Calendar.getInstance();
Date date=new Date(cal.getTime().getTime());   // getting the current date
String current_user=(String)s.getAttribute("Userid");

try{
    Connection conn=Connect.getConnection();
    PreparedStatement ps3=conn.prepareStatement("select * from postinfo where PostTitle=?");
    ps3.setString(1, post_title);
    ResultSet rs3=ps3.executeQuery();
    if(rs3.next())
    {
    PreparedStatement ps4=conn.prepareStatement("insert into comments values (?,?,?,?,?,?)"); // inserting comments of the post in database
    ps4.setString(1,null);
    ps4.setString(2,rs3.getString("PostId"));
    ps4.setString(3, post_title);
    ps4.setString(4, comment);
    ps4.setString(5, current_user);
    ps4.setDate(6, date);
    int row=ps4.executeUpdate();
    if(row>0)
	response.sendRedirect("Display_content.jsp?PostTitle="+post_title);  //redirect to displaycontent to show the saved comments.
    }
}
catch(Exception e)
{
    System.out.println(e);
}




%>



</body>
</html>