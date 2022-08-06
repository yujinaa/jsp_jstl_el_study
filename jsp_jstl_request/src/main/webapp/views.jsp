<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	name : ${param.name }<br>
	gender : ${param.gender }<br>
	<c:forEach var = "weather" items="${paramValues.weather }">
		season:${weather }<br>
	</c:forEach>
</body>
</html>