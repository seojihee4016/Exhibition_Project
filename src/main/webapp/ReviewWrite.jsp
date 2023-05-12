<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width-device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>리뷰 게시판 글쓰기</title>
</head>
<body>

<%
request.setCharacterEncoding("UTF-8"); 
  String userID = null;
  if(session.getAttribute("userID") !=null ){
	  userID = (String) session.getAttribute("userID");
  }
%>
<nav class="navbar navbar-default">
<div class="navbar-header">
<button type="button" class="navbar-toggle collapsed"
data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
<span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
</button> 
<a class="navbar-brand" href="ReviewMain.jsp">전시비평(리뷰) 게시판</a>
</div>
<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
<ul class="nav navbar-nav">
<li><a href="ReviewMain.jsp">메인</a>
<li class="active"><a href="boardsite.jsp">게시판</a>
</ul>
<%
  if(userID == null) {
%>
<ul class="nav navbar-nav navbar-right">
<li class="dropdown">
<a href="#" class="dropdown-toggle" data-toggle="dropdown"
role= "button" aria-haspopup="true" aria-expanded="false">접속하기<span class="caret"></span>
</a>
<ul class="dropdown-menu">
<li><a href="login.jsp">로그인</a></li>
<li><a href="join.jsp">회원가입</a></li>
</ul>
</li>
</ul>
<%
  }else{
%>
<ul class="nav navbar-nav navbar-right">
<li class="dropdown">
<a href="#" class="dropdown-toggle" data-toggle="dropdown"
role="button" aria-haspopup="true" aria-expanded="false">회원관리<span class="caret"></span>
</a>
<ul class="dropdown-menu">
<li><a href="logOut.jsp">로그아웃</a></li>
</ul>
</li>
</ul>
<%
  }
%>
</div>
</nav>
<div class="container">
<div class="row">
<form method="post" action="ReviewWriteAction.jsp">
<table class="table table-striped" style="text-align: center; border: 1px solid grey;">
<thead>
<tr>
<th colspan="2" style="background-color: white; text-align: center;">게시판 글쓰기 양식</th></tr>
</thead>
<tbody>
<tr>
<td><input type="text" class="form-control" placeholder="글 제목" name="boardTitle" maxlength="50"></input></td>
</tr>
<tr>
<td>
<textarea class="form-control" placeholder="글 내용" name="boardContent" maxlength="3000" style="height: 350px;"></textarea>
</td>
</tr>
</tbody>
</table>
<input type="submit" class="btn btn-primary pull-right" value="저장하기"></input>
</form>
</div>
</div>
<script scr="https://code.jquery.com/jquery-3.1.1.min.js">
</script>
<script src="js/bootstrap.js"></script>
</body>
</html>