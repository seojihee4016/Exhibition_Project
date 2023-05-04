<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>회원가입</h2>
	
	<form action="join_proc.jsp" method="get">
		아이디:<input type="text" name="user_id"><br/>
		비밀번호:<input type="password" name="password"><br/>
		이름:<input type="text" id="inputName" name="name"><br/>
		전화번호:<input type="text" name="phone" size="11"><br/>
		성별:
		<input type="radio" name="gender" value="m" checked>남자
		<input type="radio" name="gender" value="f">여자<br/>
		생년월일: <input type="text" name="birthDate" size="8"><br/>
		* 8자리를 입력해주세요 ex)20010101<br/>
		이메일:<input type="text" name="email" size="30"><br/>
		
		<button id="insertBtn" type="submit">가입</button>

		
	</form>

	<script>
		document.getElementById('insertBtn').addEventListener('click', ()=>{
			
		let form = document.personAddForm;
		
		let inputName = document.getElementById('inputName');
		if(inputName.value == ""){
			alert('이름은 필수입니다');
			inputName.focus();
		} else {
			if(confirm('추가하시겠습니까?')){
				form.submit();
			}				
		}
	});
</script>

</body>
</html>