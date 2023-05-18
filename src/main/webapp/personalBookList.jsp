<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="signUp.dao.MemberDao"%>
<%@ page import="signUp.dto.MemberDto"%>
<%@ page import="book.bookDto"%>
<%@ page import="book.bookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.*"%>
<%@ page import="exhibition.dao.MyDateUtil"%>

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
	request.setCharacterEncoding("UTF-8");

	%>

		<%
	//2. DAO객체생성

	bookDao bookDAO = new bookDao();
	bookDto bookDTO = bookDAO.selectMemberInfoById(user_id);
	
	if (bookDTO == null) {
		PrintWriter script=response.getWriter();
        script.println("<script>");
        script.println("alert('예약내역이 없습니다.')");
        script.println("history.back()");
        script.println("</script>");
	%>
	
	<%
	} else {
	%>
	<h2>예약 정보 조회 페이지</h2>
	<table border="1">
		<tr>
			<td>전시회 선택 날짜</td>
			<td>이름</td>
			<td>핸드폰 번호</td>
			<td>이메일</td>
			<td>총 인원 수</td>
			<td>성인</td>
			<td>청소년</td>
			<td>아동</td>
			<td>결제 가격</td>
		</tr>

		<tr>
			<td><%=bookDTO.getBookDate()%></td>
			<td><%=bookDTO.getName()%></td>
			<td><%=bookDTO.getPhone()%></td>
			<td><%=bookDTO.getEmail()%></td>
			<td><%=bookDTO.getPeopleCount()%></td>
			<td><%=bookDTO.getAdult()%></td>
			<td><%=bookDTO.getTeenager()%></td>
			<td><%=bookDTO.getChild()%></td>
			<td><%=bookDTO.getPrice()%></td>
		</tr>

	</table>
	<%
	} 
	%>

</body>
</html>