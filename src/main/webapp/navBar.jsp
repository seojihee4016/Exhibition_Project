<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>
</head>
<body>
	
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid">
			<a class="navbar-brand" href="main.jsp">Home</a>
			
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
				<% String user_id = (String) session.getAttribute("user_id");
				if (user_id == null) { 
					// 세션에 아이디가 없으면 로그인 회원가입이 보임.
				%>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="login.jsp">로그인</a></li>
					<li class="nav-item"><a class="nav-link" href="join.jsp">회원가입</a>
					</li>
					<%
					}
					%>
				
				<%if (user_id != null && !user_id.equals("")) { 
					// 세션에 아이디가 있으면 로그인 회원가입이 안보임.
					%><li class="nav-item">
					<a class="nav-link" ><%=session.getAttribute("user_id")%>님</a></li>
					<li class="nav-item"><a class="nav-link"  href="admin.jsp">마이페이지</a></li>
					<li class="nav-item"><a class="nav-link" href="booktest.jsp">예약하기</a></li>
					<li class="nav-item"><a class="nav-link" href="logOut.jsp" onclick="fnLogout(); return false;"
					>로그아웃</a></li>
					<%
					}
					%>
					
				</ul>
			</div>
		</div>
	</nav>


	
	
	
</body>
</html>