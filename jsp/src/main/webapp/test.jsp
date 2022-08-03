<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>연습중</h1>
	<%
		int num = 50;
		System.out.print("결과 : " + num);//서버단 콘솔창에만 출력된다
		out.print("결과1 : " + num + "<b>이에요</b>"); //out.print : 사용자(웹페이지로 전달)에게 보내고 싶을 때 사용
	%>
	
	<!-- <%= %> : 표현식 -->
	<%= "결과2 : " + num + "<b>이에요</b>" %>

</body>
</html>