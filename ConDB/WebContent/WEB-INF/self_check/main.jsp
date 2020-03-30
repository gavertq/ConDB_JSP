<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>main.jsp<br>

	<%
	if((String)session.getAttribute("loginUser")==null){ response.sendRedirect("login.jsp");} //로그인 없이 주소입력으로 메인페이지에 들어오는 것을 막음
		String nick = (String)session.getAttribute("loginUser");
	%>
	<%=nick %>님 안녕하세요.<br>
	저희 홈페이지에 방문해 주셔서감사합니다.<br>
	즐거운 시간되세요!<br>
	<input type="button" value="로그아웃" onclick="location.href='logout.jsp'">	<!-- 로그아웃 페이지 실행 -->
	<input type="button" value="로그인 페이지" onclick="location.href='login.jsp'"> <!-- 로그인 페이지로 이동 -->
</body>
</html>