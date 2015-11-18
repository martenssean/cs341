<br><meta http-equiv="Refresh" content="1;url=Login.jsp">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Logout</title>
</head>
<body>
	<%
		session.removeAttribute("username");
		session.removeAttribute("password");
		session.invalidate();
	%>
	<h1>Logout was successful.</h1>
	
</body>
</html>
<%
	//String redirectURL = "Login.jsp";
	//response.sendRedirect(redirectURL);
%>
