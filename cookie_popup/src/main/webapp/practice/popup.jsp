<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function popup_close() {
		//window.close();
		location.href = "makeCookie.jsp"   //팝업을 클릭하면 이쪽에서 쿠키를 만든다
	}
</script>
</head>
<body>
	<h1>공 지 사 항</h1>
	<h3>오늘 날씨가 정말 안좋네요. 비가 너무 쏟아져요....</h3>
	<input type="checkbox" onclick="popup_close()">하루동안 열지않음

</body>
</html>