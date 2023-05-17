<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="book.bookDao"%>
<%@ page import="book.bookDto"%>
<%@ page import="signUp.dao.MemberDao"%>
<%@ page import="signUp.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<body>
	<%
	request.setCharacterEncoding("UTF-8"); //한글 정상 인식을 위해

	String user_id = (String) session.getAttribute("user_id");
	MemberDao memberDao = new MemberDao();
	MemberDto memberDto = memberDao.selectMemberInfoByUser_id(user_id);

	String name = memberDto.getName();
	String phone = memberDto.getPhone();
	String email = memberDto.getEmail();
	int peopleCount = Integer.parseInt(request.getParameter("peopleCount"));
	String bookDate = request.getParameter("bookDate");
	int price = Integer.parseInt(request.getParameter("price"));
	int adult = Integer.parseInt(request.getParameter("p_num1"));
	int teenager = Integer.parseInt(request.getParameter("p_num2"));
	int child = Integer.parseInt(request.getParameter("p_num3"));
	int seq = Integer.parseInt(request.getParameter("seq"));

	bookDao bookDAO = new bookDao();
	int result = bookDAO.insertBookInfo(user_id, name, phone, email, peopleCount, bookDate, price, adult, teenager, child,
			seq);

	if (result == 1) {
	%>
	<script>
		alert('예약이 완료되었습니다.');
		location.href = './bookAction.jsp';
	</script>
	<%
	} else {
	%>
	<script>
		alert('실패');
	</script>
	<%
	}
	%>
	<script>
		location.href = './booktest.jsp';
	</script>
	<!-- login.jsp로 이동, 실패했을 때 ./join.jsp로 -->
</body>