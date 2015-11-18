<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="org.koushik.javabrains.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>NewEvent</title>
</head>

<%
//if(request.getParameter("UserType") != "admin") request.getRequestDispatcher("/Calendar.jsp").forward(request, response);
%>

<body style="background-color:lightblue">
<p align="right"><a href="Logout.jsp">Logout</a></p>


<FORM action="/Schedule/Schedule" method="post">
Event Name: <INPUT type="text" name="title" size="35">
<BR>
Date: <INPUT type="text" name="month" maxLength="2" size="1"> / 
<INPUT type="text" name="day" maxLength="2" size="1"> / 
<INPUT type="text" name="year" maxLength="4" size="2">
(mm/dd/yyyy)

<br>
Time: from <INPUT type="text" name="startTime" size="5">
to <INPUT type="text" name="endTime" size="5">
<BR>
<BR>
Details: <br><textarea name="about" cols="60" rows="15"></textarea>
<BR>
<BR>
<INPUT type="submit" name="Submit" value="Add Event">
</FORM>
<br>

<FORM action="Calendar.jsp">
<input type="submit" value="Back">
</FORM>

</body>
</html>