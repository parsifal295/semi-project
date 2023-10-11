<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.util.ArrayList, com.boseong.jsp.reservation.model.vo.HanokReservation"%>
<%
	ArrayList<HanokReservation> list = (ArrayList<HanokReservation>)request.getAttribute("rsvList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>한옥 예약조회</title>
<style>
.reservation-list{
	text-align:center;
}
</style>
</head>
<body>
		
	<%@include file = "../common/menubar.jsp" %>
	<div id="content" class="page">
	<div id="box"></div>
	<div id="content" class="page">
		<div class="page">
			<table class="table table-borderless reservation-list">
				<thead>
					<tr>
						<th>예약번호</th>
						<th>룸 타입</th>
						<th>예약 날짜</th>
						<th>예약 인원</th>
						<th>요청사항</th>
						<th>가격</th>
					</tr>
					<tr>
				</thead>
				<tbody>

					<%if(list.isEmpty()){ %>
					<tr>
						<td colspan="4">예약정보가 존재하지 않습니다.</td>
					</tr>
					<%}else{ %>
						<%for(HanokReservation h : list){ %>
						<tr class="hanok-rserv-info">
							<td><%=h.getReservNo() %></td>
							<td><%=h.getRoomNo() %></td>
							<td><%=h.getFromDate() %> ~ <%=h.getToDate() %></td>
							<td><%=h.getClientNum() %></td>
							<td><%=h.getMessage() %></td>
							<td></td>
						</tr>
						<tr>
							<td colspan="5"></td>
							<td>
								<button class="btn btn-outline-warning btn-sm hanok-update">예약 변경</button>
								<button class="btn btn-outline-danger btn-sm hanok-delete">예약 취소</button>
							</td>
						</tr>
						<%} %>
					<%} %>
				</tbody>	

			</table>
		</div>
	</div>
	<%@include file = "../common/footer.jsp" %>
	<script>
		$(function(){
//			let reservations = $('.hanok-rserv-info');
//			for(let i= 0; i<reservations.length;i++){
//				console.log(reservations[i].children[0].innerText);
//			}
			$('.hanok-rserv-info').each(function(){
				let reservation = $(this);
				$.ajax({
					url:'roominfo.rsv',
					data : {roomNo : $(this).children().eq(1).text()},
					success : function(result){
						let clientNo =reservation.children().eq(3).text();
						reservation.children().eq(1).text(result.roomType);
						reservation.children().eq(3).text(clientNo+' / '+result.maxNum);
						let price = (clientNo-result.baseNum)*result.extraPrice + result.price;
						reservation.children().eq(5).text(price + '원');

					},
					error : function(){
						console.log('ajax실패');
					}
				})
			})
			$('.hanok-delete').click(function(){
				let reservation = $(this).parent().parent().siblings().children();
				console.log(reservation);
				let reservNo = $(this).parent().parent().siblings().children().eq(0).text();
			})
		
		})
	</script>
</body>
</html>