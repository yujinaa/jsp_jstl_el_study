<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>makeCoolie<hr> 
<!-- 이곳에선 쿠키생성만 한다. -->

<%
	Cookie cook = new Cookie("myCookie","myCookie");
	cook.setMaxAge(5);        //하루를 초로 계산해서 넣자
	response.addCookie(cook);
%>
쿠키가 생성되었습니다. 
	<script type="text/javascript">
		//window.close();            //창닫기
		location.href = "pop_close.jsp"  //위의 코드가 안먹혀서 안닫히는 경우 페이지를 만들어서 닫아줄 수도 있다.
	</script>

</body>
</html>