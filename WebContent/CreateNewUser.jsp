<%//Author Sean Martens
//this is the logic page for creating a new user%>
<%@page import="org.koushik.javabrains.TestData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Creating...</title>
</head>
<body>
	We can possibly hide this page and just use it for logic.
	<br> Arguments:
	<%
String nextPage = "\"Login.jsp\"";
String fname = request.getParameter("fname");
String lname = request.getParameter("lname");
String eadd = request.getParameter("eadd");
String dusername = request.getParameter("dusername");
String dpassword = request.getParameter("dpassword");
out.print(fname +" "+ lname +" "+ eadd +" "+ dusername +" "+dpassword+" isStudent:"+request.getParameter("student")+" isVol:"+request.getParameter("vol")); 
TestData td = new TestData();
//figure out user type
int userType = -1;
if(request.getParameter("student") !=null){
	userType=2;
}else if(request.getParameter("vol") !=null){
	userType=1;
}else if(request.getParameter("sponsor") !=null){
	userType=3;
}else if(request.getParameter("admin") !=null){
	userType = 0;
}
// Here we are error catching
//userType = -1 means no box was checked
//and check for 0 length strings. 
boolean createUser = true;
if(userType == -1 || fname.length() == 0 || lname.length() == 0 || eadd.length() == 0 
|| dusername.length() == 0 || dpassword.length() == 0){
	//if we got here, there was a user error...
	%><jsp:forward page = "NewUser.jsp" /><%
	createUser = false;
}
if(createUser){
	out.print("<br> NewUser Created");
	boolean b = td.newUser(dusername, dpassword,userType, fname, lname, eadd);
	td.close();
	if(!b){
		%><jsp:forward page = "NewUser.jsp" /><%
	}
}


%><meta http-equiv="Refresh" content="0;url=NewUserSubmitted.jsp">


	<br>
	
	<br>
</body>
</html>