<%@page import="java.io.IOException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.Blob"%>
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

HttpSession s = request.getSession();
String user_id=(String)s.getAttribute("Userid");
String filePath = "C:/Users/Inspiron/workspace1/DiscussionForum1/WebContent/Images/"+user_id+".jpg";
int BUFFER_SIZE = 2048;
try {
    Connection conn=Connect.getConnection();
    PreparedStatement statement = conn.prepareStatement("select Profile_Pic from register where user_id=?");
    statement.setString(1, user_id);

    ResultSet result = statement.executeQuery();
    if (result.next()) {
        Blob blob = result.getBlob("Profile_Pic");
        InputStream inputStream = blob.getBinaryStream();
        OutputStream outputStream = new FileOutputStream(filePath);

        int bytesRead = -1;
        byte[] buffer = new byte[BUFFER_SIZE];
        while ((bytesRead = inputStream.read(buffer)) != -1) {
            outputStream.write(buffer, 0, bytesRead);
        }

        inputStream.close();
        outputStream.close();
        out.println("File saved");
    }
    conn.close();
} catch (SQLException ex) {
    ex.printStackTrace();
} catch (IOException ex) {
    ex.printStackTrace();
}

response.sendRedirect("EditProfile.jsp");
%>





</body>
</html>