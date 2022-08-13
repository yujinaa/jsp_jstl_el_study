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
	<jsp:useBean id="dao" class="com.care.root.login.dao.LoginDAO"/>
	<c:set var="result" value="${dao.loginChk(param.id, param.pwd) }"/>  <!-- loginChk로 넘어오는 id,pwd 넘기기 -->
	<c:choose>
		<c:when test="${result ==0 }">
			로그인성공
			<c:set var="loginUser" value="${param.id }" scope="session"/>  <!-- 세션 만들기 -->
			<script type="text/javascript">
				alert('${param.id }님 환영합니다!!!')
				location.href = "${contextPath }/default/main.jsp"
			</script>
		</c:when>
			
		<c:when test="${result ==1 }">
			비밀번호 틀림
			<script type="text/javascript">
				alert('비밀번호 틀림')
				location.href = "${contextPath }/login/login.jsp"
			</script>
		</c:when>
		<c:otherwise>
			해당 아이디는 존재하지 않습니다.
			<script type="text/javascript">
				alert('해당 아이디는 존재하지 않습니다.')
				location.href = "${contextPath }/login/login.jsp"
			</script>
		</c:otherwise>
	</c:choose>

</body>
</html>