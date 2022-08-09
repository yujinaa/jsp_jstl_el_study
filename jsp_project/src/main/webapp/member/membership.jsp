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
<body>membership.jsp<br>
	<c:import url="../default/header.jsp"/>
	<jsp:useBean id="dao" class="com.care.root.member.dao.MemberDAO"/>
	
	<c:set var="list" value = "${dao.getMemberList() }"/> <!-- dao의 getMemberList라는 메소드 호출 -->
	리턴 값 : ${list }
	
	
	<c:import url="../default/footer.jsp"/>

</body>
</html>