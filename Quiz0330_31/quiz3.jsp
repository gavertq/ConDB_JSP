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
	<%if((String)session.getAttribute("loginUser")==null){response.sendRedirect("quiz1.jsp");}%>

	<%String nameIN = (String)session.getAttribute("loginUser");
	
	
	boolean boo = true;	//환영 알림창을 띄우기 위한 boo. 처음에는 true로 팝업창 활성화
	
	Cookie cookieArr[] = request.getCookies();	//쿠키값 요청
	if(cookieArr!=null){	//쿠키값이 있다면
		for(Cookie c : cookieArr){
			
			if(c.getValue().equals("userCookie")){	//쿠키값이 userCookie와 같다면
				boo=false;					 		//알림창 안띄우기 위해 boo를 false로
			}
		}
	}
	
	if(boo==true) out.print("<script>alert(\""+nameIN+"님 반갑습니다\");</script>");%>
	
	<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@192.168.0.49:1521:xe";
	String id = "java";
	String pwd="1234";
	Connection con3 = DriverManager.getConnection(url, id, pwd);	//Connection은 sql꺼로 연결
	
	//DB 명령어 전달, 결과 가져오기
	String sql3 = "SELECT * FROM MEMBERS";
	PreparedStatement ps3 = con3.prepareStatement(sql3);
	ResultSet rs3 = ps3.executeQuery();
	%>
	
	<h3>회원들만의 페이지</h3>
	<table border="1">
	<tr><th>아이디</th><th>비밀번호</th><th>이름</th><th>주소</th><th>전화번호</th></tr>
	<%while(rs3.next()){%>
	<tr>
		<td><%=rs3.getString("ID") %></td>
		<td><%=rs3.getString("PWD") %></td>
		<td><%=rs3.getString("NAME") %></td>
		<td><%=rs3.getString("ADDR") %></td>
		<td><%=rs3.getString("TEL") %></td>
	</tr>
	<%} %>
	</table>

<button onclick="location.href='quiz4.jsp'">로그아웃</button>
<button onclick="location.href='show.jsp'">계정정보</button>
</body>
</html>