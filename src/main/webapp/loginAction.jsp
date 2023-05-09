<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="signUp.dao.MemberDao"%>
<%@ page import="signUp.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<title>login</title>
</head>
<body>

	<%
		String input_id = request.getParameter("user_id");
		String input_pw = request.getParameter("password");
		System.out.println(input_id + " " + input_pw);
	
		String user_id=null;
		if(session.getAttribute("user_id")!=null){
			user_id=(String)session.getAttribute("user_id");
		}
		if(user_id!=null){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인 되어있습니다.')");
			script.println("location.href='main.jsp'");
			script.println("</script>");	
		}
	
		MemberDao memberDao = new MemberDao();
		MemberDto memberDto = new MemberDto();
		
		//로그인 시도시 입력 받아서...
		memberDto.setUser_id(input_id);
		memberDto.setPassword(input_pw);
		
		
		int result = memberDao.login(memberDto.getUser_id(),memberDto.getPassword());
		
		if(result==1){
			session.setAttribute("user_id", memberDto.getUser_id());
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		}
		else if(result==0){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");
			script.println("history.back()");
			script.println("</script>");		
		}
		else if(result==-1){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디입니다.')");
			script.println("history.back()");
			script.println("</script>");		
		}
		else if(result==-2){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다.')");
			script.println("history.back()");
			script.println("</script>");		
		}
	%>

</body>
</html>