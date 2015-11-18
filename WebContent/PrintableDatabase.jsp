<%//Author Sean Martens
//This will print the database tables to screen, and an admin could then print them to paper %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="org.koushik.javabrains.TestData"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title><%java.util.Date now = new java.util.Date(); out.print(now.toString().substring(4,16)+" " +now.toString().substring(24,28)); %></title>
</head>
<body>
Database tables requested at: <%out.print(now.toString().substring(4,19)+" " +now.toString().substring(24,28));  %>
<br><br>
<% TestData db = new TestData();
try{
	out.print(db.jspOutData());
}catch(Exception e){
	//meh
}
%>
</body>
</html>