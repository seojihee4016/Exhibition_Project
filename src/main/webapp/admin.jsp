<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="signUp.dao.MemberDao"%>
<%@ page import="signUp.dto.MemberDto"%>
<%@ page import="book.bookDao"%>
<%@ page import="book.bookDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<body>


	<%
	//1.한글처리, 파라미터 
	request.setCharacterEncoding("UTF-8");
	String user_id = (String) session.getAttribute("user_id");//object를 string으로 다운캐스팅
	String name = request.getParameter("name");

	MemberDao memberDao = new MemberDao();
	MemberDto memberDto = memberDao.selectMemberInfoById(user_id);

	bookDao bookDAO = new bookDao();
	bookDto bookDTO = bookDAO.selectMemberInfoById(user_id);
	
	
	//1-1. id없이는 진입불가, id없는 경우 로그인페이지로 이동
	if (user_id == null) {
		response.sendRedirect("login.jsp");
	}
	%>
	<h2><%=user_id%>님 환영합니다.
	</h2>
	<%=user_id%>님
	<br>

	<!-- 관리자일때만 메뉴확인가능 -->
	<%
	if (user_id != null && user_id.equals("admin")) {
	%>
	<input type="button" value="목록(관리자용)"
		onclick="location.href='memberList.jsp'">
	<%
	}
	%>

	<!-- 일반 회원일 때 -->
	<%
	if (user_id != null ) {
	%>
	<input type="button" value="회원정보조회"
		onclick="location.href='personalInfo.jsp'" class="personalId"
		id="<%=memberDto.getUser_id()%>">


	<%
	}
	%>

	<script src="https://code.jquery.com/jquery-3.7.0.js"
		integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
		crossorigin="anonymous"></script>
	<script>
		$(function() {

			$(".personalId").click(function() {

				var temp_link = $(this).attr("id");
				location.href = 'personalInfo.jsp?user_id=' + temp_link; // 다른 JSP 페이지의 경로

			});
		});
	</script>


</body>

</html>