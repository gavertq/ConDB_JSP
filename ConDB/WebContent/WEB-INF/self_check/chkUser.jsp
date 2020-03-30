<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>chkUser.jsp<br>
	
	<%
		String id="1", pwd="1", nickName="하나";
		if(id.equals(request.getParameter("id")) && pwd.equals(request.getParameter("pwd"))){ //form에서 summit한 값을 가져와 비교
			session.setAttribute("loginUser", nickName); //로그인 성공시 세션에 loginUser만들고 nickName 세팅
			response.sendRedirect("main.jsp");	//로그인 성공시 메인창으로
		}else{
			response.sendRedirect("login.jsp");	//로그인 실패시 로그인창으로
		}		
	%>

</body>
</html>