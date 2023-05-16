<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="signUp.dao.MemberDao"%>
<%@ page import="signUp.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<body>
	<%
		request.setCharacterEncoding("UTF-8"); //한글 정상 인식을 위해
		
		String user_id = request.getParameter("user_id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String gender = request.getParameter("gender");
		String birthDate = request.getParameter("birthDate");
		String email = request.getParameter("email");
		

		MemberDao memberDao = new MemberDao();
		int result = memberDao.insertMemberInfo(
				user_id, password, name, phone, gender, birthDate, email); 
		
		if (result == 1) {
		
	%>
	<script>
			alert('회원가입이 완료되었습니다.');
			location.href = './login.jsp';
		</script>
	<%
		} else {
	%>
	<script>
				alert('회원가입에 실패했습니다. 가입 페이지로 다시 돌아갑니다.');
	</script>
	<%
	}
	%>
	<script> location.href = './join.jsp';</script> <!-- login.jsp로 이동, 실패했을 때 ./join.jsp로 -->
</body>