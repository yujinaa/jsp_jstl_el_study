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
	<% request.setCharacterEncoding("utf-8"); %>
	<%--깨지는 한글처리 --%>

	<jsp:useBean id="dao" class="com.care.root.board.dao.BoardDAO" />  <!-- dao객체 만들기 -->  
	${dao.modify( param.id, param.name, param.title, param.content ) } <!-- -> 넘어오는 값 param으로 받기 -->
	<c:redirect url="content_view.jsp?id=${param.id }" /> <!-- -> 수정된 내용으로 이동 -->
</body>
</html>