<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.util.ArrayList, com.boseong.jsp.reservation.model.vo.Room"
%>
    
<%
	ArrayList<Room> list = (ArrayList<Room>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>한옥 예약</title>
<style>
@font-face {
	font-family: 'Hangeuljaemin4-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2307-1@1.1/Hangeuljaemin4-Regular.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

#content *{
	font-family: 'Hangeuljaemin4-Regular';
}
</style>
</head>
<body>

<%@ include file = "../common/menubar.jsp" %>
	<div id ="box"></div>
	
	<div id="content" class="page">
		<div class="page">
			<form action="">
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
								<%for(Room r : list){ %>
									<option value="<%=r.getRoomNo()%>"><%=r.getRoomType() %></option>
								<%} %>
							</select>
						</td>
						<td>
							<input type="date" name="fromDate" id="fromDate">
						</td>
						<td>
							<input type="date" name="toDate" id="toDate">
						</td>
						<td>
							<input type ="number" max=4 min =2 placeholder=2 name="clientNum" id="clientNum">
							<span>최대 인원 : </span>
						</td>
						<td>
							객실 타입을 선택하세요.
						</td>
						<td>
							객실 타입을 선택하세요.
						</td>
					</tr>
				</table>
				<h2>투숙객 정보</h2>
				 <table class="table">
					<tr>
						<th>투숙객 성함</th>
						<td><input type="text" readonly value="회원 이름"></td>
					</tr>
					<tr>
						<th>연락처</th>
						<td><input type="text" readonly value="회원 전화번호"></td>
					</tr>
					<tr>
						<th>요청사항</th>
						<td>
							<textarea name="message" id="" cols="100" rows="10"></textarea>
						</td>
					</tr>
				 </table>
			</form>
		
		</div>
	</div>

<%@ include file = "../common/footer.jsp" %>
<script>
	$(function(){
		$('#roomType').change(function(){
			let roomNo = $(this).val();
//			let index = $(this).children('option:selected').val();
//			let maxNum = $('#reserv-info').children().eq(3).children().text();
			$.ajax({
				url : 'detail.hk',
				data : {roomNo : roomNo},
				success : function(e){
				$('#clientNum').attr({min :e.baseNum, placeholder:e.baseNum, max : e.maxNum}).val('');
				$('#reserv-info').children().eq(4).text(e.price+'원');
				if(e.extraPrice == 0){
					e.extraPrice = '해당 없음';
					//$('#reserv-info').children().eq(5).text(e.extraPrice);
				}
				else{
					e.extraPrice += '원';
				}
				$('#reserv-info').children().eq(5).text(e.extraPrice);
				$('#reserv-info span').text('최대인원 : '+e.maxNum);
				},
				error : function(e){
					alert('실패');
					console.log(e);
				}
				})
			});
		let now = new Date();
		let year = now.getFullYear();
		let month = now.getMonth()+1;
		let date = now.getDate();
		if(month<10){
			month = '0'+month;
		}
		if(date<10){
			date = '0'+date;
		}
		let today = year+'-'+month+'-'+date;
		$('#fromDate').attr('min', today).val(today);
		$('#fromDate').change(function(){
			//2023-09-22
			let dateChosen = Number($(this).val().substr(8, 2));
			let monthChosen = Number($(this).val().substr(5, 2));
			let yearChosen = Number($(this).val().substr(0,4));
			
			let thirtyone = [1, 3, 5, 7, 8, 10, 12];
			let thirty = [4,6,9,11];
			
			if(thirtyone.indexOf(monthChosen)!= -1){
				if(dateChosen<31){
					dateChosen += 1;
					dateChosen = dateChosen.toString();
				}
				else{
					dateChosen = '01';
					if(monthChosen==12){
						monthChosen = '01';
						yearChosen +=1;
						yearChosen = yearChosen.toString();
					}
					else{
						monthChosen += 1;
						monthChosen = monthChosen.toString();
					}
				}
			}
			else if(thirty.indexOf(monthChosen) != -1)
			{
				if(dateChosen<30){
					dateChosen += 1;
					dateChosen = dateChosen.toString();
				}
				else{
					dateChosen = '01';
					monthChosen += 1;
					monthChosen = monthChosen.toString();
				}
			}
			else{
				if(yearChosen%4 == 0){
					//윤년
					if(dateChosen<29){
						dateChosen += 1;
						dateChosen = dateChosen.toString();
					}
					else{
						dateChosen = '01';
						monthChosen += 1;
						monthChosen = monthChosen.toString();
					}
				}
				else
				{
					if(dateChosen<28){
						dateChosen += 1;
						dateChosen = dateChosen.toString();
					}
					else{
						dateChosen = '01';
						monthChosen += 1;
						monthChosen = monthChosen.toString();
					}
				}
			}
			let finalDate = yearChosen+'-'+monthChosen+'-'+dateChosen;
//			let from = $(this).val().replace().substr(0,8).concat(dateChosen);
			$('#toDate').attr('min', finalDate);
		})
	});

	

</script>
</body>
</html>