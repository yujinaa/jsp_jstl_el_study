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
		<%--방법1.자바로 표현
		BoardDAO dao = new BoardDAO();
		dao.delete(request.getParameter("id"));
		response.sendRedirect("list.jsp");
	 --%>
	 
	<%--방법2. --%>
	<%          
		BoardDAO dao = new BoardDAO();
		int result = dao.delete(request.getParameter("id"));
		//response.sendRedirect("list.jsp");
		if(result == 1){
			out.print("<script>alert('성공적으로 삭제되었습니다');"+
				" location.href='list.jsp'</script>");
		}else{
			out.print("<script>alert('삭제 실패 되었습니다');"+
				" location.href='list.jsp'</script>");
		}
	%>
	
			<%-- 
		if(result == 1){%>
			<script type="text/javascript">
				alert('삭제 성공');
				location.href="list.jsp"
			</script>
		<%}else{ %>
		
		<%} %>
--%>
	
	<%-- 위의 자바코드와 같은 jsp코드
	<jsp:useBean id="dao" class="com.care.root.board.dao.BoardDAO"/>
	${dao.delete(param.id) }
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<c:redirect url="list.jsp"/>
	--%>
</body>
</html>