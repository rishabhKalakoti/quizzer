<%
	username=session("username")
	
	set con=server.createobject("ADODB.Connection")
	con.open "DSN=upsc_data"
	set record=server.createobject("ADODB.RecordSet")
'	record.open "user", con
	record.open "select * from user where username='" & username & "'", con
	
	first_name=record("first_name")
%>

<%
	record.close
	con.close
	set record=nothing
	set con=nothing
%>

<%
	set con=server.createobject("ADODB.Connection")
	con.open "DSN=upsc_data"
	set record=server.createobject("ADODB.RecordSet")
	record.open "select * from score where username='" & username & "'", con
%>

<html>
	<head>
		<link rel="icon" href="./favicon.ico" type="image/x-icon" />
		<link rel="shortcut icon" href="./favicon.ico" type="image/x-icon" />
		<title>UPSC PPRACTICE PAPER</title>
	</head>
	
	<body>
		<h1 align="center">UPSC PRACTICE PAPER</h1>
		<hr>
		Welcome <%=first_name%>
		<hr>
		
		<form method="post" action="paper.asp">
			<select name="paper">
				<option value="gs_set_1">General Science- set 1</option>
			</select>
			<br>
			<input type="submit" value="submit">
		</form>
		<hr>
		Your present score is given below:
		<table border=1 width="50%">
			<%for i=2 to record.fields.count-1%>
			<tr>
			<td><%=record(i).name%></td>
			<td><%=record(i).value%></td>
			</tr>
			<%next%>
		</table>
		<br>
		<form action="logout.asp" method="post">
			<input type="submit" value="log out">
		</form>
	</body>
</html>

<%
	record.close
	con.close
	set record=nothing
	set con=nothing
%>