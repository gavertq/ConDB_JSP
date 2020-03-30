<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	<%!int num = 0; %>
	 function num(){
		<% 				
			session.setAttribute("WARN", num);
			num++;
		%>
	 }
</script>

</head>
<body onload="num()">
<form action="chkRegister.jsp" method="post">
	<input type="text" placeholder="아이디" name="id">(*필수 항목)<br>
	<input type="text" placeholder="비밀번호" name="pwd"><br>
	<input type="text" placeholder="비밀번호 확인" name="pwdCheck">
	<label id="warnPW"></label><br>
	<input type="text" placeholder="이름" name="name"><br>
	<input type="text" placeholder="주소" name="addr"><br>
	<input type="text" placeholder="전화번호" name="tel"><br>
	<input type="submit" value="회원가입">
</form>


	<%int p = (int)session.getAttribute("WARN");
	if(p==0){
		out.print("<script>document.getElementById(\'warnPW\').innerHTML = \"(*필수 항목)\"</script>");
	}else{
		out.print("<script>document.getElementById(\'warnPW\').innerHTML = \"불일치!\"</script>");
		out.print("<script>document.getElementById(\'warnPW\').style.color = \"red\"</script>");
	}%>

</body>
</html>