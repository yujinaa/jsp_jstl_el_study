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
<body>modify_save<br>
<%	request.setCharacterEncoding("utf-8");%>

	<h1>수정된 값 저장하기 페이지</h1>

<jsp:useBean id="dao" class = "com.care.root.member.dao.MemberDAO"/>
<jsp:useBean id="dto" class = "com.care.root.member.dto.MemberDTO"/>
<jsp:setProperty property="*" name="dto"/>                        <!-- 모든값 dto에 저장하기 -->

<c:set var= "result" value="${dao.modifysave(dto) }"/>  	
<c:choose>
	<c:when test="${result==1 }">
		<script type="text/javascript">
			alert('수정 성공입니다');
			location.href='member_info.jsp?id=${dto.getId()}'
		</script>
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
			alert("수정 실패입니다");
			location.href='modify.jsp?id=${dto.getId()}'
		</script>
	</c:otherwise>
</c:choose>
</body>
</html>