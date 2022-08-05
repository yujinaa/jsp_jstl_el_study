<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>postMethod<br>

<% 
   request.setCharacterEncoding("utf-8"); // 요청시 깨지는 한글처리 
   response.setCharacterEncoding("utf-8"); //응답시 깨지는 한글처리
%> 
	<h1>postMethod 페이지</h1>
	<hr>
	아이디 : <%= request.getParameter("id") %><br><!-- 사용자가 넘겨준값을 받아올땐 request.getParameter를 사용 -->
	비밀번호 : <%= request.getParameter("pwd") %><br>
	<hr>
	<h3>el로 데이터 받기 : param을 사용해서 얻어온다</h3>
	${param.id }<br>
	${param.pwd }<br>

</body>
</html>