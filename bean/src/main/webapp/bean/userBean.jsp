<%@page import="bean.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	bean :객체를 만들어준다<br>
	
	
	<%--jsp로 객체만들기 --%>
	<jsp:useBean id="dto" class="bean.MemberDTO"/>
	<jsp:setProperty property="pwd" name="dto" value = "비밀번호"/>    <%--setProperty는 setter의의미 --%>
	${dto.setId("비가 많이오네요") }
	id : ${dto.id }, ${dto.getId() }<br>   <!--값을 가져오는 방법은 두가지 -->
	pwd : ${dto.pwd }
	
<%-- 자바로 객체만들기
	<%
		MemberDTO dto = new MemberDTO();
		dto.setId("111");
	%>
	
	id : <%= dto.getId() %>
--%>	
</body>
</html>