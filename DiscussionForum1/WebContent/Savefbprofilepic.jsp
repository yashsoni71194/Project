<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.Connection"%>
    <%@page import="java.io.FileOutputStream"%>
    <%@page import="java.io.IOException"%>
    <%@page import="java.io.InputStream"%>
    <%@page import="java.io.OutputStream"%>
    <%@page import="java.net.URL"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Discussion Forum</title>
</head>
<body>
<% 
		HttpSession s=request.getSession();
		String user_id=(String)s.getAttribute("Userid");
		String fbpic=(String)s.getAttribute("fbpic");   // getting the assigned id by fb for profile pic retrieval through graph
		String imageUrl = "https://graph.facebook.com/"+fbpic+"/picture";
		String destinationFile = "C:/Users/Inspiron/workspace1/DiscussionForum1/WebContent/Images/"+user_id+".jpg";   // saving the profile pic of fb user by userid in the mentioned directory in computer

		URL url = new URL(imageUrl);
		InputStream is = url.openStream();
		OutputStream os = new FileOutputStream(destinationFile);

		byte[] b = new byte[2048];
		int length;

		while ((length = is.read(b)) != -1) {
			os.write(b, 0, length);
		}

		is.close();
		os.close();
	response.sendRedirect("Profile.jsp"); // redirect to profile.jsp after saving the profile pic

%>

</body>
</html>