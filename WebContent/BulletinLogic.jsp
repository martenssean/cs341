<%//Author: Sean Martens
//this is the logic behind sending a string without new line chars, instead we update the bulletin with <br> %>
<%@page import="org.koushik.javabrains.TestData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Processing</title>
</head>
<body style="background-color: lightblue">
<%String bullet = request.getParameter("bullet"); 
bullet = bullet.replace("\n", "<br>");
out.print(bullet);
TestData db = new TestData();
db.setBulletin(bullet);
db.close();
%>
</body>
</html>