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

<%	request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
 %>
	<%
	int flag=0;
	String pwd = (String)request.getParameter("pwd");
	String pwdC = (String)request.getParameter("pwdCheck");
	if(request.getParameter("id").isEmpty()){
		flag=1;%>	
		<script>alert("아이디는 필수입력사항입니다");	location.href="register.jsp";</script>
	<%		
	} else if(request.getParameter("pwd").isEmpty()){
		flag=1;%>
		<script>alert("비밀번호는 필수입력사항입니다");		location.href="register.jsp";</script>
	<%		
	} else if(!request.getParameter("pwd").isEmpty() && request.getParameter("pwdCheck").isEmpty()){
		flag=1;%>
		<script>alert("비밀번호 확인은 필수입니다");		location.href="register.jsp";</script>
	<%		
	}else if(!request.getParameter("pwd").isEmpty() && !pwd.equals(pwdC)){
		flag=1;%>
		<script>
		alert("비밀번호를 확인해주세요");				
		location.href="register.jsp"; 
		</script>
	<%	
	}
	
	if(flag==0){
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String idD = "java";
	String pwdD="1234";
	Connection conN = DriverManager.getConnection(url, idD, pwdD);	//Connection은 sql꺼로 연결
	
	String sqlN = "insert into Members values(?, ?, ?, ?, ?)";
	PreparedStatement psN = conN.prepareStatement(sqlN);
	psN.setString(1, request.getParameter("id"));
	psN.setString(2, request.getParameter("pwd"));
	psN.setString(3, request.getParameter("name"));
	psN.setString(4, request.getParameter("addr"));
	psN.setString(5, request.getParameter("tel"));
	ResultSet rsN = psN.executeQuery();
	
	rsN.close();
	psN.close();
	conN.close();
	%>
	<script>alert("회원가입 완료"); location.href="qiuz1.jsp"</script>
	<%}	%> 
</body>
</html>