<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="signUp.dao.MemberDao"%>
<%@ page import="signUp.dto.MemberDto"%>

<%@ page import="signUp.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.*"%>
<%@ page import="exhibition.dao.MyDateUtil"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인회원정보</title>
</head>
<body>
	<%
		//1. 로그인세션제어(관리자는 제외)
		String user_id = (String) session.getAttribute("user_id");
		//if (user_id == null || !user_id.equals("admin")) { //순서바뀌면 에러발생하므로 항상 null 먼저 비교할 것
			//response.sendRedirect("login.jsp");
		//}

		request.setCharacterEncoding("UTF-8");
		//int id = Integer.parseInt(request.getParameter("id"));

		//2. DAO객체생성
		MemberDao memberDao = new MemberDao();

		//3. 회원목록을 가져오는 메서드 사용
		MemberDto memberDto = memberDao.selectMemberInfoById(user_id);
	%>

	<h2>회원정보 조회 페이지</h2>
	<table border="1">
		<tr>
			<td>아이디</td>
			<td>비밀번호</td>
			<td>이름</td>
			<td>이메일</td>
			<td>성별</td>
			<td>생년월일</td>
			<td>핸드폰 번호</td>
		</tr>


		<tr>
			<td><%=memberDto.getUser_id()%></td>
			<td><%=memberDto.getPassword()%></td>
			<td><%=memberDto.getName()%></td>
			<td><%=memberDto.getEmail()%></td>
			<td><%=memberDto.getGender()%></td>
			<td><%=MyDateUtil.convertStringToUtilDate(memberDto.getBirthDate())%></td>
			<td><%=memberDto.getPhone()%></td>
		</tr>

	</table>
</body>
</html>