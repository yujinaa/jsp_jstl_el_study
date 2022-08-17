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
<jsp:useBean id="dao" class="com.care.root.board.dao.BoardDAO"/>
<c:set var="dto" value="${dao.contentView(param.id, 0) }"/>   
<%--한명에 대한 정보 가져오기. 답변쪽에서도 똑같은 메소드를 호출하지만 0이라는 값을 줘서 조회수가 올라가지 않는다 --%>
<c:import url="../default/header.jsp" />
<div class = "wrap">
<form action="reply.jsp" method="post">
	<input type="hidden" name="id" value="${dto.id }">
	<input type="hidden" name="idgroup" value="${dto.idgroup }">
	<input type="hidden" name="step" value="${dto.step }">
	<input type="hidden" name="name" value="${dto.name }">
	
		<table border="1">    <%--사용자에게 보여질 테이블 만들기 --%>
		<tr> <th>번호</th> <td>${dto.id }</td> </tr>
		<tr> <th>조회수</th> <td>${dto.hit }</td>	</tr>
		<tr> <th>이름</th> <td>${dto.name }</td> </tr>
		<tr> 
			<th>제목</th> 
			<td>${dto.title }</td>
			<!-- <td><input type="text" name="title" value="${dto.title }"> </td>  제목바꾸고 싶으면 이렇게 -->
		</tr>
		<tr>
			<th>내용</th> <td><textarea rows="10" cols="30" name="content"></textarea> </td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="답변"> &nbsp; &nbsp;
				<a href="list.jsp">목록이동</a>
			</td>
		</tr>
	</table>
</form>
</div>

<c:import url="../default/footer.jsp" />

</body>
</html>