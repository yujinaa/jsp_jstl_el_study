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
<c:import url="../default/header.jsp" />
<div class="wrap">
		<jsp:useBean id="dao" class="com.care.root.board.dao.BoardDAO"/>
		<c:set var="dto" value="${dao.contentView(param.id) }"/> <%--데이터 얻어오기 , 이러고 DAO에 contentView만들기--%>
</div>
<c:import url="../default/footer.jsp" />
</body>
</html>