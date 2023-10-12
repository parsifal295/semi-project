<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.boseong.jsp.itemboard.model.vo.ItemBoard,
			     com.boseong.jsp.freeboard.model.vo.PageInfo"%>
<%
	ArrayList<ItemBoard> list = (ArrayList<ItemBoard>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보성마켓</title>
<style>
	/* #iboard-area{
		width : 78%;
		text-align : center;
		margin : auto;
		margin-bottom : 0;	
		padding : 0;
	}
	.notice-table{
		background-color : rgb(207, 207, 207);
	} */
	#btn{
		margin-left: 84.5%;
		margin-bottom: 10px;
	}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>

	<div class="page" id="content">
	<div style="height : 300px; text-align: center;"></div>
		<div class="page">
		<a type="submit" href="<%= contextPath %>/enrollform.ib" class="btn btn-primary btn-sm" id="btn">글작성</a>
		<table id="tb" class="table table-sm table-hover" align="center" style="width: 78%" style="cursor:default;">
		<thead class="thead-light">
	      <tr>
	        <th width="10%">No.</th>
	        <th width="40%">제목</th>
	        <th width="17.5%">작성자</th>
	        <th width="10%">조회수</th>
	        <th width="17.5%">작성일시</th>
	        <th width="15%"> - </th>
	      </tr>
	    </thead>
	      <tr>
	        <td>공지</td>
	        <td>욕설,폭언 등..은 안됩니다...</td>
	        <td>관리자</td>
	        <td>2023-05-12</td>
	        <td> - </td>
	      </tr>
		</table>
		<table id="tb" class="table table-sm table-hover" align="center" style="width: 78%" style="cursor:default">
	    <thead class="thead-light">
	      <tr>
	        <th width="10%">No.</th>
	        <th width="40%">제목</th>
	        <th width="17.5%">작성자</th>
	        <th width="10%">조회수</th>
	        <th width="17.5%">작성일시</th>
	        <th width="15%">가격</th>
	      </tr>
	    </thead>
	    <tbody style="cursor:default">
	    <% if(list.isEmpty()){ %>
	    <tr>
	    	<td colspan="5">조회된 게시글이 없습니다</td>
	    </tr>
	    <% }else{ %>
	    <% for(ItemBoard ib : list){ %>
	    <tr>
	      <td><%= ib.getBoardNo()  %></td>
	      <td><%= ib.getTitle() %></td>
	      <td><%= ib.getMemberName() %></td>
	      <td><%= ib.getCount() %></td>
	      <td><%= ib.getPostDate() %></td>
	      <td><%= ib.getPrice() %></td>
	    </tr>
	    <%} %>
	    <%} %>
	</tbody>
	</table>
 		<div class="paging-area" align="center">
			<ul class="pagination justify-content-center" style="margin: 20px 0">
				<% if(currentPage != 1) { %>
				<li class="page-item">
					<a class="page-link" href="<%=contextPath%>/iboard.ib?cpage=<%= currentPage - 1 %>">Previous</a>
				</li>
				<% } %> 
				<% for(int i = startPage; i <= endPage; i++) { %>
				 <% if(currentPage != i) { %>
				 <li class="page-item">
                             <a class="page-link" href="<%=contextPath%>/iboard.ib?cpage=<%=i%>"><%=i%></a>
                          </li>
				 <% } else { %>
			     <li class="page-item active">
                             <a class="page-link" href=""><%=i%></a>
                          </li>
				 <% } %>
				<% } %> 
				<% if (currentPage!= maxPage) { %>
				<li class="page-item"><a class="page-link" href="<%=contextPath%>/iboard.ib?cpage=<%= currentPage + 1 %>">Next</a></li>
				<% } %>
			</ul>
			</div>  
		</div> 
	</div>
	<script>
	$(function(){
		$('#tb > tbody > tr').click(function(){
			location.href = '<%= contextPath %>/detail.ib?bno=' + $(this).children().eq(0).text();
		});
	});
	</script>
	
	<%@ include file="../common/footer.jsp" %>
</body>
</html>