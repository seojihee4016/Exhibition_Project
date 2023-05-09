<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1><%= session.getAttribute("user_id") %>님 <small>로그인에 성공하셨습니다.</small>
	</h1>
	<a href="login.jsp">로그아웃</a>
</body>
</html>