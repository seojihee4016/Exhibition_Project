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
		<form name='overlapCheckForm' method="post" action="IdCheckAction.jsp">
			<label for="user_id" id="user_id">아이디 : </label> <input type="text"
				name="input_id" id="input_id" autofocus maxlength="20"> <input
				type="submit" value="중복확인" id="overlapCheck">
		</form>

		<script>
		document.getElementById('overlapCheck').addEventListener('click', function(e) {
			var form = document.overlapCheckForm;
			
			var input_id = document.getElementById("input_id");
			
			//아이디 중복 확인
			if (input_id.value.trim() == "") {
				alert("아이디를 입력하세요.");
				input_id.focus();
				e.preventDefault(); //이벤트를 걸어서 폼으로 안 넘어가게 막기
				return false;
			}			
		});
		</script>
</body>
</html>