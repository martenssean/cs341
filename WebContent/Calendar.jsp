<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="org.koushik.javabrains.*,java.util.*,java.text.*"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Upcoming Events</title>
</head>

<body style="background-color:lightblue">
<p align="right"><a href="Logout.jsp">Logout</a></p>

Click on a colored day to view it's events. <br><br>

<%
String newEventButton = "<FORM action=\"NewEvent.jsp\">"+
						"<input type=\"submit\" value=\"New Event\">"+
						"</FORM><br>";
						
//if(request.getParameter("userType") == "admin" || request.getParameter("userType") == "volunteer")
	out.println(newEventButton);

Calendar cal = Calendar.getInstance();
int monthNum = cal.get(Calendar.MONTH);

if (request.getParameter("monthScroll")!= null) monthNum = -1 + Integer.parseInt(request.getParameter("id"));
	
cal.set(Calendar.MONTH, monthNum);

monthNum++;

String monthName = new SimpleDateFormat("MMMM").format(cal.getTime());
int year = cal.get(Calendar.YEAR);

cal.set(Calendar.DAY_OF_MONTH, 1);
Date monthStart = cal.getTime();

cal.setTime(monthStart);
int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
int daysInMonth = cal.getActualMaximum(Calendar.DAY_OF_MONTH);

String calendarCode = "<TABLE BORDER=3 CELLSPACING=3 CELLPADDING=3>" +
						"<TR>" +
						"<TD COLSPAN=\"7\" ALIGN=center><B>" + monthName + " " + year + "</B></TD>" +
						"</TR>";

calendarCode += "<TR> <TD ALIGN=center>Sun</TD><TD ALIGN=center>Mon</TD>"+
"<TD ALIGN=center>Tue</TD><TD ALIGN=center>Wed</TD><TD ALIGN=center>Thu</TD>"+
"<TD ALIGN=center>Fri</TD><TD ALIGN=center>Sat</TD></TR>";
calendarCode += "<TR>";

int dayNum = 1;
for(int i=1; i<dayOfWeek; i++){
	calendarCode += "<TD ALIGN=center> </TD>";
}
TestData data = new TestData();
for(int j=dayOfWeek; j<=7;j++){
	boolean areEvents = data.getEventArray(cal.get(Calendar.YEAR), monthNum, dayNum).size() > 0;
	//boolean areEvents = false;
	calendarCode += "<TD ALIGN=center>"+
					"<FORM action=\"Day.jsp\">" + "<input type=\"hidden\"" + 
					"name=\"id\" value=\"" + monthNum + "/" + dayNum + "/" + cal.get(Calendar.YEAR) + "\">" +
					"<input type=\"submit\"";
	if(areEvents) calendarCode += "style=\"background-color:#cc0000; color: #ffffff;\"";				
	calendarCode += "id=\"" + monthNum + "/" + dayNum + "/" + cal.get(Calendar.YEAR) + "name=\"date\" value=\""+dayNum+++"\">"+
					"</FORM>"+
					"</TD>";
}
calendarCode += "</TR>";
while(dayNum <= daysInMonth){
	calendarCode += "<TR>";
	for(int d=1; d <= 7; d++){
		boolean areEvents = data.getEventArray(cal.get(Calendar.YEAR), monthNum, dayNum).size() > 0;
		//boolean areEvents = false;
		calendarCode += "<TD ALIGN=center>"+
					"<FORM action=\"Day.jsp\">" + "<input type=\"hidden\"" + 
					"name=\"id\" value=\"" + monthNum + "/" + dayNum + "/" + cal.get(Calendar.YEAR) + "\">" +
					"<input type=\"submit\"";
		if(areEvents) calendarCode += "style=\"background-color:#cc0000; color: #ffffff;\"";				
		calendarCode += "id=\"" + monthNum + "/" + dayNum + "/" + cal.get(Calendar.YEAR) + "name=\"date\" value=\""+dayNum+++"\">"+
					"</FORM>"+
					"</TD>";
		if (dayNum > daysInMonth) break;
	}
	calendarCode += "</TR>";
}
calendarCode += "</TABLE>";

out.println(calendarCode);
data.close();

%>

<FORM action="Calendar.jsp">
<input type="hidden" name="id" value="<%=monthNum-1%>">
<INPUT type="submit" id="<%=monthNum-1%>" name="monthScroll" value="back">
</FORM>

<FORM action="Calendar.jsp">
<input type="hidden" name="id" value="<%=monthNum+1%>">
<INPUT type="submit" id="<%=monthNum+1 %>" name="monthScroll" value="forward">
</FORM>

</body>
</html>