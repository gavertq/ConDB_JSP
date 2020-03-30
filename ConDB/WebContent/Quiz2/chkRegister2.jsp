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
	int flag=0;
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String pwdC = request.getParameter("pwdCheck");
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	String tel = request.getParameter("tel");
	
	if(id==null){%>
	<script>alert("아이디는 필수입력사항입니다");</script>
	<%
		flag=1;
	} else if(pwd==null){%>
	<script>alert("비밀번호는 필수입력사항입니다");</script>
	<%
		flag=1;
	} else if(pwd!= null && pwd!=pwdC){%>
	<script>alert("비밀번호를 확인해주세요");</script>
	<%
		flag=1;
	}
	
	if(flag==0){%>
	<script>alert("회원가입 완료");</script>
	<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@192.168.0.49:1521:xe";
	String idD = "java";
	String pwdD="1234";
	Connection con2 = DriverManager.getConnection(url, idD, pwdD);	//Connection은 sql꺼로 연결
	
	String sql = "insert into STUDENT4 values(?, ?, ?, ?, ?)";
	PreparedStatement psN = con2.prepareStatement(sql);
	psN.setString(1, id);
	psN.setString(2, pwd);
	psN.setString(3, name);
	psN.setString(4, addr);
	psN.setString(5, tel);
	ResultSet rs = psN.executeQuery();
	}
	%> 
</body>
</html>