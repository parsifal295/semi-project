<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import = "com.boseong.jsp.reservation.model.vo.Room"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	Room r = (Room)request.getAttribute("room");
%>
<c:choose>
	<c:when test="${room.roomNo eq 1 }">
		<c:set var="imgName" value="room1.avif"/>
	</c:when>
	<c:when test="${room.roomNo eq 2 }">
		<c:set var="imgName" value="room2.avif"/>
	</c:when>
	<c:otherwise>
		<c:set var="imgName" value="room4.jpeg"/>
	</c:otherwise>

</c:choose>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Room${room.roomNo} 상세정보 </title>
<style>
.outer {
	float: left;
}

.left {
	width: 10%;
	height: 100%;
	box-sizing: border-box;
}

.right {
	width: 90%;
	height: 100%;
	box-sizing: border-box;
}

ul, li {
	list-style: none;
}

#room-pictures>img {
	width: 90%;
	padding-left: 100px;
}

h4 {
	margin: 0;
}

#room-detail table {
	width: 100%;
}
</style>

</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	<div id="box"></div>
	<div class="page" id="content">
		<div class="page">
			<div class="outer left">
				<h3 align="center">방 정보</h3>
				<ul>
					<li><a href="<%=contextPath %>/roomdetail.rsv?roomNo=1">room1</a></li>
					<li><a href="<%=contextPath %>/roomdetail.rsv?roomNo=2">room2</a></li>
					<li><a href="<%=contextPath %>/roomdetail.rsv?roomNo=3">room3</a></li>
				</ul>
			</div>
			<div class="outer right">
				<div id="room-pictures">
					<img src="<%=contextPath %>/resources/image/reservation/${imgName}" alt="room${room.roomNo }">
				</div>
				<hr>
				<div id="room-detail">
					<h4>${room.roomType }</h4>
					<p>${room.roomIntro }</p>
					<table>
						<tr>
							<th colspan="2">객실 정보</th>
							<th width="70%">각 공간 설명</th>
						</tr>
						<tr>
							<th>인원</th>
							<td>${room.baseNum }/${room.maxNum }</td>
							<td rowspan="3">${room.roomDetail }</td>
						</tr>
						<tr>
							<th>규모</th>
							<td>${room.size }</td>
						</tr>
						<tr>
							<th>어메니티</th>
							<td>${room.amenity }</td>
						</tr>

					</table>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>