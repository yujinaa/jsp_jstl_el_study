<%@page import="bean.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>result.jsp<hr>
	<%
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		MemberDTO dto = new MemberDTO();
		dto.setId(id); dto.setPwd(pwd); dto.setName(name);
	 %>
		<%-- dto 가지고 있는 값은 db에 저장한다.--%>
	
	<%=dto.getId() %> <%=dto.getPwd() %> <%=dto.getName() %>
	<hr>
	
	<!-- 위의 코드처럼 길게쓰는것보다 모든값*을 member에 넣는게 간결하다. -->
	<jsp:useBean id="member" class="bean.MemberDTO"/>
	<jsp:setProperty property="*" name="member"/>
	태그로 처리<br>
	${member.id  }
	${member.pwd  }
	${member.name  }
	

</body>
</html>