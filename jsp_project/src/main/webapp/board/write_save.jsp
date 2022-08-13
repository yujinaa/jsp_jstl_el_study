<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 사용자가 넘겨주는 값 처리하기 -->
	<fmt:requestEncoding value="utf-8"/>
	
	<jsp:useBean id="dao" class="com.care.root.board.dao.BoardDAO"/>   <!--넘어오는 값 받아서 처리  --> 
	${dao.writeSave(param.name, param.title,param.content) }           <!-- param으로 name, title, content 3개 값을 넘겨준다 --> 
	<c:redirect url="list.jsp"/>                                      <!-- 실행이 되면 redirect로 넘겨준다 -->
	

	
</body>
</html>