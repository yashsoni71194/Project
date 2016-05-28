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
</head>
<body>

<% 
HttpSession s = request.getSession();
String user_id=(String)s.getAttribute("Userid");
String Firstname=request.getParameter("tf_firstname");
String Lastname=request.getParameter("tf_lastname");
String password=request.getParameter("tf_newpassword");
String dob=request.getParameter("tf_dob");
String gender=request.getParameter("tf_gender");
String number=request.getParameter("tf_number");


try
{
    Connection conn=Connect.getConnection();
    PreparedStatement ps=conn.prepareStatement("update register set Firstname=?,Lastname=?,password=?,confirmpass=?,dob=?,gender=?,number=? where user_id=?");
    ps.setString(1,Firstname);
    ps.setString(2,Lastname);
    ps.setString(3,password);
    ps.setString(4,password);
    ps.setString(5,dob);
    ps.setString(6,gender);
    ps.setString(7,number);
    ps.setString(8,user_id);
    
  	ps.executeUpdate();
	response.sendRedirect("ViewProfile.jsp");

}
catch(Exception e)
{
    System.out.println(e);
}
	
%>
</body>
</html>