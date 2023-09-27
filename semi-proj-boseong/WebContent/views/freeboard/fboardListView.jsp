<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ page
import="java.util.ArrayList, com.boseong.jsp.freeboard.model.vo.*" %> 
<% ArrayList<Freeboard>
	list = (ArrayList<Freeboard>)request.getAttribute("list"); 
    PageInfo pi = (PageInfo)request.getAttribute("pi"); 
    int currentPage = pi.getCurrentPage(); 
    int startPage = pi.getStartPage(); 
    int endPage = pi.getEndPage(); 
    int maxPage = pi.getMaxPage(); 
%>
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
						<table class="table table-sm table-hover" align="center" style="width: 78%">
							<thead class="thead-light">
								<tr>
									<th width="100">번호</th>
									<th width="350">제목</th>
									<th width="170">작성자</th>
									<th width="60">조회수</th>
									<th width="100">작성일</th>
								</tr>
							</thead>
							<tbody>
								<% if (list.isEmpty()) { %>
								<tr>
									<td colspan="5">조회된 게시글이 없습니다..</td>
								</tr>
								<% } else { %> <% for (Freeboard b : list) { %>
								<tr>
									<td><%=b.getBoardNo()%></td>
									<td><%=b.getTitle() %></td>
									<td><%=b.getWriter() %></td>
									<td><%=b.getCount() %></td>
									<td><%=b.getCreateDate() %></td>
								</tr>
								<% } %> <% } %>
							</tbody>
						</table>
						<div class="paging-area" align="center">
						<ul class="pagination justify-content-center" style="margin: 20px 0">
							<% if(currentPage != 1) { %>
							<li class="page-item">
								<a class="page-link" href="<%=contextPath%>/fboard.fb?cpage=<%= currentPage - 1 %>"
									>Previous</a
								>
							</li>
							<% } %> 
							<% for(int i = startPage; i <= endPage; i++) { %>
							 <% if(currentPage != i) { %>
							 <li class="page-item">
                                <a class="page-link" href="<%=contextPath%>/fboard.fb?cpage=<%=i%>"><%=i%></a>
                             </li>
							 <% } else { %>
						     <li class="page-item active">
                                <a class="page-link" href=""><%=i%></a>
                             </li>
							 <% } %>
							<% } %> 
							<% if (currentPage!= maxPage) { %>
							<li class="page-item"><a class="page-link" href="<%=contextPath%>/fboard.fb?cpage=<%= currentPage + 1 %>">Next</a></li>
							<% } %>
						</ul>
						</div>
					
					</div>
				</div>
				<%@ include file = "../common/footer.jsp" %>
			</body>
		</html>
