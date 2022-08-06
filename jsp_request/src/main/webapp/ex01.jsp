<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><!-- 이걸 써야 사용가능 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 절대경로지정하기 -->
	<%= request.getContextPath() %><br> <!-- request.getContextPath() : 현재 배포하는 프로젝트 이름 -->
	${pageContext.request.contextPath }
	<hr>
	<c:set var="contextPath" value ="${pageContext.request.contextPath }"/><!-- 경로를 var변수로 만들고 -->
	<c:set var="contextPath1" value ="<%= request.getContextPath() %>"/>
	<br>path : ${contextPath }<br> <!-- 그 변수를 출력한다 -->
	path1 : ${contextPath1 }<br>
	
	<a href = "${contextPath1 }/ex01_1.jsp">경로이동</a>
	<a href = "<%= request.getContextPath() %>/ex01_1.jsp">경로이동</a>
	<hr>
	<form action="${contextPath1 }/ex01_1.jsp">
		<input type="checkbox" name = "check" value="초코">초코라떼
		<input type="checkbox" name = "check" value="바닐라">바닐라라떼
		<input type="checkbox" name = "check" value="에이드">레몬에이드
		<br>
		<input type="submit" value = "전송">
	</form>
	
</body>
</html>