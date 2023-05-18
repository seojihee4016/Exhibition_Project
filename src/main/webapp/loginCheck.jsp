<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1><%=session.getAttribute("user_id")%>님 
	</h1>
	<a href="admin.jsp">마이 페이지 이동</a>
	<a href="booktest.jsp">예약 하기 이동</a>
	
	<%
	String user_id = (String) session.getAttribute("user_id");

	if (user_id != null && !user_id.equals("")) { // 세션에 아이디가 있으면 로그아웃이 보임.
	%>

	<a href="logOut.jsp" onclick="fnLogout(); return false;"
		alt="로그아웃">로그아웃(<%=(String) session.getAttribute("user_id")%>)
	</a>

	<%
	}
	%>

	<%--
	<script>
	document.getElimentById('logout').addEventListener('click' ()=> {
		location.href = "loginCheck.jsp";
	});
	</script>
 --%>
</body>
</html>