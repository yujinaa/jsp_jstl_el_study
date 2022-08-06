<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var ="contextPath" value = "${pageContext.request.contextPath }"/><!-- 경로 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>chkLogin.jsp<br>
	<!-- 1.자바코드로 작성 -->
	<% 
		String dbId = "1";  //db연결을 했다는 가정하에 임시 데이터를 만들어줬다
		String dbPwd = "1";
		String inputId = request.getParameter("id"); //사용자가 입력한 id
		String inputPwd = request.getParameter("pwd"); //사용자가 입력한 id
		if(dbId.equals(inputId) && dbPwd.equals(inputPwd)){
			out.print("인증통과");
		}else{
			out.print("인증실패");
			response.sendRedirect("loginForm.jsp");  //인증실패시 다시 로그인 페이지로 돌아간다
		}
	%>

</body>
</html>