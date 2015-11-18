<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin</title>
</head>
<body>
<body style="background-color:lightblue">
<p align="right"><a href="Logout.jsp">Logout</a></p>
<H1><%out.print("Welcome Admin");

%>
</H1>
<br>
	<center>
	<br>
	<a href="Calendar.jsp">View Calendar</a>
	<br>
	<a href="EditUsers.jsp">Edit Users</a>
	<br>
	<a href="BulletinUpdate.jsp">Update Bulletin</a>
	<br>
	<a href="PrintableDatabase.jsp">Printable Database</a>
	</center>
</body>
</html>