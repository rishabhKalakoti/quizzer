<%
	username=session("username")
	score=session("score")
	paper=request.form("paper")
	
	'connecting to the ms-acess database using DSN
	dim con, record
	set con=server.createobject("ADODB.Connection")
	con.open "DSN=upsc_data"
	set record=server.createobject("ADODB.RecordSet")
'	record.open "user", con, 2, 2
	record.open "select * from score where username='" & username & "'", con, 2, 2
	
	session("q_no")=0
	session("correct_ans")=0
	session("wrong_ans")=0
	session("score")=0
	
	record(paper)=score
	record.update
	response.redirect "home.asp"
%>

<%
	record.close
	con.close
	set record=nothing
	set con=nothing
%>