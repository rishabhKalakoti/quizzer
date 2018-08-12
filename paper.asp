<%
	'taking values from form
	dim q_no, correct_ans, wrong_ans
	q_no=session("q_no")
	correct_ans=session("correct_ans")
	wrong_ans=session("wrong_ans")
	score=session("score")
	paper=request.form("paper")
		
'	checking form values and giving values if the present values are null
	if session("q_no")=0 then
		session("q_no")=1
		session("correct_ans")=0
		session("wrong_ans")=0
		session("score")=0
	end if
			
	'connecting to the ms-acess database using DSN
	dim con, record
	set con=server.createobject("ADODB.Connection")
	con.open "DSN=upsc_data"
	set record=server.createobject("ADODB.RecordSet")
	'set record="SELECT * FROM set_1 WHERE ques_no="q_no
	record.open paper, con
'	record.open "select * from set_1 where ques_no='" & q_no & "'", con
		
	'loop through the records to find the desired one
	for q=1 to session("q_no") step 1
		record.movenext
	next
%>

<% if not record.eof then%>

<html>
	<head>
		<link rel="shortcut icon" href="./favicon.ico" type="image/x-icon" />
		<link rel="icon" href="./favicon.ico" type="image/x-icon" />
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
		
		<form action="paper_process.asp" method="post">
			Your question is:<br><b><%=record("question")%></b>
			<hr>
			<input type="hidden" name="paper" value="<%=paper%>">
			<select name="answer" size="4">
				<option value='1' selected>		<%=record("ans_1")%>	</option>
				<option value='2'>				<%=record("ans_2")%>	</option>
				<option value='3'>				<%=record("ans_3")%>	</option>
				<option value='4'>				<%=record("ans_4")%>	</option>
			</select>
			<hr>
			<input type="submit" value="Attempt">
		</form>
	</body>
</html>

<%else%>

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
		<h1 align="center">THANK YOU!</h1>
		<hr>
		<form method="post" action="write_score.asp">
			<input type="hidden" name="paper" value="<%=paper%>">
			<input type="submit" value="Proceed">
		</form>
	</body>
</html>

<%end if%>

<%
	record.close
	con.close
	set record=nothing
	set con=nothing
%>