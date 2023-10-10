<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="../common/menubar.jsp"%>
	<div id="box"></div>
	<div id="content" class="page">
		<div class="page">
			<h3>택시업체 현황</h3>
			<table class="table">
				<thead>
					<tr>
						<th>구분</th>
						<th>사무소 주소</th>
						<th>연락처</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>보성택시</td>
						<td>보성읍 현충로 102-1</td>
						<td>852-2525</td>
					</tr>
					<tr>
						<td>부용택시</td>
						<td>벌교읍 하고길 26-8</td>
						<td>857-6400</td>
					</tr>
					<tr>
						<td>율어택시</td>
						<td>율어면 율어로 558</td>
						<td>852-7040</td>
					</tr>
					<tr>
						<td>오봉택시</td>
						<td>회천면 남부관광로 2328</td>
						<td>852-7700</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="3">
 보성 택시요금은 중형택시 기준으로 기본요금 2km까지 3,300원입니다. 주행요금 134m당 100원씩 올라가며 32초당 100원씩 올라갑니다.<br>
 밤 12시부터 새벽 4시까지 추가로 심야할증 요금으로 20%추가로 부과됩니다. 사업구역을 벗어나게 되면 사업구역 외 할증요금이 추가로 35% 부과됩니다.
						</td>
					</tr>
				</tfoot>
			</table>

		</div>
	</div>
	<%@include file = "../common/footer.jsp" %>

</body>
</html>