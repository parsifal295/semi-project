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
									<th>예약일</th>
									<th>예약시간</th>
									<th>인원</th>
								</tr>

								<tr>
									<td><%=list.get(i).getHorseDate() %></td>
									<td><%=list.get(i).getHorseTime() %></td>
									<td><%=list.get(i).getRiderNum() %></td>
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


	<%@include file="../common/footer.jsp"%>

</body>
</html>