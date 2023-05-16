<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=3.0">
<title>로그인</title>
<link rel="stylesheet" href="style.css">
<style type="text/css"></style>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="script.js"></script>
<script type="text/javascript"></script>

<link href="css/join_login.css" rel="stylesheet" type="text/css" />

</head>

<body>

	<article>
		<header>
			<div>
				<h3>로그인</h3>
			</div>
			<ul>
				<li><a href="#section1">회원</a></li>
				<li><a href="#section2">비회원</a></li>
			</ul>
		</header>



		<form action="loginAction.jsp" method="post">
			<section class="login">
				<div>
					<img src="https://cdn-icons-png.flaticon.com/512/456/456212.png"
						alt=""> <input type="text" name="user_id" placeholder="아이디를 입력하세요"></input>
				</div>
				<div>
					<img src="https://cdn-icons-png.flaticon.com/512/3064/3064155.png"
						alt=""> <input type="text" name="password" placeholder="비밀번호를 입력하세요">
				</div>
		</form>


		<div>
			<button type="submit">로그인</button>
		</div>

		<div>
			<ul>
				<li><input type="checkbox" name="" value=""> <a
					href="#">아이디 저장</a></li>
				<li><a href="#">아이디/비밀번호 찾기</a></li>
				<li><a href="join.jsp">회원가입</a></li>
			</ul>
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
		</section>
	</article>

	<article>

		<header>
			<div>
				<h3>내 계정찾기</h3>
			</div>
			<ul>
				<li><a href="#">아이디찾기</a></li>
				<li><a href="#">비밀번호 찾기</a></li>
			</ul>

		</header>

		<section class="find">

			<div>
				<input type="text" placeholder="이름"></input>
			</div>

			<div>
				<ul>
					<li><select>
							<option selected>통신사</option>
							<option>SKT</option>
							<option>KT</option>
							<option>LG</option>
					</select> <select>
							<option selected>010</option>
							<option>011</option>
							<option>012</option>
							<option>013</option>
					</select> <input type="text"> <input type="text"></li>
				</ul>
			</div>

			<div>
				<button>인증번호 전송</button>

			</div>
		</section>
	</article>


	<article>

		<header>
			<div>
				<h3>내 계정찾기</h3>
			</div>
			<ul>
				<li><a href="#">아이디찾기</a></li>
				<li><a href="#">비밀번호 찾기</a></li>
			</ul>
		</header>
		<section class="email">


			<div>
				<li>비밀번호는 암호화 저장되어 분실 시 찾아드릴 수 없는 정보입니다.</li>
				<li>본인확인을 통해 비밀번호를 재 설정 하실 수 있습니다.</li>
			</div>

			<div>
				<ul>
					<li><input type="text" placeholder="이름"></li>

					<li><input type="text" placeholder="아아디(이메일)"> @ <input
						type="text" placeholder="naver.com"> <select>
							<option selected>직접입력</option>
							<option>gmail.com</option>
							<option>naver.com</option>
							<option>daum.net</option>
					</select></li>
				</ul>
			</div>

			<div>
				&nbsp 찾기 방법 &nbsp <input type="checkbox">&nbsp e-mail주소로 보내기
				<input type="checkbox">&nbsp 등록된 휴대폰 번호로 보내기
			</div>

			<div>
				<button type="button1" name="button">
					비밀번호찾기 <span>(인증번호 발송)</span>
				</button>
			</div>

		</section>

	</article>


</body>

</html>