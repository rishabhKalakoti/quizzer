<%
	dim username, password
	username=request.form("username")
	password=request.form("password")
	
	dim con, record
	set con=server.createobject("ADODB.Connection")
	con.open "DSN=upsc_data"
	set record=server.createobject("ADODB.RecordSet")
	record.open "user", con
'	record.open "select * from user where username='" & username & "'", con
	
	if  record("password")=password then
		session("username")=username
		response.redirect "home.asp"
	else
		response.write("invalid username or password")
		response.write("<br>")
		response.write("<input type='button' value='back' onclick='history.back()'>")
	end if
%>

<%
	record.close
	con.close
	set record=nothing
	set con=nothing
%>