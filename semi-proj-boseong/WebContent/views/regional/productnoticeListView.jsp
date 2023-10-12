<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.boseong.jsp.regional.model.vo.ProductNotice" %>    
<%
	ArrayList<ProductNotice> list = (ArrayList<ProductNotice>)request.getAttribute("list");
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<style>
 .outer {
      width : 1000px;
      margin: auto;
      margin-top : 5px
    }
    #btn {
      margin-right: 145px;
      margin-bottom: 5px
    }

</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	<div class="outer" id="content">
			
			<div style="height:200px"></div>
			<div id="btn" align="right">
            </div>
			<table id="tb" class="table table-sm table-hover" align="center" style="width: 78%" style="cursor:default">
				<thead class="thead-light">
					<tr>
						<h2 align="center">공지사항</h2>
						<th width="100">번호</th>
						<th width="350">제목</th>
						<th width="170">작성자</th>
						<th width="60">조회수</th>
						<th width="100">작성일</th>
					</tr>
				</thead>
				<tbody>
					<% if(list.isEmpty()) { %>
					<tr>
						<td colspan="5">공지사항이 존재하지 않습니다.</td>
					</tr>
					<%} else { %>
					<!-- 
					<tr>
						<td>1</td>
						<td>공지사항입니다.</td>
						<td>관리자</td>
						<td>10</td>
						<td>2023-10-10</td>
					</tr>
					 -->
					 <% for(ProductNotice p : list) { %>  
					 
					 	<tr>
					 		<td><%= p.getNoticeNo() %></td>
					 		<td><%= p.getNoticeTitle() %></td>
					 		<td>관리자</td>
					 		<td><%= p.getCount() %></td>
					 		<td><%= p.getCreateDate() %></td>
						</tr>
					  <% } %>
					 <% } %>
					 <div align="right">	 					
					<a href="<%= contextPath %>/enroll.pn" class="btn btn-sm btn-info">글작성</a>
					</div>
				</tbody>
			</table>	
		</div>
	
		<script>
			$(function(){
			
				$('.table>tbody>tr').click(function(){
				
					const nno = $(this).children().eq(0).text();
					
					location.href="<%=contextPath%>/detail.pn?nno=" + nno;
					
				})
			
			});
			
			
		
		</script>


</body>
</html>