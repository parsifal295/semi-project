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
</head>
<body>
		
	<%@include file = "../common/menubar.jsp" %>
	<div id="content" class="page">
	<div id="box"></div>
	<div id="content" class="page">
		<div class="content">
			<table class="table">
				<thead>
					<tr>
						<th>룸 타입</th>
						<th>예약 날짜</th>
						<th>기준인원/최대인원</th>
						<th>요청사항</th>
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
							<td><%=h.getRoomNo() %></td>
							<td><%=h.getFromDate() %> ~ <%=h.getToDate() %></td>
							<td><%=h.getClientNum() %></td>
							<td><%=h.getMessage() %></td>
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
			let roomNo =$('.hanok-reserv-info').children().eq(0).val();
			console.log(roomNo);
		})
	</script>
</body>
</html>