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
		
		/*MemberDto memberDto = new MemberDto();
	
		memberDto.setUser_id(user_id);
		memberDto.setPassword(password);
		memberDto.setName(name);
		memberDto.setPhone(phone);
		memberDto.setGender(gender);
		memberDto.setBirthDate(birthDate);
		memberDto.setEmail(email);*/

		if (result == 1) {
		
	%>
	<script>
			alert('추가 성공');
		</script>
	<%
		} else {
	%>
	<!--수정 실패-->
	<script>
				alert('추가 실패..');
	</script>
	<%
	}
	%>
	<script> location.href = './join.jsp';</script>
</body>