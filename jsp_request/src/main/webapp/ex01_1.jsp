<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>ex01_1<br>
	<%
		String checkbox = request.getParameter("check"); //checkbox는 getParameter를 사용하면 값을 한개만 넘긴다
		String[] values = request.getParameterValues("check"); //값을 여러개 받으려면 배열을 만들어준다.
		
		//for문 사용하기
		out.print("[for문 사용하기]<br>");
		if(values !=null){//선택하지 않으면 null출력(null은 length를 쓸수 없다)
		for(int i = 0;i<values.length;i++){
			out.print(values[i]);
		}
		//위의 코드랑 같다
		out.print("<hr>");
		for(String n : values){
			out.print(n);
		}
	}
		out.print("<hr>");
		
		//foreach문 사용하기 :string형태
		out.print("[foreach문 사용하기]<br>");
		String[] test = {"좋은","하루","보내세요"};
		for(String s : test){ //String 변수
			out.print(s);
		}
		
		//foreach문 사용하기 : int 형태
		out.print("<br>");
		int[] arr = {11,22,33,44};
		for(int i : arr){
			out.print(i);
		}
	%>
	
	<hr>
	
	<%= checkbox %><hr> <!-- 값 한개만 -->
	<%--  
		<%= values[0] %> <%= values[1] %> <%= values[2] %><!-- 값 여러개 --> 
	--%>
</body>
</html>