<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:import url="../default/header.jsp"/>
<div class="wrap">
	<form action="" method="post">
		<input type="text" name ="id" placeholder="input id"><br>
		<input type="password" name ="pwd" placeholder="input password"><br>
		<input type="submit" value="로그인">
		<a hrdf="${contextPath }/member/member_register.jsp">회원가입</a>
	</form>
</div>

<c:import url="../default/footer.jsp"/>
</body>
</html>