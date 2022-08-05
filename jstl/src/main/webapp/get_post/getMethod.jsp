<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>getMethod<br> <!-- form에서 사용자가 id,pwd를 요청했으니 이 페이지에서 응답으로 id,pwd를 가져온다 -->
	<h1>getMethod 페이지</h1>
	<hr>
	아이디 : <%= request.getParameter("id") %><br><!-- 사용자가 넘겨준값을 받아올땐 request.getParameter를 사용 -->
	비밀번호 : <%= request.getParameter("pwd") %><br>
	<hr>
	<h3>el로 데이터 받기 : param을 사용해서 얻어온다</h3>
	${param.id }<br>
	${param.pwd }<br>
	<hr>
	<a href="http://localhost:8088/jsp/webContent.jsp">webContent 페이지로 이동</a>
	<a href="http://localhost:8088/jsp/test1/test1.jsp">test1 페이지로 이동</a>
	<a href="http://localhost:8088/jsp/test1/test2/test2.jsp">test2 페이지로 이동</a>
	<hr>
	<h1>절대경로</h1>
	<a href="/jsp/webContent.jsp">webContent 페이지로 이동</a>
	<a href="/jsp/test1/test1.jsp">test1 페이지로 이동</a>
	<a href="/jsp/test1/test2/test2.jsp">test2 페이지로 이동</a>
	<hr>
	<h1>상대경로</h1>
	<a href="../webContent.jsp">webContent 페이지로 이동</a>
	<a href="../test1/test1.jsp">test1 페이지로 이동</a>
	<a href="../test1/test2/test2.jsp">test2 페이지로 이동</a>
</body>
</html>