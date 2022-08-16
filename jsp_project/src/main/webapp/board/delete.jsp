<%@page import="com.care.root.board.dto.BoardDTO"%>
<%@page import="com.care.root.board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		BoardDAO dao = new BoardDAO();
		dao.delete(request.getParameter("id"));
		response.sendRedirect("list.jsp");
	%>
	
	<%-- 위의 자바코드와 같은 jsp코드
	<jsp:useBean id="dao" class="com.care.root.board.dao.BoardDAO"/>
	${dao.delete(param.id) }
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<c:redirect url="list.jsp"/>
	--%>
</body>
</html>