
<!doctype html>
<html lang=''>
<head>
<style type="text/css">
@import url(http://fonts.googleapis.com/css?family=Raleway);
#cssmenu,
#cssmenu ul,
#cssmenu ul li,
#cssmenu ul li a {
  margin: 0;
  padding: 0;
  border: 0;
  list-style: none;
  line-height: 1;
  display: block;
  position: relative;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}
#cssmenu:after,
#cssmenu > ul:after {
  content: ".";
  display: block;
  clear: both;
  visibility: hidden;
  line-height: 0;
  height: 0;
}
#cssmenu {
  width: auto;
  border-bottom: 3px solid #47c9af;
  font-family: Raleway, sans-serif;
  line-height: 1;
}
#cssmenu ul {
  background: #0;
}
#cssmenu > ul > li {
  float: left;
}
#cssmenu.align-center > ul {
  font-size: 0;
  text-align: center;
}
#cssmenu.align-center > ul > li {
  display: inline-block;
  float: none;
}
#cssmenu.align-right > ul > li {
  float: right;
}
#cssmenu.align-right > ul > li > a {
  margin-right: 0;
  margin-left: -4px;
}
#cssmenu > ul > li > a {
  z-index: 2;
  padding: 18px 25px 12px 25px;
  font-size: 15px;
  font-weight: 400;
  text-decoration: none;
  color: #444444;
  -webkit-transition: all .2s ease;
  -moz-transition: all .2s ease;
  -ms-transition: all .2s ease;
  -o-transition: all .2s ease;
  transition: all .2s ease;
  margin-right: -4px;
}
#cssmenu > ul > li.active > a,
#cssmenu > ul > li:hover > a,
#cssmenu > ul > li > a:hover {
  color: #ffffff;
}
#cssmenu > ul > li > a:after {
  position: absolute;
  left: 0;
  bottom: 0;
  right: 0;
  z-index: -1;
  width: 100%;
  height: 120%;
  border-top-left-radius: 8px;
  border-top-right-radius: 8px;
  content: "";
  -webkit-transition: all .2s ease;
  -o-transition: all .2s ease;
  transition: all .2s ease;
  -webkit-transform: perspective(5px) rotateX(2deg);
  -webkit-transform-origin: bottom;
  -moz-transform: perspective(5px) rotateX(2deg);
  -moz-transform-origin: bottom;
  transform: perspective(5px) rotateX(2deg);
  transform-origin: bottom;
}
#cssmenu > ul > li.active > a:after,
#cssmenu > ul > li:hover > a:after,
#cssmenu > ul > li > a:hover:after {
  background: #47c9af;
}

</style>
   <meta charset='utf-8'>
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="styles.css">
   <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
   <script src="script.js"></script>
   <title>Login</title>
</head>
<body>

<div id='cssmenu'>
<ul>
   <li class='active'><a href='Login.jsp'>Login</a></li>
   <li><a href='News.jsp'>News</a></li>
   <li><a href='NewUser.jsp'>Request Account</a></li>
   <li white-space:nowrap><a href='Calendar.jsp'>Calendar</a></li>
</ul>
</div>
<body style="background-color: lightblue">
	<center>
	<H1>Holmen High School Robotics Portal</H1>

		<%
			String myname = (String) session.getAttribute("username");

			if (myname != null) {
				out.println("Welcome  " + myname
						+ ",<a href=\"Logout.jsp\" >Logout</a>");
			} else {
		%>
		<form METHOD="POST" action="LoginCheck.jsp">
			<table>
				<tr>
					<td>Username :</td>
					<td><input name="username" size=15 type="text" /></td>
				</tr>
				<tr>
					<td>Password :</td>
					<td><input type="password" name="password" size=15 type="text" />
					</td>
				</tr>
			</table>

			<input type="submit" value="login" />
		</form>
		<%
			}
		%>
		<img src="http://i.stack.imgur.com/ASm92.png"> <br>

	</center>
</BODY>
</HTML>



