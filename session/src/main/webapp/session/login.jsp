<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>login<hr>
	session : ${loginUser } , ${sessionScope.loginUser }<hr>
	<form action="chkUser.jsp" method="post">
		<input type="text" name ="id"><br>
		<input type="text" name ="pwd"><br>
		<input type="submit" value = "로그인">
	</form>
</body>
</html>