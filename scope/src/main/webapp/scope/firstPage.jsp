<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>firstPage<br>

<!-- 
	page         :    현재 페이지에서만 유지되는 값
	request     :    현재 페이지 또는 다음 페이지까지 유지되는 값
		               단, request는 다음 페이지까지 전달하고자 하면 forword사용해야 한다.(기억은하자)
	session      :   웹 브라우저가 살아있는 동안 유지된다.다른 부라우저는 세션 유지x(!!!기억하자. 많이 쓴다!!!)
	application :   서버가 살아있는 동안 유지된다. 
 -->
	
	<%--설정하기 setAttribute--%>
	<% 
		pageContext.setAttribute("name", "page value"); //("키","값")
		request.setAttribute("name", "request value");
		session.setAttribute("name", "session value");
		application.setAttribute("name", "application value");
	%>
	
	<%--가져오기  getAttribute--%>
	page : <%= pageContext.getAttribute("name")%><br>
	request : <%= request.getAttribute("name")%><br>
	session : <%= session.getAttribute("name")%><br>
	application: <%= application.getAttribute("name")%><br>
	
	<a href = "secondPage.jsp">secondPage.jsp</a>
	

</body>
</html>