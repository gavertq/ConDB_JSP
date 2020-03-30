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
	//String idQ = request.getParameter("id");
	//String pwdQ = request.getParameter("pwd");

	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@192.168.0.49:1521:xe";
	String id = "java";
	String pwd="1234";
	Connection con2 = DriverManager.getConnection(url, id, pwd);	//Connection은 sql꺼로 연결
	
	String sql = "select pwd, name from STUDENT4 where id=?";
	PreparedStatement ps2 = con2.prepareStatement(sql);
	ps2.setString(1, request.getParameter("id"));
	ResultSet rs2 = ps2.executeQuery();
	
	if(rs2.next()){
		out.print("1");
		if(request.getParameter("pwd").equals(rs2.getString("PWD"))){
			session.setAttribute("loginUser", rs2.getString("name"));%>
								
			<script type="text/javascript">
			alert(<%=rs2.getString("name")%>+"님 반값습니다");
			location.href="quiz2_3.jsp";
			</script>			
		<%}else{%>
			out.print("2");
			<script type="text/javascript">
			alert("일치하는 비밀번호가 없습니다");
			//location.href="quiz2_1.jsp";
			</script>
		<%}%>
	<%}else{%>
	out.print("3");
		<script type="text/javascript">
		alert("일치하는 아이디가 없습니다");
		//location.href="quiz2_1.jsp";
		</script>
	<%}%>
</body>
</html>