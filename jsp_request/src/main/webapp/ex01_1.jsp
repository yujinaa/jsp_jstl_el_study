<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>ex01_1<br>
	<%
		String checkbox = request.getParameter("check"); //checkbox는 getParameter를 사용하면 값을 한개만 넘긴다
		String[] values = request.getParameterValues("check"); //값을 여러개 받으려면 배열을 만들어준다.
	%>
	<%= checkbox %><hr> <!-- 값 한개만 -->
	<%= values[0] %><%= values[1] %><%= values[2] %><!-- 값 여러개 -->

</body>
</html>