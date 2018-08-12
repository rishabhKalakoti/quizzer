<html>
	<head>
		<link rel="shortcut icon" href="./favicon.ico" type="image/x-icon" />
		<link rel="icon" href="./favicon.ico" type="image/x-icon" />
		<title>UPSC PPRACTICE PAPER</title>
		<script language="vbscript">
			sub submit_onclick
				username=document.input_form.username.value
				password=document.input_form.password.value
				if len(username)=0 or len(password)=0 then
					document.write("please fill all the input fields." & "<br>")
					document.write("<input type='button' value='back' onclick='history.back()'>")
				end if
			end sub
		</script>
	</head>
	
	<body>
		<h1 align="center">UPSC PPRACTICE PAPER</h1>
		<hr>
		<form method="post" action="login_process.asp" name="input_form">
			Username:
			<input type="text" name="username"><br>
			Password:
			<input type="password" name="password"><br>
			<input type="submit" value="login" name="submit">
		</form>
		<hr>
	</body>
</html>