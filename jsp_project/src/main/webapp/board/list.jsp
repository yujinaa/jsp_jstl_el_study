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
	<!-- db에 접근해서 해당 데이터 가져오는 코드작성 -->
	<c:import url="../default/header.jsp" />
	<div class="wrap">
		<jsp:useBean id="dao" class="com.care.root.board.dao.BoardDAO" />
		<table border="1">
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>제목</th>
				<th>날짜</th>
				<th>조회수</th>
				<th>groupId</th>
				<th>step</th>
				<th>indent</th>
			</tr>
			
			<%--데이터얻어오기 --%>
			<c:forEach var="dto" items="${dao.list() }">
			
			</c:forEach>
		</table>
	</div>
	<c:import url="../default/footer.jsp" />
</body>
</html>