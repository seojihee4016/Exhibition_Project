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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	//1. 로그인세션제어(관리자는 제외)
	String user_id = (String) session.getAttribute("user_id");
	if (user_id == null || !user_id.equals("admin")) { //순서바뀌면 에러발생하므로 항상 null 먼저 비교할 것
		response.sendRedirect("login.jsp");
	}
	//2. DAO객체생성
	MemberDao memberDao = new MemberDao();
//	bookDao bookDAO = new bookDao();

	//3. 회원목록을 가져오는 메서드 사용
	memberDao.getMemberList();
	ArrayList memberList = memberDao.getMemberList();
	%>

	<h2>관리자 페이지</h2>


	<h4>전체 회원 정보 조회</h4>
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

		<%
		//반복문
		//ArrayList는 가변배열이므로 length가 없고 size가 존재한다.
		//size()메서드는 배열의 요소의 갯수를 리턴
		for (int i = 0; i < memberList.size(); i++) {
			MemberDto memberDto = (MemberDto) memberList.get(i);
		%>
		<tr>
			<td><%=memberDto.getUser_id()%></td>
			<td><%=memberDto.getPassword()%></td>
			<td><%=memberDto.getName()%></td>
			<td><%=memberDto.getEmail()%></td>
			<td><%=memberDto.getGender()%></td>
			<td><%=memberDto.getBirthDate()%></td>
			<td><%=memberDto.getPhone()%></td>
		</tr>
		<%
		}
		%>
	</table>



</body>
</html>