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
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@192.168.0.49:1521:xe";
	String id = "java";
	String pwd="1234";
	Connection con2 = DriverManager.getConnection(url, id, pwd);
	
	String idQ = request.getParameter("idLogin");
	String pwdQ = request.getParameter("pwdLogin");
	String sql2 = "select pwd, name from Members where id='"+request.getParameter("idLogin")+"'";
	PreparedStatement ps2 = con2.prepareStatement(sql2);
	ResultSet rs2 = ps2.executeQuery();
	
	try{
	if(rs2.next()){
		if(pwdQ.equals(rs2.getString("PWD"))){	
			String p = rs2.getString("NAME");
			session.setAttribute("loginUser", p);%>		
									
			<script>
			//alert(rs2.getString("NAME")+"님 반갑습니다");
			location.href="quiz3.jsp";
			</script>
				
		<%}else{ %>
			<script>
			alert("일치하는 비밀번호가 없습니다");
			location.href="quiz1.jsp";
			</script>
		<%}%>
		
	<%}
	if(!rs2.next()){%>
		<script>
		alert("일치하는 아이디가 없습니다");
		location.href="quiz1.jsp";
		</script>
	<%}
	} catch(Exception e){}%>
</body>
</html>