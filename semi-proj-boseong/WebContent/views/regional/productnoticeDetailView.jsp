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
			<%if(loginUser != null){ %>
			<tr>
				<th width="100">제목</th>
				<td width="500" colspan="3"><%= p.getNoticeTitle() %></td>
			</tr>
			
			<tr>
				<th>관리자</th>
				<th><%= p.getCreateDate() %></th>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3">
				<br><br><br><br>
					<p style="height: 100px;"><%= p.getNoticeContent() %></p>
				</td>
			</tr>
			<%}else{ %>
			<%} %>
						
		</table>
		<br>
		<div align="center">
			<a href="<%= contextPath %>/list.pn" class="btn btn-sm btn-info">목록으로</a>
			<a href="<%= contextPath %>/updateForm.pn?nno=<%= p.getNoticeNo() %>" class="btn btn-sm btn-warning">수정하기</a>
			<a href="<%= contextPath %>/delete.pn?nno=<%= p.getNoticeNo() %>" class="btn btn-sm btn-danger">삭제하기</a>
			
		</div>
	</div>               

</body>
</html>