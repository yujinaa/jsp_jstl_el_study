<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table{
		margin: 0 auto;
		border-color: #FFB400;		
		width: 700px;
	}
	a{
		float: right;
	}
</style>
</head>
<body>
	<!-- db에 접근해서 해당 데이터 가져오는 코드작성 -->
	<c:import url="../default/header.jsp" />
	<div class="wrap" style="margin-top: 20px; ">
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
				<tr>
					<%--각각의 데이터값 저장하기 --%>
					<td>{dto.id}</td>
					<td>{dto.name}</td>
					<td>{dto.title}</td>
					<td>{dto.savedate}</td>
					<td>{dto.hit}</td>
					<td>{dto.idgroup}</td>
					<td>{dto.step}</td>
					<td>{dto.indent}</td>
				</tr>
			</c:forEach>
			<tr><%--글 작성부분  --%>
				<td colspan="8">
					<a href="write_view.jsp">글작성</a>
				</td>
			</tr>
		</table>
	</div>
	<c:import url="../default/footer.jsp" />
</body>
</html>