<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="join_login.css" rel="stylesheet" type="text/css" />
</head>
<body>

	<article>
		<header>
			<div>
				<h3>회원 가입</h3>
			</div>
			<ul>
				<li><a href="#">가입</a></li>
				<li><a href="#section1">약관동의</a></li>
				<li><a href="#section2">정보입력</a></li>
				<li><a href="#section3">가입완료</a></li>
			</ul>
		</header>
		<section class="member">
			<div>
				<h3>회원가입을 환영합니다</h3>
				<br> 회원으로 가입하시면 다양한 혜택과 <br> 서비스를 이용하실 수 있습니다.
			</div>

			<div>
				<a href="#section1">
					<button>가입하기(14세 이상)</button>
				</a>
			</div>

			<div>
				<ul>
					<li><img src="https://i.imgur.com/eeac0hg.png" alt="">
						네이버 아이디로 로그인</li>
					<li><img src="https://i.imgur.com/aI8boDk.png" alt="">
						카카오톡 아이디로 로그인</a></li>
					<li><img src="https://i.imgur.com/bIZEuW4.png" alt="">
						페이스북 아이디로 로그인</a></li>
				</ul>
			</div>

			<div>&#8251;가입은 만 14세 이상 고객만 가능합니다.</div>

		</section>
	</article>




	<article id="section1">
		<header>
			<div>
				<h3>회원 가입</h3>
			</div>
			<ul>
				<li><a href="#">가입</a></li>
				<li><a href="#section1">약관동의</a></li>
				<li><a href="#section2">정보입력</a></li>
				<li><a href="#section3">가입완료</a></li>
			</ul>
		</header>

		<form name='personAddForm' action="join_proc.jsp" method="post">
			<section class="agree">
				<div>
					<input type="checkbox" name='check' onclick='selectAll(this)' />
					<h4>전체동의</h4>
				</div>

				<div>
					<table>
						<tr>
							<h4>필수 동의항목</h4>
							<td><input type="checkbox" name='check' id="essentialCheck1"
								value="y">이용약관</td>
							<td>내용보기</td>
						</tr>
						<tr>
							<td><input type="checkbox" name='check' id="essentialCheck2"
								value="y">개인정보 수집 및 이용 동의</td>
							<td>내용보기</td>
						</tr>
					</table>
				</div>

				<div>
					<table>
						<tr>
							<h4>선택 동의 항목</h4>
							<td><input type="checkbox" name='check' value="y">개인정보
								수집 및 이용 동의</td>
							<td>내용보기</td>
						</tr>
						<tr>
							<td><input type="checkbox" name='check' value="y">마케팅
								수신 동의</td>
							<td>내용보기</td>
						</tr>
					</table>
				</div>
				<div>
					<p>
						<span>&#8251;정보수신에 동의하지 않으셔도 정상적인 서비스 이용이 가능합니다.</span> <br>
						<br> 거래정보,결제/교환/환불 등과 관련된 내용은 거래 안전을 위하여 수신동의 영부와 관계없이 방송됩니다.

					</p>
				</div>


			</section>
	</article>


	<article>
		<header>
			<div>
				<h3>회원 가입</h3>
			</div>
			<ul>
				<li><a href="#">가입</a></li>
				<li><a href="#section1">약관동의</a></li>
				<li><a href="#section2">정보입력</a></li>
				<li><a href="#section3">가입완료</a></li>
			</ul>
		</header>

		<section class="detail" id="section2">
			<div>
				<ul>
					<li>
					<li><input type="text" id="uid" name="user_id" maxlength="20"
						placeholder="아이디" style = "width: 100%;"></li>

					<li><input type="button" onclick="IdCheck()" value="ID 중복확인"><br>
						<input type="hidden" id="idCheckFlag" name="idCheckResult"
						value="0"></li>


					

					<li><input type="password" id="pwd" name="password"
						placeholder="비밀번호"></li>
					<li><input type="password" id="repwd" name="password"
						placeholder="비밀번호 확인"></li>
					<p>8~15자의 영문,숫자</p>



					<li><input type="text" id="email_id" name="email" size="30" placeholder="이메일" style = "width: 100%;"></li>


				</ul>
			</div>

			<div>
				<ul>


					<li><input type="text" id="uname" name="name" placeholder="이름"></li>
					<li><input type="text" id="birth" name="birthDate" size="8"
						placeholder="생년월일" style = "width: 100%;"></li>
					<li><input type="radio" id="female" name="gender" value="f"
						checked>&nbsp여자 <input type="radio" id="male"
						name="gender" value="m">&nbsp남자</li>
				</ul>
			</div>

			<div>
				<ul>
					<li><select>
							<option selected>010</option>
							<option>011</option>
							<option>016</option>
							<option>070</option>
					</select> <input type="text" id="phone_id" name="phone" maxlength="9"  placeholder="ex)1234-1234" style = "width: 66%;">
					</li>

					
				</ul>
			</div>

			<div>
				<button id="insertBtn" type="button" style = "width: 100%;">동의하고 회원가입</button>
			</div>
		</section>
	</article>
</form>

	<article id="section3">
		<header>
			<div>
				<h3>회원 가입</h3>
			</div>
			<ul>
				<li><a href="#">가입</a></li>
				<li><a href="#section1">약관동의</a></li>
				<li><a href="#section2">정보입력</a></li>
				<li><a href="#section3">가입완료</a></li>
			</ul>
		</header>




		<section class="finish">

			<div>
				<h3>회원가입 완료</h3>
				<h4>
					회원으로 가입을 하시면 <br> 다양한 혜택과 서비스를 <br> 이용하실 수 있습니다.
				</h4>
			</div>

			<div>
				<button typse="button" name="buttonLogin" onclick = "location.href = 'login.jsp' ">로그인</button>
				<button type="button" name="buttonLogout" onclick = "location.href = 'logOut.jsp' ">로그아웃</button>
			</div>

		</section>
		
	</article>



	<script>

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
								.getElementById("idCheckFlag");

						
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


						var regPhone = /^(?:\d{3}|\d{4})-\d{4}$/;
						
						if (!regPhone.test(phone_id.value)) {
							alert("전화번호를 형식에 맞게 입력하세요.");
							phone_id.focus();
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




		<script>
						//약관 전체 동의 체크 박스
						function selectAll(selectAll)  {
							  const checkboxes 
							       = document.getElementsByName('check');
							  
							  checkboxes.forEach((checkbox) => {
							    checkbox.checked = selectAll.checked;
							  })
							  
						}
								
							
						//아이디 중복 확인	
						function IdCheck() {
							window.open("IdCheckForm.jsp", "idwin", "width=500, height=350");
						
							// 아이디 중복확인 버튼을 눌렀을 때, 중복확인 여부를 변경
							document.getElementById("idCheckFlag").value = "1";
						}
		</script>

</body>
</html>