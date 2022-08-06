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
		String checkbox = request.getParameter("check");
	%>
	<%= checkbox %>

</body>
</html>