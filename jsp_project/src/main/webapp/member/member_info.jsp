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
<body>member_info.jsp<br>
<c:import url="../default/header.jsp"/>

	<h1>개인 정보 페이지</h1>
	id : ${param.id }<br>
	pwd : ${param.pwd }<br>
<c:import url="../default/footer.jsp"/>
</body>
</html>