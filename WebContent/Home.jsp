<%@page contentType="text/html" pageEncoding="UTF-8"
	errorPage="Error.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
</head>
<body>
<p align="right"><a href="Logout.jsp">Logout</a></p>
	<br />
	<br />
	<br />
	<br />
	<br />
	<center>
		<h2>
			<%
				String a = session.getAttribute("username").toString();
				out.println("Hello " + a);
			%>
		</h2>
		<br /> <br /> <br />
		<br />
		<br />
		<br />
		<br /> <a href="Logout.jsp">Logout</a>
	</center>
</body>
</html>

