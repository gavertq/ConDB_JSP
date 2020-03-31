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
<%String nameIN = (String)session.getAttribute("loginUser");
Class.forName("oracle.jdbc.driver.OracleDriver");
String url = "jdbc:oracle:thin:@192.168.0.49:1521:xe";
String id = "java";
String pwd="1234";
Connection conI = DriverManager.getConnection(url, id, pwd);

String sqlI = "select name from Members where id=?";
PreparedStatement psI = conI.prepareStatement(sqlI);
psI.setString(1, request.getParameter("id"));
ResultSet rsI = psI.executeQuery();

if(rsI.next()){}
%>
</body>
</html>