<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="exhibition.dao.ExhibitionDao"%>
<%@ page import="exhibition.dto.ExhibitionDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.*"%>
<%@ page import="exhibition.dao.MyDateUtil"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
</head>
<body>
	<%@ include file = "navBar.jsp" %>
</head>
<body>
	<%
	//1. 로그인세션제어(관리자는 제외)
	//String user_id = (String) session.getAttribute("user_id");
	//if (user_id == null || !user_id.equals("admin")) { //순서바뀌면 에러발생하므로 항상 null 먼저 비교할 것
	//	response.sendRedirect("login.jsp");
	//}
	

	request.setCharacterEncoding("UTF-8");
	int seq = Integer.parseInt(request.getParameter("seq"));

	//2. DAO객체생성
	ExhibitionDao exhibitionDao = new ExhibitionDao();

	//3. 회원목록을 가져오는 메서드 사용
	ExhibitionDto exhibitionDto = exhibitionDao.selectDpInfoBydp_seq(seq);
	%>

	<h2>전시 상세정보</h2>
	<table>
		<tr>
			<br>
			<img src="<%=exhibitionDto.getDp_main_img()%>"
				style="width: 550px; height: 250px;">
			<br>
			<h3><%=exhibitionDto.getDp_name()%></h3>
			전시 장소 : <%=exhibitionDto.getDp_place()%><br>
			<br><span>전시 기간 :</span>
			<%=MyDateUtil.convertStringToUtilDate(exhibitionDto.getDp_start())%>
			~
			<%=MyDateUtil.convertStringToUtilDate(exhibitionDto.getDp_end())%><br>
			<br>주최 및 후원 : <%=exhibitionDto.getDp_sponsor()%><br>
			<br>관람 시간 : <%=exhibitionDto.getDp_viewtime()%><br>
			<br>관람 요금 :
			<%=exhibitionDto.getDp_viewcharge()%><br>
			<br>전시 부문 :
			<%=exhibitionDto.getDp_art_part()%><br>
			<br>출품 작가 :
			<%=exhibitionDto.getDp_artist()%><br>
			<br>관람 포인트 : 
			<%=exhibitionDto.getDp_viewpoint()%><br>
			<br>전시 설명 :
			<%=exhibitionDto.getDp_info()%><br>
			</td>
			<button onclick="moveBookMainPage()">예약하기</button>
			<br>
		</tr>
		<%
		//}
		%>
	</table>

</body>

<script>
	function moveBookMainPage() {
		location.href = 'bookMain.jsp'; // 다른 JSP 페이지의 경로
	}
</script>
</html>