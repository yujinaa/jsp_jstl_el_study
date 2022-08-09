<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var = "contextPath" value = "${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>login.jsp<hr>
	<form action="${pageContext }/login_param/chkUser.jsp" method="post">
		<input type="text" name = "id"><br>
		<input type="password" name = "pwd"><br>
		<input type="radio" name = "user" value="user" checked="checked">사용자
		<input type="radio" name = "user" value="admin">관리자<br>
		<input type="submit"value="로그인">		
	</form>

</body>
</html>