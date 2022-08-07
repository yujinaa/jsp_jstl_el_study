<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>firstPage<hr>

<!-- 
	page         :    현재 페이지에서만 유지되는 값
	request     :    현재 페이지 또는 다음 페이지까지 유지되는 값
		               단, request는 다음 페이지까지 전달하고자 하면 forward사용해야 한다.(기억은하자)
	session      :   웹 브라우저가 살아있는 동안 유지된다.다른 부라우저는 세션 유지x(!!!기억하자. 많이 쓴다!!!)
	application :   서버가 살아있는 동안 유지된다. 
 -->
	
	<%--설정하기 setAttribute--%>
	<% 
		pageContext.setAttribute("name", "page value"); //("키","값")
		request.setAttribute("name", "request value");
		session.setAttribute("name", "session value");
		application.setAttribute("name", "application value");
		
		//forward를 쓰면 request도 다음까지 연결된다(바로 secondepage로 이동)
		//request.getRequestDispatcher("secondPage.jsp").forward(request, response);
	%>
	
	<%--가져오기  getAttribute--%>
	name : ${name }<br>
	page : <%= pageContext.getAttribute("name")%>, ${pageScope.name }<br> <!-- el로 값가져오기 --> 
	request : <%= request.getAttribute("name")%>,${requestScope.name }<br>
	session : <%= session.getAttribute("name")%>,${sessionScope.name }<br>
	application: <%= application.getAttribute("name")%>,${applicationScope.name }<br>
	
	<a href = "secondPage.jsp">secondPage.jsp</a>

<%--el문법 적용하기 --%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- -> c:set을 var, value만 쓰면 변수설정(현재페이지에서만 사용가능한 변수)이고, scope까지 쓰면 범위를 설정한다. -->
<c:set var = "se" value = "세션설정값입니다" scope = "session"/> 
session : ${se }<br>
</body>
</html>