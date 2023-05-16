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
		//response.sendRedirect("login.jsp");
	//}
	
	ExhibitionDao exhibitionDao = new ExhibitionDao();
	// 목록 가져오는 메소드
	exhibitionDao.getExhibitionMainList();
	ArrayList exhibitionMainList = exhibitionDao.getExhibitionMainList();
	%>
	
	<h1>메인 페이지</h1>
	

	<table>

		<%
		//반복문
		//ArrayList는 가변배열이므로 length가 없고 size가 존재한다.
		//size()메서드는 배열의 요소의 갯수를 리턴
		for (int i = 0; i < exhibitionMainList.size(); i++) {
			ExhibitionDto exhibitionDto = (ExhibitionDto) exhibitionMainList.get(i);
			String classAttr = "imgNum" + i;
			// 불러온 이미지에 각각 다른 class 값을 넣어줌
		%>
		<tr>
			<td><br> <img src="<%=exhibitionDto.getDp_main_img()%>"
				id="<%=exhibitionDto.getDp_seq()%>"
				style="width: 350px; height: 250px;" class="<%=classAttr%> imgs"><br>
				<h3><%=exhibitionDto.getDp_name()%></h3> @ <%=exhibitionDto.getDp_place()%><br>
				<%=MyDateUtil.convertStringToUtilDate(exhibitionDto.getDp_start())%>
				 ~ 
				<%=MyDateUtil.convertStringToUtilDate(exhibitionDto.getDp_end())%><br></td>
		</tr>
		<%
		}
		%>
	</table>
	<script></script>
</body>
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
<script>
	$(function() {

		$(".imgs").click(function() {

			const temp_link = $(this).attr("id");
			location.href = 'mainInside.jsp?seq=' + temp_link; // 다른 JSP 페이지의 경로

		});
	});
</script>

</html>