<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
Cookie cookie = new Cookie("Cookie","tttCookie"); //(이름, 값)
cookie.setMaxAge(60);
response.addCookie(cookie); //사용자에게 쿠키가 간다		
%><!-- 이 페이지가 실행되는 순간 서버에서 < % % >를 실행 -> 쿠키 생성 -->

<script type="text/javascript">
window.close();	//창닫기
</script>

</body>
</html>