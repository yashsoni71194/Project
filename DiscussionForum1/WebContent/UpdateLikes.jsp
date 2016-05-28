<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="connection.Connect"%>
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
HttpSession s=request.getSession();
String user_id_pic=(String)s.getAttribute("Userid");
String Post_title=(String)s.getAttribute("post_title");
try{
    Connection conn=Connect.getConnection();
    PreparedStatement ps=conn.prepareStatement("select * from postinfo where PostTitle=?");
    ps.setString(1,Post_title);
    ResultSet rs=ps.executeQuery();
    if(rs.next())
    {
    PreparedStatement ps2=conn.prepareStatement("Update postinfo set Likes=?,Views=? where PostTitle=?");
    ps2.setInt(1,rs.getInt("Likes")+1);
    ps2.setInt(2,rs.getInt("Views")-1);
    ps2.setString(3,Post_title);
    ps2.executeUpdate();
   }
}
catch(Exception e)
{
    System.out.println(e);
}
response.sendRedirect("Display_content.jsp?PostTitle="+Post_title);

%>



</body>
</html>