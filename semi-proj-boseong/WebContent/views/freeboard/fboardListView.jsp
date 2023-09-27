<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<style></style>
		<title>자유게시판</title>
	</head>
	<body>
		<%@ include file = "../common/menubar.jsp" %>
		<div class="page" id="content">
			<div style="height: 250px"></div>
			<div class="page">
				<table class="" align="center">
					<thead>
						<tr>
							<th width="100">번호</th>
							<th width="500">제목</th>
							<th width="120">작성자</th>
							<th width="60">조회수</th>
							<th width="100">작성일</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>자유게시판 서비스 개시</td>
							<td>admin(110.22.234.121)</td>
							<td>2</td>
							<td>2023. 11. 22</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<%@ include file = "../common/footer.jsp" %>
	</body>
</html>
