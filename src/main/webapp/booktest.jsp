<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="book.bookDao"%>
<%@ page import="book.bookDto"%>
<%@ page import="signUp.dao.MemberDao"%>
<%@ page import="signUp.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%
request.setCharacterEncoding("UTF-8");
int seq = Integer.parseInt(request.getParameter("seq"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">
</head>
<body>
	<%
	String user_id = (String) session.getAttribute("user_id");

	if (user_id != null && !user_id.equals("")) { // 세션에 아이디가 있으면 로그아웃이 보임.
	%>

	<li><a href="logOut.jsp" onclick="fnLogout(); return false;"
		alt="로그아웃">로그아웃(<%=(String) session.getAttribute("user_id")%>)
	</a></li>

	<%
	}
	%>

	<form action="booktest_proc.jsp" method="post">
		<input type="text" id="seq" name="seq" value="<%=seq%>" hidden> 날짜<input
			type="date" name="bookDate"> <input type="hidden" name="cmd"
			value="order">
		<div class="bookCheckdiv" id="bookCheck">
			<div class="row data">
				<div class="check">
					<input type="checkbox" name="buy" value="260" checked=""
						onclick="javascript:bookCheck.checkItem();">&nbsp;
				</div>
			</div>
			<div class="subdiv">
				<div class="bookCheckprice">
					<input type="hidden" name="p_price" id="p_price1" class="p_price"
						value="17000">성인 17,000원
				</div>
				<div class="num">
					<div class="updown">
						<input type="text" name="p_num1" id="p_num1" size="2"
							maxlength="1" class="p_num" value="0"
							onkeyup="javascript:bookCheck.changePNum(1);"> <span
							onclick="javascript:bookCheck.changePNum(1);"><i
							class="fas fa-arrow-alt-circle-up up"></i></span> <span
							onclick="javascript:bookCheck.changePNum(1);"><i
							class="fas fa-arrow-alt-circle-down down"></i></span>
					</div>
				</div>
				<div class="sum">0원</div>
			</div>
			<div class="subdiv"></div>
		</div>
		<div class="row data">
			<div class="subdiv">
				<div class="check">
					<input type="checkbox" name="buy" value="261" checked=""
						onclick="javascript:bookCheck.checkItem();">&nbsp;
				</div>

			</div>
			<div class="subdiv">
				<div class="bookCheckprice">
					<input type="hidden" name="p_price" id="p_price2" class="p_price"
						value="15000">청소년 15,000원
				</div>
				<div class="num">
					<div class="updown">
						<input type="text" name="p_num2" id="p_num2" size="2"
							maxlength="4" class="p_num" value="0"
							onkeyup="javascript:bookCheck.changePNum(2);"> <span
							onclick="javascript:bookCheck.changePNum(2);"><i
							class="fas fa-arrow-alt-circle-up up"></i></span> <span
							onclick="javascript:bookCheck.changePNum(2);"><i></i></span>
					</div>
				</div>
				<div class="sum">0원</div>
			</div>

		</div>
		<div class="row data">
			<div class="subdiv">
				<div class="check">
					<input type="checkbox" name="buy" value="262" checked=""
						onclick="javascript:bookCheck.checkItem();">&nbsp;
				</div>

			</div>
			<div class="subdiv">
				<div class="bookCheckprice">
					<input type="hidden" name="p_price" id="p_price3" class="p_price"
						value="12000">아동 12,000원
				</div>
				<div class="num">
					<div class="updown">
						<input type="text" name="p_num3" id="p_num3" size="2"
							maxlength="4" class="p_num" value="0"
							onkeyup="javascript:bookCheck.changePNum(3);"> <span
							onclick="javascript:bookCheck.changePNum(3);"><i
							class="fas fa-arrow-alt-circle-up up"></i></span> <span
							onclick="javascript:bookCheck.changePNum(3);"><i
							class="fas fa-arrow-alt-circle-down down"></i></span>
					</div>
				</div>
				<div class="sum">0원</div>
			</div>

		</div>

		</div>

		<div class="right-align bookCheckrowcmd">
			<a href="javascript:void(0)" class="abutton"
				onclick="javascript:bookCheck.delCheckedItem();">선택상품삭제</a> <a
				href="javascript:void(0)" class="abutton"
				onclick="javascript:bookCheck.delAllItem();">비우기</a>
		</div>

		<div class="bigtext right-align sumcount" id="sum_p_num">인원 수 :
			0명</div>
		<div class="bigtext right-align box blue summoney" id="sum_p_price">합계금액:
			0원</div>



		<input id="g_Pcount" name="peopleCount" hidden>
		<input id="g_Price" name="price" hidden>
		<button type="submit" onclick=''>예약</button>
	</form>





	<script>
		var g_pCount = 0;
		let bookCheck = {
			totalCount : 0,
			totalPrice : 0,
			//체크한 인원 수 없애기
			delCheckedItem : function() {
				document.querySelectorAll("input[name=buy]:checked").forEach(
						function(item) {
							item.parentElement.parentElement.parentElement
									.remove();
						});
				//AJAX 서버 업데이트 전송

				//전송 처리 결과가 성공이면
				this.reCalc();
				this.updateUI();
			},
			//장바구니 전체 비우기
			delAllItem : function() {
				document.querySelectorAll('.row.data').forEach(function(item) {
					item.remove();
				});
				//AJAX 서버 업데이트 전송

				//전송 처리 결과가 성공이면
				this.totalCount = 0;
				this.totalPrice = 0;
				this.reCalc();
				this.updateUI();
			},
			//재계산
			reCalc : function() {
				this.totalCount = 0;
				this.totalPrice = 0;
				document
						.querySelectorAll(".p_num")
						.forEach(
								function(item) {
									if (item.parentElement.parentElement.parentElement.previousElementSibling.firstElementChild.firstElementChild.checked == true) {
										var count = parseInt(item
												.getAttribute('value'));
										this.totalCount += count;
										var price = item.parentElement.parentElement.previousElementSibling.firstElementChild
												.getAttribute('value');
										this.totalPrice += count * price;
									}
								}, this); // forEach 2번째 파라메터로 객체를 넘겨서 this 가 객체리터럴을 가리키도록 함. - thisArg
			},
			//화면 업데이트
			updateUI : function() {
				document.querySelector('#sum_p_num').textContent = '인원 수: '
						+ this.totalCount.formatNumber() + '명';
				document.querySelector('#sum_p_price').textContent = '합계금액: '
						+ this.totalPrice.formatNumber() + '원';
				g_pCount = this.totalCount.formatNumber();
				document.querySelector("#g_Pcount").value = this.totalCount;
				document.querySelector("#g_Price").value = this.totalPrice;
			},
			//개별 수량 변경
			changePNum : function(pos) {
				var item = document.querySelector('input[name=p_num' + pos
						+ ']');
				var p_num = parseInt(item.getAttribute('value'));
				var newval = event.target.classList.contains('up') ? p_num + 1
						: event.target.classList.contains('down') ? p_num - 1
								: event.target.value;

				if (parseInt(newval) < 0 || parseInt(newval) > 4) {
					return false;
				}

				item.setAttribute('value', newval);
				item.value = newval;

				var price = item.parentElement.parentElement.previousElementSibling.firstElementChild
						.getAttribute('value');
				item.parentElement.parentElement.nextElementSibling.textContent = (newval * price)
						.formatNumber()
						+ "원";
				//AJAX 업데이트 전송

				//전송 처리 결과가 성공이면    
				this.reCalc();
				this.updateUI();
			},
			checkItem : function() {
				this.reCalc();
				this.updateUI();
			},
			delItem : function() {
				event.target.parentElement.parentElement.parentElement.remove();
				this.reCalc();
				this.updateUI();
			}
		}

		// 숫자 3자리 콤마찍기
		Number.prototype.formatNumber = function() {
			if (this == 0)
				return 0;
			let regex = /(^[+-]?\d+)(\d{3})/;
			let nstr = (this + '');
			while (regex.test(nstr))
				nstr = nstr.replace(regex, '$1' + ',' + '$2');
			return nstr;
		};
	</script>
</body>
</html>