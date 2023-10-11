<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세페이지</title>
<style>
#detail-area{
		border : 1px solid white;
	}
#box{
	width: 200px;
}	
</style>
</head>
<body>
	<div id=box></div>
	<%@ include file="../common/menubar.jsp" %>
	<div class="outer">
		<table id="detail-area" align="center" border="1">
			<h2 align="center">공지사항 상세보기</h2>	
			<br><br><br>
			<tr>
				<th width="100">제목</th>
				<td width="500" colspan="3">공지사항</td>
			</tr>
			<tr>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>2023-10-11</th>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3">
				<br><br><br><br>
					<p style="height: 100px;">공지사항입니다.</p>
				</td>
			</tr>
		
		</table>
		<br>
		<div align="center">
			<a href="<%= contextPath %>/list.pn" class="btn btn-sm btn-info">목록으로</a>
			<a href="#" class="btn btn-sm btn-warning">수정하기</a>
			<a href="#" class="btn btn-sm btn-danger">삭제하기</a>
			
		</div>
	</div>               

</body>
</html>