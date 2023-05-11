<%@ page import="signUp.dao.MemberDao"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="text-align: center"></div>
	<h3>*아이디 중복 확인 결과*</h3>
	<%
	String user_id = request.getParameter("input_id"); //user_id가 아닌 input_id로 수정
	MemberDao memberDao = new MemberDao();
	boolean user_id_check = memberDao.checkDuplicateId(user_id);
	out.println("입력 ID: <strong>" + user_id + "</strong>");
	if (user_id_check) {
		out.println("<p>사용 가능한 아이디입니다.</p>");
		out.println("<a href='javascript:apply(\"" + user_id + "\")'>[적용]</a>");
	%>
	<script>
		function apply(user_id) {
			// 중복확인 id를 부모 창에 적용
			// 부모 창 opener
			opener.document.personAddForm.uid.value = user_id;
			window.close(); // 창닫기
		}
	</script>
	<%
	} else {
	out.println("<p style='color: red'>해당 아이디는 사용할 수 없습니다.</p>");
	}
	%>
	<a href="javascript:history.back()">[다시 시도]</a> &nbsp;&nbsp;
	<a href="javascript:window.close()">[창 닫기]</a>
</body>
</html>