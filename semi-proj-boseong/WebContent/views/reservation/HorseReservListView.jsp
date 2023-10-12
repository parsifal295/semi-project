<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, com.boseong.jsp.reservation.model.vo.HorseReservation"%>

<%
	ArrayList<HorseReservation> list = (ArrayList<HorseReservation>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>승마장 예약 확인</title>
<style>

ul, li {
	list-style: none;
}

#horse-reserv-list {
	font-size: 25px;
}

#horse-reserv-list fieldset {
	width: 90%;
	padding-left: 0;
	margin-bottom:10px;
	margin-left:50px;
}

#horse-reserv-list th, #horse-reserv-list td {
	padding-left: 50px;
	padding-top:5px;
	padding-bottom:5px;
	width: 300px;
}

#horse-reserv-list div {
	border-radius: 20px;
	margin-right: 15px;
	margin-bottom : 10px;
}
</style>
</head>
<body>

	<%@include file="../common/menubar.jsp"%>
	<div id="box"></div>
	<div class="page" id="content">

		<div class="page">
			<h1>예약 조회</h1>
			<ul id="horse-reserv-list">
				<li>
					<%
						if (list.isEmpty()) {
					%>
					<h1>예약이 없습니다.</h1> 
					<%} else {%> 
						<%for (int i = 0; i < list.size(); i++) {%>
					<fieldset>
						<legend>
							<h2><%=list.get(i).getProgramNo() %></h2>
						</legend>
						<div>
							<table>

								<tr>
									<td><%=list.get(i).getReservNo() %></td>
									<td><h5>예약일</h5><%=list.get(i).getHorseDate() %></td>
									<td><h5>예약 시간</h5><%=list.get(i).getHorseTime() %></td>
									<td><h5>예약 인원</h5><%=list.get(i).getRiderNum() %></td>
									<td>
									<button class="btn btn-warning update-hs">예약 변경</button>
									<button class="btn btn-danger">예약 취소</button>
									</td>
								</tr>

							</table>
						</div>
					</fieldset>
							<%}%>
						<%}%>
				</li>
			</ul>

		</div>

	</div>
	<script>
		$(function(){
			$('.update-hs').click(function(){
				let reservNo = $(this).parent().parent().children().eq(0).text();
				location.href = "<%=contextPath%>/updateForm.hs?reservNo="+reservNo;
			});
		})
	</script>


	<%@include file="../common/footer.jsp"%>

</body>
</html>