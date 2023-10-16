<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>
<%@ page import="com.boseong.jsp.regional.model.vo.ProductNotice" %>
<%
	ProductNotice p = (ProductNotice)request.getAttribute("p");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
<style>
#box{
	width: 200px;
}	

#update-form > table{
		border : 1px solid white;
}

	#update-form input, #update-form textarea{
		width : 100%
}

</style>
</head>
<body>
<div id=box></div>
	<%@ include file="../common/menubar.jsp" %>
	
	<div class="outer">
	<br>
	<h2 align="center">공지사항 작성하기</h2>
	<br><br>
	
	<form action="<%= contextPath %>/updateForm.pn" method="post" id="update-form">
		
		<input type="hidden" name="nno" value="<% p.getNoticeNo() %>">
		<%if(loginUser != null){ %>
		<table align="center">
		<tr>
			<th width="50">제목</th>
			<td width="700">
				<input type="text" name="title" required value="<%= p.getNoticeTitle() %>">
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td></td>
		</tr>
		<tr>
			<td colspan="2">
				<textarea name="content" rows="10" style="resize:none;" required><%= p.getNoticeContent() %></textarea>
		</table>
		<br><br>
		
		<div align="center">
			<button type="submit" class="btn btn-sm btn-primary">등록하기</button>
			<button type="button" class="btn btn-sm btn-secondary" onclick="history.back();" >뒤로가기</button>
			<!-- history.back() 이전페이지로 돌아감 -->
		</div>
		<%}else{ %>
		<%} %>
	
	
		<br><br>
	</div>

</body>
</html>