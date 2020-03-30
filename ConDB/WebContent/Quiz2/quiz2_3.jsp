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
<body>

	<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@192.168.0.49:1521:xe";
	String id = "java";
	String pwd="1234";
	Connection con = DriverManager.getConnection(url, id, pwd);	//Connection은 sql꺼로 연결
	
	//DB 명령어 전달, 결과 가져오기
	String sql = "select * from STUDENT4";
	PreparedStatement ps = con.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();
	%>
	
	<table border="1">
	<tr><th>아이디</th><th>비밀번호</th><th>이름</th><th>주소</th><th>전화번호</th></tr>
	<%while(rs.next()){%>
	<tr>
		<td><%=rs.getString("ID") %></td>
		<td><%=rs.getString("PWD") %></td>
		<td><%=rs.getString("NAME") %></td>
		<td><%=rs.getString("ADDR") %></td>
		<td><%=rs.getString("TEL") %></td>
	</tr>
	<%} %>
	</table>
<button onclick="location.href='quiz2_1.jsp'">로그아웃</button>
</body>
</html>