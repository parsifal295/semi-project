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
					<tr>
					<td colspan="5"></td>
					<td><button class="btn btn-outline-warning btn-sm" data-toggle="modal" data-target="#hanok-update">예약 변경</button>
					<button class="btn btn-outline-danger btn-sm" data-toggle="modal" data-target="#hanok-delete">예약 취소</button></td>
							
					</tr>

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
						<%} %>
					<%} %>
				</tbody>	

			</table>
		</div>
	</div>
	<%@include file = "../common/footer.jsp" %>
	
	
	<!-- 모달해보기 -->
	<div class = "modal" id="hanok-delete">
		<div class="modal-dialog">
			<div class = "modal-content">
			<!-- Modal Header -->
			<div class = "modal-header">
				<h4 class="modal-title">한옥예약 취소</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<!-- Modal body -->
			<div class= "modal-body">
				<form action="delete.hk">
					<label for = "reservNo">예약 번호 :</label>
					<input type = "text" name="reservNo" id="reservNo" required>
					<input type="hidden" name="memNo" value="<%=loginUser.getMemNo()%>">
					<button type="submit">취소</button>
				</form>
			</div>
			<!-- Modal Footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
			</div>
			</div>
		</div>
	</div>
	
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
		
		})
	</script>
		<div class = "modal" id="hanok-update">
		<div class="modal-dialog">
			<div class = "modal-content">
			<!-- Modal Header -->
			<div class = "modal-header">
				<h4 class="modal-title">한옥예약 수정</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<!-- Modal body -->
			<div class= "modal-body">
				<form action="updateForm.hk">
					<label for = "reservNo">예약 번호 :</label>
					<input type = "text" name="reservNo" id="reservNo" required>
					<input type="hidden" name="memNo" value="<%=loginUser.getMemNo()%>">
					<button type="submit">수정</button>
				</form>
			</div>
			<!-- Modal Footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
			</div>
			</div>
		</div>
	</div>
</body>
</html>