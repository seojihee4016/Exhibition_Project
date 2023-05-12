<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약을 원하시는 날짜를 선택해 주세요</title>
</head>

<body>
	<h1><%=session.getAttribute("user_id")%>님 
	<small>예약에 성공하셨습니다.</small>
	</h1>
	<a href="myPage.jsp">마이페이지 이동</a>
</body>
</html>