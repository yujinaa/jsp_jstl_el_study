<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>form<br>
<h1>get방식</h1>
	<form action="getMethod.jsp" method="get"><!-- 경로, method="메소드 지정" -->
		<input type="text" name="id" placeholder="input ID"><br><!-- name을 적어야 해당정보를 전달한다 -->
		<input type="password" name = "pwd" placeholder="input PASSWORD"><br>
		<input type="submit" value ="전송"><!-- submit을 클릭하면 해당액션이 가지고있는 위치로 이동 -->
	</form>

</body>
</html>