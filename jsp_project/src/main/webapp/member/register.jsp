<%@page import="com.care.root.member.dao.MemberDAO"%>
<%@page import="com.care.root.member.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<fmt:requestEncoding value="utf-8"/>
<c:import url="../default/header.jsp"/>

<%--

	MemberDTO dto = new MemberDTO();
	dto.setId(request.getParameter("id"));
	dto.setPwd(request.getParameter("pwd"));
	dto.setName(request.getParameter("name"));
	dto.setAddr(request.getParameter("addr"));
	
	MemberDAO dao = new MemberDAO();       //db연결하기
	int result = dao.register(dto);
	if(result ==1){
		//성공
		out.print("<script>alert('회원가입을 축하합니다!!');location.href='membership.jsp';</script>");
	}else{
		//실패
		out.print("<script>alert('오류! 다시 입력해주세요');location.href='member_register.jsp';</script>");
	}
	
--%>

<jsp:useBean id="dto" class = "com.care.root.member.dto.MemberDTO"/>
<jsp:useBean id="dao" class = "com.care.root.member.dao.MemberDAO"/>
<jsp:setProperty property="*" name="dto"/>    
<c:set var = "result" value="${dao.register(dto) }"/>
<c:choose>
	<c:when test="${result==1 }">
		<script type="text/javascript">
			alert('회원가입을 축하합니다~');
			locarion.href='${contextPath}/member/membership.jsp'
		</script>
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
			alert('문제가 생겼습니다');
			locarion.href='${contextPath}/member/member_register.jsp'
		</script>
	</c:otherwise>
</c:choose>

<c:import url="../default/footer.jsp"/>
</body>
</html>