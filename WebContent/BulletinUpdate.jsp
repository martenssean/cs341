<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Update Bulletin</title>
</head>
<body style="background-color: lightblue">
<FORM ACTION="BulletinLogic.jsp" METHOD="POST">
            Edit the Bulletin:
            <BR>
            <TEXTAREA NAME="bullet" COLS= "70" ROWS="20"></TEXTAREA>
            <BR>
            <INPUT TYPE="SUBMIT" VALUE="Submit">
        </FORM>
        <a href="Admin.jsp">Cancel</a>
	<br>
</body>
</html>