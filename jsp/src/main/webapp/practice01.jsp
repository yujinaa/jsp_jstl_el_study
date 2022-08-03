<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>자바 명령어로 덧셈 연산하기</h1>
	<% int num1 = 10; int num2 = 20; 
	   int sum = num1+num2;
		out.print("10 + 20 =" +  sum + "<br>");	
	%>
	<%="10 + 20 =" +  sum  %>

</body>
</html>