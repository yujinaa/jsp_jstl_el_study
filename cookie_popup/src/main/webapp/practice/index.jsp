<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>index<hr>
	<h1>안녕!!</h1>
	
	
	<%-- // 해당 쿠키를 얻어와서 사용자가 원하는 쿠키가 있는지 확인 --%>
		
		<%
		boolean chk = true;
		Cookie[] cooks = request.getCookies();   //쿠키만들기
		for(Cookie c : cooks){
			if(c.getName().equals("myCookie")){  //비교하고싶은 값 아무거나 써도 된다, 사용자는 마이쿠키가 없으니
				chk = false;                                   // 실행이 되지 않는다
			}
		}
	%>
	

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="<%=chk %>">
	<script>
	window.open("popup.jsp","","width=300,height=200,top=500,left=500");
	</script>
</c:if>


</body>
</html>