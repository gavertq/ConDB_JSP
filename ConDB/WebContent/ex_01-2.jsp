
<%@page import="com.sun.xml.internal.txw2.Document"%>
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
		String sql = "select * from STUDENT2 where id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, request.getParameter("id")); //id값을 request.getParameter로 가져와서 넣음
		ResultSet rs = ps.executeQuery();
	%>
		<h3>인적 사항</h3>
		
		<%if(rs.next()){%>		
			학번: <%=rs.getString("ID") %><br>
			이름: <%=rs.getString("NAME") %><br>
			국, 영, 수: <%=rs.getInt("LAN") %>,<%=rs.getInt("ENG") %>, <%=rs.getInt("MATH") %><br>		
		<%} %>
	<input type="button" value="완료" onclick="window.close()">
	
</body>
</html>