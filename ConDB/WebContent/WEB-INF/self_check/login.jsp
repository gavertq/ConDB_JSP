<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
input{margin: 5px;}
</style>
</head>

<body>
	<%@include file="index_test.jsp" %>	<!-- index.jsp를 가져와 적용 -->
	<% String nick = (String)session.getAttribute("loginUser"); %>	<!-- 세션의 loginUser의 값을 nick에 저장 -->
	<%if(nick==null){ %>	<!-- nick이 null이면 == 로그인 전이면 -->
	<form action="chkUser.jsp" method="post">
		<input type="text" name="id" placeholder="아이디"><br>
		<input type="text" name="pwd" placeholder="비밀번호"><br>
		<input type="submit" value="로그인"><br>
	</form>
	<%}else{%> <!-- nick에 값이 있으면 == 로그인 후면 -->
		<%=nick %>님 로그인 상태 입니다<br>
		<input type='button' value='main 이동' onclick="location.href='main.jsp'">
	<%}%>
	
</body>

</html>