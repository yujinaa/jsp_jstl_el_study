<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>index<hr>
<!-- 쿠키는 jsp로 잘 만들지 않지만 연습으로 만들어보자! -->

<!-- 
	session : 서버에서 관리하는 값
	cookie : 클라이언트가 관리하는 값(시간을 설정한다)
 -->
	<h1>CARE_LAB</h1>
	<h3>환영합니다</h3>
	
	<%
		boolean bool =  false;                              //변수만들기
		Cookie[] cookieArr = request.getCookies();         //사용자로부터 모든 쿠키값 얻어오기 
		
		//foreach문으로 표현하기
		
		for(Cookie c : cookieArr){                         //쿠키 자료형
			out.print("name : " + c.getName()+":");      
			out.print("value :" + c.getValue()+ "<br>");
			if(c.getName().equals("testCookie")){           //쿠키를 가지고 있다면 
				bool = true;                                 //팝업창 열기
			}
		}
		
		/*
		for(int i = 0; i<cookieArr.length;++i){
			out.print("name : " + cookieArr[i].getName()+":");      //  배열출력 :쿠키네임과
			out.print("value :" + cookieArr[i].getValue()+ "<br>");    //배열출력 : 쿠키밸류를 얻어온다)
		}
		*/
		
		Cookie cookie = new Cookie("testCookie","myCookie"); //쿠키 생성
		cookie.setMaxAge(5);            //쿠키유지시간 설정(5초동안 유지)

		response.addCookie(cookie);         //응답 : 사용자에게 쿠키값 전달
	%>
	<% if(bool == false){ %> <%--bool 변수가 false라면 팝업창 열기--%>
	<script type="text/javascript">
		window.open("popup.jsp","","width=300,height=200,top=500,left=500")
	</script>
	<%}  %>
</body>
</html>