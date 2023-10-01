<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int roomNo = (int)request.getAttribute("roomNo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Room<%=roomNo %> 상세정보 </title>
<style>
#box {
	height: 200px
}

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
				<h3 align="center">방 세부 정보</h3>
				<ul>
					<li>room1</li>
					<li>room2</li>
					<li>room3</li>
				</ul>
			</div>
			<div class="outer right">
				<div id="room-pictures">
					<img src="<%=contextPath %>/resources/image/reservation/room3.bmp" alt="room1">
				</div>
				<hr>
				<div id="room-detail">
					<h4>객실 특징</h4>
					<p>동양과 서양의 조화가 어쩌고 저쩌고 고급스럽게 하려고 노력하였으며 공간이 어쩌고 저쩌고 룰루랄라.</p>
					<table>
						<tr>
							<th colspan="2">객실 정보</th>
							<th>각 공간 설명</th>
						</tr>
						<tr>
							<th>인원</th>
							<td>2/4</td>
							<td rowspan="3">어쩌고저쩌고 저쩌고 공간이 어쩌고 생일축하합니다 해피벌쓰데이 투유
								루릴루러ㅏㅇ로어ㅏㄴ</td>
						</tr>
						<tr>
							<th>규모</th>
							<td>10평</td>
						</tr>
						<tr>
							<th>어메니티</th>
							<td>샴푸, 헤어드라이기, 칫솔, 슬리퍼, 가운, ....</td>
						</tr>

					</table>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>