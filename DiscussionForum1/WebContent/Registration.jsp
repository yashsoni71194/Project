<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="connection.Connect" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Discussion Forum</title>
</head>
<body>

<% 
//PreparedStatement ps=null;
	
String firstname = request.getParameter("first_name");    
String lastname = request.getParameter("last_name");    
String userid=request.getParameter("user_id");
String pwd = request.getParameter("password");
String cpwd = request.getParameter("confirmpassword");
String dob=request.getParameter("birth_date");
String gender = request.getParameter("gender");
String number =request.getParameter("number");
 
    
    Connection conn=Connect.getConnection();
     PreparedStatement ps=conn.prepareStatement("insert into register values (?,?,?,?,?,?,?,?,?)");
    ps.setString(1,firstname);
    ps.setString(2,lastname);
    ps.setString(3,userid);
    ps.setString(4,pwd);
    ps.setString(5,cpwd);
    ps.setString(6,dob);
    ps.setString(7,gender);
    ps.setString(8,number);
    ps.setString(9,null);
   int row = ps.executeUpdate();
	
   if(row>0)
       response.sendRedirect("index.jsp"); // if registration successful
      
%>

</body>
</html>