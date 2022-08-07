<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>logout<hr>
	<% session.invalidate(); %> <%--invalidate : 모든 세션 종료 --%>
	<a href="login.jsp">로그인이동하기</a>
	<a href="main.jsp">main이동하기</a>
</body>
</html>