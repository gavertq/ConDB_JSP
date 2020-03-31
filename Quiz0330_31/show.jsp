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

<%
Cookie cookie = new Cookie("Cookie","userCookie"); //(이름, 값)
cookie.setMaxAge(60);
response.addCookie(cookie); //사용자에게 쿠키가 간다		
%>
</head>
<body>
	<%request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8"); %>
	
	<%if((String)session.getAttribute("loginUser")==null){response.sendRedirect("quiz1.jsp");}%>
	
	<%String nameIN = (String)session.getAttribute("loginUser");
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@192.168.0.49:1521:xe";
		String id = "java";
		String pwd="1234";
		Connection conIN = DriverManager.getConnection(url, id, pwd);
		String sqlIN = "select * from Members where name='"+nameIN+"'";
		PreparedStatement psIN = conIN.prepareStatement(sqlIN);
		ResultSet rsIN = psIN.executeQuery();
	
	if(rsIN.next()){%>
		<form action="modifyInfo.jsp" method="post">
		<span style="padding-left:16px; text-align: right;">아이디: </span><input type="text" name="idIN" value="<%=rsIN.getString("ID")%>"><br>
		<span>비밀번호: </span><input type="text" name="pwIN" value="<%=rsIN.getString("PWD")%>"><br>
		<span style="padding-left:32px; text-align: right;">이름: </span><input type="text" name="nameIN" value="<%=rsIN.getString("NAME")%>"><br>
		<span style="padding-left:32px; text-align: right;">주소: </span><input type="text" name="addrIN" value="<%=rsIN.getString("ADDR")%>"><br>
		<span>전화번호: </span><input type="text" name="telIN" value="<%=rsIN.getString("TEL")%>"><br>
		<input type="submit" value="수정">
		<button type="button" onclick="location.href='deletInfo.jsp'">삭제</button> <!-- form 안에서 버튼 이벤트를 따로 주려면 type=button 추가 필요. -->
		</form>		<!-- 그렇지 않으면 가장 첫번째로오는 버튼, summit의 기능만 발생한다 -->		
	<%} %>

</body>
</html>