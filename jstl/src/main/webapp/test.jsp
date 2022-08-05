<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jstl을 쓰기 위해선 써줘야한다. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!--core의 명칭을 c로 사용하겠다: 별칭  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>jstl 문법 - 변수만들기</h1>
	<!-- c:set -> 변수설정 -->
	<!-- var -> 변수이름 -->
	<!-- value -> 값 -->
	<c:set var='n1' value = "안녕"/>
	<c:out value="c:out을 쓰면 출력된다."></c:out>
	<hr>
	<h1>el 문법</h1>
	${n1 }
</body>
</html>