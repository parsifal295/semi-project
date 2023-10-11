<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
						<th>basenum/maxnum</th>
						<th>price</th>
					</tr>
					<tr>
				</thead>
				<tbody>
					<tr>
						<td>사진..?</td>
						<td>FROM DATE ~ TO DATE</td>
						<td>실제 숙박 명수/maxnum</td>
						<td>가격</td>
					</tr>
				</tbody>	
			</table>
		</div>
	</div>
	<%@include file = "../common/footer.jsp" %>
		
</body>
</html>