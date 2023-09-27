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
				<table class="table table-hover" align="center" style="width: 78%">
					<thead class="thead-light">
						<tr>
							<th width="100">번호</th>
							<th width="400">제목</th>
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
				<ul class="pagination justify-content-center" style="margin: 20px 0">
					<li class="page-item"><a class="page-link" href="#">Previous</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item active"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">Next</a></li>
				</ul>
			</div>
		</div>
		<%@ include file = "../common/footer.jsp" %>
	</body>
</html>
