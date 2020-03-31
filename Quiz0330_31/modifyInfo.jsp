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
Connection conM = DriverManager.getConnection(url, id, pwd);
String sqlM = "update Members set id=?, pwd=?, name=?, addr=?, tel=? where name='"+nameIN+"'";
PreparedStatement psM = conM.prepareStatement(sqlM);
psM.setString(1, request.getParameter("idIN"));
psM.setString(2, request.getParameter("pwIN"));
psM.setString(3, request.getParameter("nameIN"));
psM.setString(4, request.getParameter("addrIN"));
psM.setString(5, request.getParameter("telIN"));
psM.executeUpdate();
session.setAttribute("loginUser", request.getParameter("nameIN"));
psM.close();
conM.close();
%>
<script type="text/javascript">
location.href='quiz3.jsp';
</script>
</body>
</html>