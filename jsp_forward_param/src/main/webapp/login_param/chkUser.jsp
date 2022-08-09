<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var = "contextPath" value = "${pageContext.request.contextPath }"/>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>chkUser.jsp<hr>
	<%--자바로 표현하기 --%>
	
		<%                                                    
		String id = request.getParameter("id");          
		String pwd = request.getParameter("pwd");
		String user = request.getParameter("user");
		
		if(user.equals("user")){%>                                         
			<jsp:forward page="userPage.jsp">            
				<jsp:param value="추가로 넘어가는 값" name="n"/>
			</jsp:forward>
			
		<%} else{ %>                                           
			<jsp:forward page="adminPage.jsp">    
				<jsp:param value="추가로 넘어가는 값" name="n"/>   
			</jsp:forward>
<%}  %>

</body>
</html>