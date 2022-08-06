<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var = "contextPath" value = "${pageContext.request.contextPath }"/><!-- 경로 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>chkLogin.jsp<br>

<!-- jstl로 작성 -->
<c:set var = "dbId" value = "1"/>
<c:set var = "dbPwd" value = "1"/>
<c:set var = "inputId" value = "${param.id }"/>
<c:set var = "inputPwd" value = "${param.pwd }"/>
<c:if test ="${dbId ==inputId && dbPwd eq inputPwd }"> <!-- 단순 if문  : id, pwd가 비교할 것과 같다면 -->
	인증성공
	<c:redirect url="main.jsp"/>
</c:if>
<c:if test="${dbId != inputId || dbPwd ne inputPwd }">  <!-- 같지 않으면 -->
	인증실패
	<c:redirect url="loginForm.jsp"/>
</c:if>

	<!-- 1.자바코드로 작성 -->
	<%-- 
		String dbId = "1";  //db연결을 했다는 가정하에 임시 데이터를 만들어줬다
		String dbPwd = "1";
		String inputId = request.getParameter("id"); //사용자가 입력한 id
		String inputPwd = request.getParameter("pwd"); //사용자가 입력한 id
		if(dbId.equals(inputId) && dbPwd.equals(inputPwd)){
			out.print("인증통과");
			//response.sendRedirect("main.jsp"); //인증성공시 메인페이지로 이동
			//response.sendRedirect("main.jsp?id="+inputId); //페이지이동뿐 아니라 id를 넘긴다
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("main.jsp"); //경로를 이용해
            dispatcher.forward(request, response); //이쪽으로 넘기면서 request,response 객체가 넘어간다

		}else{
			out.print("인증실패");
			response.sendRedirect("loginForm.jsp");  //인증실패시 다시 로그인 페이지로 돌아간다
		}
	--%>
</body>
</html>