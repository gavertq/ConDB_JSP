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
<%request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8"); %>

<%if((String)session.getAttribute("loginUser")==null){response.sendRedirect("quiz1.jsp");}%>

<%String nameIN = (String)session.getAttribute("loginUser");
Class.forName("oracle.jdbc.driver.OracleDriver");
String url = "jdbc:oracle:thin:@192.168.0.49:1521:xe";
String id = "java";
String pwd="1234";
Connection conD = DriverManager.getConnection(url, id, pwd);
String sqlD = "delete from Members where name='"+nameIN+"'";
PreparedStatement psD = conD.prepareStatement(sqlD);
psD.executeUpdate();
%>
<script type="text/javascript">
alert("삭제완료");
location.href='quiz4.jsp';
</script>

</body>
</html>