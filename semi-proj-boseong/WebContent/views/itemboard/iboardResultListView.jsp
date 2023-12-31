<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.boseong.jsp.itemboard.model.vo.ItemBoard,
			     com.boseong.jsp.freeboard.model.vo.PageInfo"%>
<%
	ArrayList<ItemBoard> list = (ArrayList<ItemBoard>)request.getAttribute("searched");
	String keyword = (String)request.getAttribute("keyword");
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
	#btn{
		float : left;
		margin-left : 144px;
		margin-bottom : 20px;
	}
	#searchbar{
		width : 200px; 
		float : right;
		margin-right : 20px;
	}
	#searchBtn{
		float : right;
	}
	#search-area{
		width : 350px;
		margin-right : 144px;
		margin-bottom : 20px;
		float : right;
	}
	#select{
		float : left;
		margin-right : 10px; 
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.js"></script>
<script type="text/javascript" src="resources/scripts/iboard/iboardResultListView.js"></script>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>

	<div class="page" id="content">
	<div style="height : 300px; text-align: center;"></div>
		<div class="page">
		<%if(loginUser != null){ %>
		<a type="submit" href="<%= contextPath %>/enrollform.ib" class="btn btn-primary btn-sm" id="btn">글작성</a>
		<%} %>
		<div id="search-area">
			<!-- <select name="select" class="custom-select-sm" id="select">
				<option name=value="item">제품</option>
				<option value="price">가격</option>
			</select> -->
			<form  action="<%= contextPath %>/search.ib?cpage=1" method="post">
				<button type="submit" class="btn btn-primary btn-sm" id="searchBtn">검색</button>
				<input type="text" name="keyword" class="form-control form-control-sm" id="searchbar" placeholder="제품입력">
			</form>
		</div>
		<table id="tbRs" class="table table-sm table-hover" align="center" style="width: 78%" style="cursor:default">
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
					<a class="page-link" href="<%=contextPath%>/search.ib?cpage=<%= currentPage - 1 %>&keyword=<%= keyword %>">Previous</a>
				</li>
				<% } %> 
				<% for(int i = startPage; i <= endPage; i++) { %>
				 <% if(currentPage != i) { %>
				 <li class="page-item">
                             <a class="page-link" href="<%=contextPath%>/search.ib?cpage=<%=i%>&keyword=<%= keyword %>"><%=i%></a>
                          </li>
				 <% } else { %>
			     <li class="page-item active">
                             <a class="page-link" href=""><%=i%></a>
                          </li>
				 <% } %>
				<% } %> 
				<% if (currentPage!= maxPage) { %>
				<li class="page-item"><a class="page-link" href="<%=contextPath%>/search.ib?cpage=<%= currentPage + 1 %>&keyword=<%= keyword %>">Next</a></li>
				<li class="page-item"><a class="page-link" type="submit" href="<%= contextPath %>/iboard.ib?cpage=1">목록으로</a></li>
				<% } %>
			</ul>
			</div>  
		</div> 
	</div>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>