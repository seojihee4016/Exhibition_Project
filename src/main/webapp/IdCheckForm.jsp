<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="text =align: center">
		<h3>*아이디 중복확인*</h3>
		<form method="post" action="IdCheckAction.jsp">
		<label for="id">아이디 : </label>
		<input type="text" name="user_id" maxlength="10" autofocus>
		<input type="submit" value="중복확인">
		</form>
</body>
</html>