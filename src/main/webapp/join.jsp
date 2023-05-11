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

	<form name='personAddForm' action="join_proc.jsp" method="post">
		아이디 : <input type="text" id="uid" name="user_id" maxlength="20"
			oninput="handleInputLength(this, 20)"> 
			<input type="button" onclick="IdCheck()" value="ID 중복확인"><br> <input
			type="hidden" id="idCheckFlag" name="idCheckResult" value="0">
		비밀번호 : <input type="password" id="pwd" name="password"><br>
		비밀번호 재확인 : <input type="password" id="repwd" name="password"><br>
		이름 : <input type="text" id="uname" name="name"><br> 
		전화번호: <input type="text" id="phone_id" name="phone" size="11" maxlength="13" placeholder="ex)010-1234-1234"><br>
		성별 : <input type="radio" id="male" name="gender" value="m" checked>남자
		<input type="radio" id="female" name="gender" value="f">여자<br> 
		생년월일 : <input type="text" id="birth" name="birthDate" size="8">
		이메일 : <input type="text"
			id="email_id" name="email" size="30"><br>

		<button id="insertBtn" type="button">가입</button>
	</form>

	<script>
		function IdCheck() {
			window.open("IdCheckForm.jsp", "idwin", "width=500, height=350");

			// 아이디 중복확인 버튼을 눌렀을 때, 중복확인 여부를 변경
			document.getElementById("idCheckFlag").value = "1";
		}

		document.getElementById('insertBtn').addEventListener('click',function() {

							var form = document.personAddForm;

							var uid = document.getElementById("uid");
							var pwd = document.getElementById("pwd");
							var repwd = document.getElementById("repwd");
							var uname = document.getElementById("uname");
							var phone_id = document.getElementById("phone_id");
							var male = document.getElementById("male");
							var female = document.getElementById("female");
							var email_id = document.getElementById("email_id");
							var idCheckFlag = document
									.getElementById("idCheckFlag").value;

							
							//아이디
							if (uid.value.trim() === "") {
								alert("아이디를 입력하세요.");
								uid.focus();
								return false;
							}
							

							// 아이디 중복확인을 하지 않았을 경우
							if (idCheckFlag === "0") {
								alert("아이디 중복 확인을 해 주세요.");
								return false;
							}

							//비밀번호
							if (pwd.value.trim() === "") {
								alert("비밀번호를 입력하세요.");
								pwd.focus();
								return false;
							}

							//비밀번호 영문자+숫자(8~25자리 입력) 정규식
							let pwdCheck = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,25}$/;

							if (!pwdCheck.test(pwd.value)) {
								alert("비밀번호는 영문자+숫자 조합을 사용하여 8~25자리를 입력해야 합니다.");
								pwd.focus();
								return false;
							}

							if (repwd.value.trim() !== pwd.value.trim()) {
								alert("비밀번호가 일치하지 않습니다.");
								repwd.focus();
								return false;
							}

							//이름
							var regName = /^[가-힣]{2,4}$/;

							if (uname.value.trim() === "") {
								alert("이름을 입력하세요.");
								uname.focus();
								return false;
							}

							if (!regName.test(uname.value)) {
								alert("이름은 한글 2~4자리 이내로 입력하세요.");
								uname.focus();
								return false;
							}

							//성별은 selected가 있으니 유효성 검사 삭제
	<%--
					if (!female.checked && !male.checked) {
						alert("성별을 선택해 주세요.");
						female.focus();
						return false;
					}
--%>
		//전화번호 정규식 - 핸드폰 번호만 가능

							var regPhone = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;

							if (!regPhone.test(phone_id.value)) {
								alert("전화번호를 형식에 맞게 입력하세요.");
								phone_id.focus();
								return false;
							}

							//생년월일  yyyymmdd
							var regBirth = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;

							if (!regBirth.test(birth.value)) {
								alert("생년월일을 형식에 맞게 입력하세요.");
								birth.focus();
								return false;
							}

							//이메일
							var regEmail = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
							if (!regEmail.test(email_id.value)) {
								alert("이메일을 형식에 맞게 입력하세요.");
								return false;
							}
							//입력 값 전송
							form.submit();
						});
	</script>





</body>
</html>