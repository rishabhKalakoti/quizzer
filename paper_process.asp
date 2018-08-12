<%
	paper=request.form("paper")
	ans = request.form("answer")
	
	'connecting to the ms-acess database using DSN
	dim con, record
	set con=server.createobject("ADODB.Connection")
	con.open "DSN=upsc_data"
	set record=server.createobject("ADODB.RecordSet")
	record.open paper, con
	'record.open "SELECT ques_no FROM set_1 WHERE ques_no=q_no", con
	'record=con.execute("SELECT * FROM question WHERE ques_no=" q_no)

	'loop through the records to find the desired one
	for q=1 to session("q_no") step 1
		record.movenext
	next
	
	if ans = record("correct") then
		session("correct_ans")=session("correct_ans")+1
		session("score") = session("score")+4
		message="Congratulations! Your answer is correct."
	else
		session("wrong_ans")=session("wrong_ans")+1
		session("score") = session("score")-1
		message="Sorry... Your answer is incorrect."
	end if
	session("q_no") = session("q_no")+1
%>

<html>
	<head>
		<title>UPSC PRACTICE PAPER</title>
	</head>
	<body>
		<h1 align="center">UPSC PRACTICE PAPER</h1>
		<hr>
		Questions attempted:<%=session("q_no")-1%><br>
		Correct answers:<%=session("correct_ans")%><br>
		Wrong answers:<%=session("wrong_ans")%><br>
		Score:<%=session("score")%><br>
		<hr>
		<b><%=message%></b>
		<hr>
		REFRENCE:<br>
		<%=record("reference")%>
		<hr>
		<form action="paper.asp" method="post">
			<input type="hidden" name="paper" value="<%=paper%>">
			<input type="submit" value="Proceed">
		</form>
	</body>
</html>

<%
	record.close
	con.close
	set record=nothing
	set con=nothing
%>