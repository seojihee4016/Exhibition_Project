<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookMain</title>
</head>
<body>
	<h1>예약 메인</h1>

	<form name='bookForm' action="bookAction.jsp" method="post" class="cf"
		name="select">

		<label for="stringsize">전시회 선택</label> 
		<select name="size" id="stringsize" onchange="checkPrice()" required>
			<option value="" selected>선택하세요</option>
			<option value="">전시회 1</option>
			<option value="">전시회 2</option>
			<option value="">전시회 3</option>
		</select> 
		
		
		<input type="hidden" name="user_id" id="user_id"
			value="${successLoginUser  }"> <label for="start-day">일자</label>
		<input type="date" name="bookDateS" id="start_day" class="start-date"
			onchange="checkPrice()" min="2023-04-25" max="2023-07-09" required>
		<%--min max 사용해서 날짜 제한 걸기--%>




		<button type="submit" id="next_btn" onclick="insertOpt()">예약하기</button>
	</form>


	<script>
		document.getElementById('next_btn').addEventListener('click', function(e) {
			var form = document.bookForm;
			
			var start_day = document.getElementById("start_day");

			
			//예약 날짜 선택 확인
			if (start_day.value.trim() == "") {
				alert("날짜를 선택하세요.");
				start_day.focus();
				e.preventDefault(); //이벤트를 걸어서 폼으로 안 넘어가게 막기
				return false;
			}			
		});
		
		
		
		
		</script>
</body>
</html>