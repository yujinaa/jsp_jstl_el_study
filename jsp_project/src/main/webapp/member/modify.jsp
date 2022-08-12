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
<body>modify.jsp<br>
<jsp:useBean id="dao" class = "com.care.root.member.dao.MemberDAO"/>
	<c:set var= "mem" value="${dao.getMember(param.id) }"/>  
	id : ${mem.id }<br>  

<c:import url="../default/header.jsp"/>
<form action="modify_save.jsp" method="post">
<input type="hidden" name="id" value = "${mem.id }">   
비밀번호 : <input type="text" name="pwd" value = "${mem.pwd }"><br>    
이름 : <input type="text" name="name" value = "${mem.name }"><br>
주소 : <input type="text" name="addr" value = "${mem.addr }"><br>
<input type="submit" value = "수정">
<input type="button" value = "이전" onclick="history.back()">
</form>
<c:import url="../default/footer.jsp"/>	
</body>
</html>