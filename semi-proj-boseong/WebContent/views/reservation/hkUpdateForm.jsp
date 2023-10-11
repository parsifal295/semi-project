<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, com.boseong.jsp.reservation.model.vo.Room, com.boseong.jsp.reservation.model.vo.HanokReservation"%>

<%
	ArrayList<Room> list = (ArrayList<Room>) request.getAttribute("list");
	HanokReservation selectedRsv = (HanokReservation)request.getAttribute("selectedRsv");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>한옥 예약 변경</title>
<style>
@font-face {
	font-family: 'Hangeuljaemin4-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2307-1@1.1/Hangeuljaemin4-Regular.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

#content * {
	font-family: 'Hangeuljaemin4-Regular';
}

#useInfo {
	width: 80%;
	height: auto;
	box-sizing: border-box;
	float: left;
}

#confirm-button {
	padding-top: 220px;
	width: 20%;
	height: auto;
	float: left;
	box-sizing: border-box;
}
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp"%>
	<div id="box"></div>

	<div id="content" class="page">
		<div class="page">
			<form action="insertHanok.rsv">
				<input type="hidden" name="userNo" value="<%=loginUser.getMemNo()%>">
				<h2>예약 변경</h2>
				<table class="table">
					<tr>
						<th>객실 타입</th>
						<th colspan="2">숙박 기간</th>
						<th>숙박 인원</th>
						<th>기준 금액</th>
						<th>기준인원 초과 시</th>
					</tr>

					<tr id="reserv-info">
						<td>
						<select name="roomType" id="roomType" required>
								<option value="0">객실 타입 선택</option>
								<%
									for (Room r : list) {
								%>
								<option value="<%=r.getRoomNo()%>"><%=r.getRoomType()%></option>
								<%
									}
								%>
						</select>
						</td>
						<td><input type="date" name="fromDate" id="fromDate">
						</td>

						<td><input type="date" name="toDate" id="toDate">
							<button type="button" id="date-check">예약 가능 확인</button></td>
						<td><input type="number" max=4 min=2 placeholder=2
							name="clientNum" id="clientNum" value="2" required> <span>최대
								인원 : </span></td>
						<td>객실 타입을 선택하세요.</td>
						<td>객실 타입을 선택하세요.</td>
					</tr>
				</table>
				<h2>투숙객 정보</h2>
				<table class="table">
					<tr>
						<th>투숙객 성함</th>
						<td><input type="text" readonly
							value="<%=loginUser.getMemName()%>"></td>
					</tr>
					<tr>
						<th>연락처</th>
						<td><input type="text" readonly
							value="<%=loginUser.getPhone()%>"></td>
					</tr>
					<tr>
						<th>요청사항</th>
						<td><textarea name="message" id="" cols="100" rows="8"><%=selectedRsv.getMessage()%></textarea>
						</td>
					</tr>
				</table>
				<div id="useInfo">
					<h3>입/퇴실 안내 및 주의사항</h3>
					<pre>
[이용시 주의사항]
 보호자를 동반하지 않은 미성년자는 어떠한 경우에도 입실하실 수 없습니다
 객실 내에서는 금연입니다
 화재 및 냄새로 인한 타 손님 배려 차원에서 객실 내 돼지고기, 생선, 청국장등의 조리를 금하오니 실외 지정된 장소 및 자연과 벗한 바베큐장을 이용하시길 부탁드립니다
[예약 및 이용 시 주의사항]
체크아웃은 11시, 체크인은 15시입니다.
실시간예약 특성상 간혹 예약이 중복될 수 있으며, 바로 연락드려 전액환불 도와드리겠습니다.
이용불가 안내를 받았을 경우 직접 취소 시 수수료가 발생하니 고객센터로 연락바랍니다.
예약변경 시 고객센터로 연락바라며, 업체규정에 따라 변경이 불가하거나 수수료가 발생할 수 있습니다.
추가인원요금이 예약 시 결제되지 않을 수 있으며, 이 경우 현장결제 부탁드립니다.
당일예약 후 당일이용건일 경우 이용이 불가할 수 있으니 업체에 사전확인 부탁드립니다.
사전예약취소 없이 사용하지 않은 예약건에 대해서는 환불이 불가합니다.
			</pre>
				</div>
				<div id="confirm-button" align="center">
					<input type="checkbox" required> 주의사항을 읽었고 확인하였습니다. <br>
					<button type="submit" class="btn btn-outline-danger" disabled>예약하기</button>
				</div>

			</form>
		</div>
	</div>

	<%@ include file="../common/footer.jsp"%>
	<script>
		$(function() {
			$('#date-check')
					.click(
							function() {
								if ($('#roomType').val() == 0) {
									alert('객실 타입을 선택해주세요.');
									$('#roomType').focus();
								} else {
									$
											.ajax({
												url : 'datecheck.hk',
												data : {
													roomNo : $('#roomType')
															.val(),
													fromDate : $('#fromDate')
															.val(),
													toDate : $('#toDate').val()
												},
												success : function(e) {
													//선택한 방에 이미 예약되어있는 날짜들 가져오기
													if (e.length == 0) {
														let dateConfirm = confirm('예약 가능한 날짜입니다! 이 날짜에 예약하시겠습니까?');
														if (dateConfirm) {
															$('#date-check')
																	.attr(
																			'disabled',
																			true);
															$(
																	'#confirm-button>button')
																	.attr(
																			'disabled',
																			false);
														}
													} else {
														let str = $(
																'#roomType :selected')
																.text()
																+ '에는 다음 기간에 이미 예약이 존재합니다ㅜㅜ';
														for ( let i in e) {
															str += '\n체크인 : '
																	+ e[i].fromDate
																	+ ' 체크아웃 : '
																	+ e[i].toDate;
														}
														alert(str);
													}
												},
												error : function() {
													alert('ajax 왤케어려움... 난리남');
												}
											})
								}

							});

			$('#roomType').change(function() {
				let roomNo = $(this).val();
				//			let index = $(this).children('option:selected').val();
				//			let maxNum = $('#reserv-info').children().eq(3).children().text();
				$.ajax({
					url : 'detail.hk',
					data : {
						roomNo : roomNo
					},
					success : function(e) {
						$('#clientNum').attr({
							min : e.baseNum,
							placeholder : e.baseNum,
							max : e.maxNum
						}).val(e.baseNum);
						$('#reserv-info').children().eq(4).text(e.price + '원');
						if (e.extraPrice == 0) {
							e.extraPrice = '해당 없음';
							//$('#reserv-info').children().eq(5).text(e.extraPrice);
						} else {
							e.extraPrice += '원';
						}
						$('#reserv-info').children().eq(5).text(e.extraPrice);
						$('#reserv-info span').text('최대인원 : ' + e.maxNum);
					},
					error : function(e) {
						alert('실패');
						console.log(e);
					}
				})
			});
			let now = new Date();
			let year = now.getFullYear();
			let month = now.getMonth() + 1;
			let date = now.getDate();
			if (month < 10) {
				month = '0' + month;
			}
			if (date < 10) {
				date = '0' + date;
			}
			let today = year + '-' + month + '-' + date;
			$('#fromDate').attr('min', today).val(today);
			$('#fromDate').change(
					function() {
						//2023-09-22
						let dateChosen = Number($(this).val().substr(8, 2));
						let monthChosen = Number($(this).val().substr(5, 2));
						let yearChosen = Number($(this).val().substr(0, 4));

						let thirtyone = [ 1, 3, 5, 7, 8, 10, 12 ];
						let thirty = [ 4, 6, 9, 11 ];

						if (thirtyone.indexOf(monthChosen) != -1) {
							if (dateChosen < 31) {
								dateChosen += 1;
								dateChosen = dateChosen.toString();
							} else {
								dateChosen = '01';
								if (monthChosen == 12) {
									monthChosen = '01';
									yearChosen += 1;
									yearChosen = yearChosen.toString();
								} else {
									monthChosen += 1;
									monthChosen = monthChosen.toString();
								}
							}
						} else if (thirty.indexOf(monthChosen) != -1) {
							if (dateChosen < 30) {
								dateChosen += 1;
								dateChosen = dateChosen.toString();
							} else {
								dateChosen = '01';
								monthChosen += 1;
								monthChosen = monthChosen.toString();
							}
						} else {
							if (yearChosen % 4 == 0) {
								//윤년
								if (dateChosen < 29) {
									dateChosen += 1;
									dateChosen = dateChosen.toString();
								} else {
									dateChosen = '01';
									monthChosen += 1;
									monthChosen = monthChosen.toString();
								}
							} else {
								if (dateChosen < 28) {
									dateChosen += 1;
									dateChosen = dateChosen.toString();
								} else {
									dateChosen = '01';
									monthChosen += 1;
									monthChosen = monthChosen.toString();
								}
							}
						}
						let finalDate = yearChosen + '-' + monthChosen + '-'
								+ dateChosen;
						//			let from = $(this).val().replace().substr(0,8).concat(dateChosen);
						$('#toDate').attr('min', finalDate);
					})
		});
	</script>
</body>
</html>