<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>webContent.jsp</h1>
	<hr>
	<!-- 경로이동 방법1. -->
	<a href="http://localhost:8088/jsp/test1/test1.jsp">test1 페이지로 이동</a>
	<a href="http://localhost:8088/jsp/test1/test2/test2.jsp">test2 페이지로 이동</a>
	<hr>
	<!-- 경로이동 방법2.절대경로 -->
	<a href="/jsp/test1/test1.jsp">test1 페이지로 이동</a> <!-- 절대경로는 /을 붙인다 -->
	<a href="/jsp/test1/test2/test2.jsp">test2 페이지로 이동</a>
	<hr>
	<!-- 경로이동 방법3.상대경로 -->
</body>
</html>