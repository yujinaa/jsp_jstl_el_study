<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>index<hr>
<!-- 쿠키는 jsp로 잘 만들지 않지만 연습으로 만들어보자! -->

<!-- 
	session : 서버에서 관리하는 값
	cookie : 클라이언트가 관리하는 값(시간을 설정한다)
 -->
	<h1>CARE_LAB</h1>
	<h3>환영합니다</h3>
	
	<%
		Cookie cookie = new Cookie("testCookie","myCookie"); //쿠키 생성
		cookie.setMaxAge(5); //쿠키유지시간 설정(5초동안 유지)
		response.addCookie(cookie); //응답 : 사용자에게 쿠키값 전달
	%>
	<script type="text/javascript">
		window.open("popup.jsp","","width=300,height=200,top=500,left=500")
	</script>

</body>
</html>