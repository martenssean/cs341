<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="org.koushik.javabrains.*,java.util.*"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Day's Events</title>
</head>
<body style="background-color:lightblue">
<p align="right"><a href="Logout.jsp">Logout</a></p>

<FORM action="Calendar.jsp">
<input type="submit" value="Back">
</FORM>

<br>

<h1>Day's Events: <%String date = request.getParameter("id");
					out.println(date);
					int month, day, year;
					month = Integer.parseInt(date.substring(0,date.indexOf('/')));
					date = date.substring(date.indexOf('/')+1,date.length());
					day = Integer.parseInt(date.substring(0,date.indexOf('/')));
					date = date.substring(date.indexOf('/')+1,date.length());
					year = Integer.parseInt(date);
					%>
</h1>
					
<%
ArrayList<Event> events = new ArrayList<Event>();
TestData data = new TestData();

events = Schedule.events;
events = data.getEventArray(year, month, day);
String eventString = data.getEvents(year,month,day);

String output = "";
	for(int i = 0; i < events.size(); i++){
		Event e = events.get(i);
		date = e.getMonth() + "/" + e.getDay() + "/" + e.getYear();
		output += "<h2>"+e.getTitle()+"</h2>"+"<h3>"+date+
			" - from "+e.getStartTime()+" to "+e.getEndTime()+"</h3>"+e.getAbout()+"<br><br>";
		
	if(request.getParameter("userType") == "student")
		output += "<FORM action=\"Signup.jsp\">"+
					"<input type=\"submit\" value=\"Sign Up\">"+
					"</FORM><br>";	
					
	if(request.getParameter("userType") == "volunteer")
		output += "<FORM action=\"Signup.jsp\">"+
					"<input type=\"submit\" value=\"Volunteer\">"+
					"</FORM><br>";
			
	out.println(output);
	out.println();
	}
	
	data.close();
%>


</body>
</html>