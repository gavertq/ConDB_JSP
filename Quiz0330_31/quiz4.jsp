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
Cookie cookie = new Cookie("Cookie", null) ;
cookie.setMaxAge(0) ;
response.addCookie(cookie) ;	//특정 쿠키값 지우기

session.invalidate();
%>
<script type="text/javascript">
location.href="quiz1.jsp";	//로그인 페이지로 이동
</script>
</body>
</html>