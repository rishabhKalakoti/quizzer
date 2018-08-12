<%
	response.write(session("username"))
	session("username")=0
	response.redirect "login.asp"
%>