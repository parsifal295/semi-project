<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ page
import="java.util.ArrayList, com.boseong.jsp.freeboard.model.vo.*, com.boseong.jsp.notice.model.vo.*" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%  ArrayList<Freeboard> list = (ArrayList<Freeboard>)request.getAttribute("list"); 
    ArrayList<Notice> noticeList = (ArrayList<Notice>)request.getAttribute("noticeList");
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
		<title>자유게시판</title>
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
		<%@ include file = "../common/menubar.jsp" %>
		<div class="outer" id="content">
			<div style="height:200px"></div>
			<% if ((loginUser != null) && (loginUser.getStatus().equals("A"))) { %>
			<a class="btn btn-primary btn-warning" href="views/notice/noticeInsertView.jsp">공지작성</a>
			<% } %>
			<a class="btn btn-primary" href="<%= contextPath %>/enrollForm.fb">글쓰기</a>
	
			<table id="tb" class="table table-sm table-hover" align="center" style="width: 78%" style="cursor:default">
				<thead class="thead-light">
					<tr>
						<th width="100">번호</th>
						<th width="300">제목</th>
						<th width="170">작성자</th>
						<th width="60">조회수</th>
						<th width="170">작성일</th>
					</tr>
				</thead>
				<tbody style="cursor:default">
					<c:choose>
						<c:when test="${empty requestScope.list}">
							<tr>
								<td colspan="5">조회된 게시글이 없습니다..</td>
							</tr>
						</c:when>
						<c:when test="${not empty requestScope.noticeList}">
							<c:forEach items="${requestScope.noticeList}" var="n">	
								<tr value="${n.noticeNo}">
									<td>공지</td>
									<td>${n.noticeTitle}</td>
									<td>관리자</td>
									<td>${n.count}</td>
									<td>${n.modifyDate}</td>
								</tr>
							</c:forEach>
							<c:forEach items={requestScope.list} var="b">
								<tr>
									<td>${b.boardNo}</td>
									<td>${b.title}</td>
									<td>${b.writer}</td>
									<td>${b.count}</td>
									<td>${b.createDate}</td>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>
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
				<div class="search-area">
					<form action="<%=contextPath%>/search.fb" method="post">
						<table class="table table-sm" align="center" style="width: 32%" style="cursor:default">
						<tr>
							<th width="100">
								<!--검색 조건 설정 (form 태그로 넘어가는)-->
									<select name="condition" class="custom-select-sm">
										<option value="titleContent">제목+내용</option>
										<option value="writer">작성자</option>
										<option value="ip">IP주소</option>
									</select>
							</th>
							<th width="250">
								<!--검색어 (form태그로 넘어가는)-->
								<input type="text" name="conditionText" class="form-control form-control-sm">
							</th>
							<th>
								<input type="hidden" name="cpage" value="1">
								<button type="submit" class="btn btn-primary btn-sm">검색</button>
							</th>
						</tr>
						</table>
					</form>		
				</div>
		</div>
		<%@ include file = "../common/footer.jsp" %>
		<script type="text/javascript" src="resources/scripts/freeboard/fboardListViewScript.js"></script>
	</body>
</html>
