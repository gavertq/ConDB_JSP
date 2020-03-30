<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>logout.jsp<br>
<%
session.invalidate();	//세션 삭제(여기서는 loginUser세션에 저장된 닉네임 '하나')
%>
<script type="text/javascript">
alert("로그아웃");		//알림창 뜨고 -> 확인 누르면
location.href="login.jsp";	//로그인 페이지로 이동
</script>

</body>
</html>