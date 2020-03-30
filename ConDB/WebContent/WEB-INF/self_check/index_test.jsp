<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1 style="color: skyblue;">CARE LAB</h1>
	<h3>저희 사이트에 방문해주셔서 감사합니다</h3>
	
	<%
		boolean boo = true;	//팝업창을 띄우기 위한 boo. 처음에는 true로 팝업창 활성화
		
		Cookie cookieArr[] = request.getCookies();	//쿠키값 요청
		if(cookieArr!=null){	//쿠키값이 있다면
			for(Cookie c : cookieArr){
				
				if(c.getValue().equals("tttCookie")){	//쿠키값이 tttCookie와 같다면
					boo=false;					 		//팝업창 안띄우기 위해 boo를 false로
				}
			}
		}
		
	%>
	
	<%
		String nickI = (String)session.getAttribute("loginUser");
		try{
			if(nickI==null) boo=false;	//닉네임이 비어 있다면 == 즉 아직 로그인을 하지 않은 상태라면 boo를 false로 만들어 팝업창 뜨지 않게 함		
		}catch(Exception e){boo=false;} //에러 상황에도 팝업창은 뜨지 않는다
	%>
	
	<%if(boo==true){ %>	<!-- 로그인되어 있고 아무 제한이 없다면 팝업창이 뜬다 -->
		<script type="text/javascript">
			window.open("popup_test.jsp", "","width=300, height=500, left=500, top=500")
		</script>
	<%} %>
</body>
</html>