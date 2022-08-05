<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>jsp방법</h1>
	입력한 수는 <%= request.getParameter("num")%>이고,<br>
	당신은 <%=request.getParameter("gender") %>.
<hr>
<h1>el방법</h1>
	입력한 수는 ${param.num }이고,<br> 
	당신은 ${param.gender }.
</body>
</html>