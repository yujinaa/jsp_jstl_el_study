<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
	<tr>
		<td colspan="2"><h1>설문 조사</h1></td>
	</tr>
	<form action="views.jsp">
		<tr><td>이름 :</td><td><input type="text" name="name"></td></tr>
		<tr>
			<td>성별 :</td>
			<td><input type="radio" name = "gender" value="남자">남자
			<input type="radio" name = "gender" value="여자">여자</td>
		</tr>
		<tr>
			<td>좋아하는 계절 :</td>
			<td><input type="checkbox" name = "weather" value="봄">봄
			<input type="checkbox" name = "weather" value="여름">여름
			<input type="checkbox" name = "weather" value="가을">가을
			<input type="checkbox" name = "weather" value="겨울">겨울</td>
		</tr>
		<tr><td><input type="submit" value="전송"></td>
		<td><input type="reset" value = "취소"></td>
		</tr>
	</form>
</table>
</body>
</html>