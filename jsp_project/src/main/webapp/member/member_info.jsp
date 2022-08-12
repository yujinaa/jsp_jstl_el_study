<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var = "contextPath" value = "${pageContext.request.contextPath}"/>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>member_info.jsp<br>
<c:import url="../default/header.jsp"/>

	<h1>개인 정보 페이지</h1>
	id : ${param.id }<br>
	<jsp:useBean id="dao" class="com.care.root.member.dao.MemberDAO"/>
	<c:set var="mem" value="${dao.getMember(param.id) }"/> <!-- id넘기기 -->
	id : ${mem.id }<br>
	pwd : ${mem.pwd }<br>
	name : ${mem.name }<br>
	addr : ${mem.addr }<br>
	<hr>
	<!-- 수정 -->
	<button type="button" onclick="location.href='modify.jsp?id=${mem.id}'">수정 </button> <!-- onclick=location.href를 써줘야한다 -->
	<!-- 삭제 -->
	<c:set var = "userId" value = "${mem.id }" scope = "session"/>
	<button type="button" onclick="location.href='delete.jsp'">삭제 </button>
<c:import url="../default/footer.jsp"/>
</body>
</html>