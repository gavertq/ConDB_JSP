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
		//DB연결
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@192.168.0.49:1521:xe";
		String id = "java";
		String pwd="1234";
		Connection con = DriverManager.getConnection(url, id, pwd);	//Connection은 sql꺼로 연결
		
		//DB 명령어 전달, 결과 가져오기
		String sql = "select * from STUDENT2";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		//결과 출력
		%>
	<table border="1">
		<tr><th>학번</th><th>이름</th><th>국어</th><th>영어</th><th>수학</th></tr>
		
		<%while(rs.next()){%>
		<tr>
			<td><%=rs.getString("ID") %></td>
			<td><a href="ex_01-2.jsp?id=<%=rs.getString("ID")%>" target="_blank" id="<%=rs.getString("ID") %>" ><%=rs.getString("NAME") %></a></td>			
			<td><%=rs.getInt("LAN") %></td>
			<td><%=rs.getInt("ENG") %></td>
			<td><%=rs.getInt("MATH") %></td>
		</tr>
		<%} %>
	</table>
	<!-- a태그에서 href로 연결할 때 ?id=를 줌으로써 id값을 같이 넘겨줌 -->	
</body>
</html>