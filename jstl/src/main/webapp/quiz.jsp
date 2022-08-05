<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="result.jsp">
		<input type="text" name="num" placeholder="input number"><br>
		<input type="radio" name="gender" value="남자입니다">남
		<input type="radio" name="gender" value="여자입니다">여<br><!-- value값이 넘어간다 -->
		<input type="submit" value="submit">
	</form>
</body>
</html>