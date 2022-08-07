<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>chkUser<hr>
<!-- 변수 설정 (db있다는 가정하에) -->
	<c:set var="dbId" value="1"/>
	<c:set var="dbPwd" value="1"/>
	<c:set var="inputId" value="${param.id }"/>
	<c:set var="inputPwd" value="${param.pwd }"/>
	<c:choose>
		<c:when test="${dbId == inputId && dbPwd == inputPwd }"> <!-- 로그인성공시 -->
			<c:redirect url="main.jsp"/>
		</c:when>
		<c:otherwise> <!-- 로그인실패시 -->
			<c:redirect url ="login.jsp"/>
		</c:otherwise>
	</c:choose>
</body>
</html>