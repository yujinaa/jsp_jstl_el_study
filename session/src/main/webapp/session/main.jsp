<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>main<hr color="red">
	<c:choose>
		<c:when test="${loginUser == null}">
			<script>
				alert("로그인 먼저하세요!");
				location.href="login.jsp" //경로이동
			</script> 
			<%-- 서버단에서 먼저 처리하기 때문에 alert창이 뜨지 않는다
			<c:redirect url="login.jsp"/>
			--%>
		</c:when>
		<c:otherwise>
			<script>alert("${loginUser }님 환영합니다!");</script> 
		</c:otherwise>
	</c:choose>
			로그인 성공한 사용자만 입장 가능합니다.<hr color="red">
	<a href="login.jsp">로그인_페이지로 이동</a>
	<a href="logout.jsp">로그아웃_페이지로 이동</a>
</body>
</html>