
<%@page import="org.koushik.javabrains.TestData"%>
<body style="background-color: lightblue">
</body>
<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	out.println("logging in...<br>");
	//out.println(username+ " : "+ password +"<br>");
	//String nextUrl = "1;url=";
	
	// Here you put the check on the username and password
	TestData td = new TestData();
	//td.newUser("student", "student", 1, "Sean", "Martens", "martens.sean@uwlax.edu");
	String type = td.login2(username, password);
	if(type.length()<1){
		//out.print("TYPE ERROR <br>");
	}
	//out.print(type);
	//Save uID as and attribute
	session.setAttribute("uID", (String)td.login(username,password));
	td.close();
	
	if(type.equals("admin")){
		session.setAttribute("userType", type);
		%><meta http-equiv="Refresh" content="0;url=Admin.jsp"><%
	}else if (type.equals("student")){
		session.setAttribute("userType", type);
		%><meta http-equiv="Refresh" content="0;url=Student.jsp"><%
	}else if (type.equals("volunteer")){
		session.setAttribute("userType", type);
		%><meta http-equiv="Refresh" content="0;url=Volunteer.jsp"><%
	} else if (type.equals("sponsor")){
		session.setAttribute("userType", type);
		%><meta http-equiv="Refresh" content="0;url=Sponsor.jsp"><%
	}else{
		%><meta http-equiv="Refresh" content="0;url=Error.jsp"><%
	}%>
	
