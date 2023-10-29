<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ page
import="java.util.ArrayList, com.boseong.jsp.freeboard.model.vo.*, com.boseong.jsp.notice.model.vo.*" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    .paging-area {
      position: absolute;
      margin-left : 440px;
    }
    .button-area {
      position: relative;
      margin-left: 1000px;
      margin-top: 0px;
    } 
    .search-area {
      position: relative;
      margin-top : 22px;
    }
		</style>

	</head>
	<body>
		<%@ include file = "../common/menubar.jsp"%>
		<div class="outer" id="content">
			<div style="height:200px"></div>

	
			<table id="tb" class="table table-sm table-hover" align="center" style="width: 78%" style="cursor:default">
				<thead class="thead-light">
					<tr>
						<th width="100">번호</th>
						<th width="300">제목</th>
						<th width="50">작성자</th>
						<th width="140">IP주소</th>
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
									<td>N/A</td>
									<td>${n.count}</td>
									<td>${n.modifyDate}</td>
								</tr>
							</c:forEach>
							<c:forEach items="${requestScope.list}" var="b">
								<tr>
									<td>${b.boardNo}</td>
									<td>${b.title}</td>
									<td>${b.writer}</td>
									<td>${b.ipAddress}</td>
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
			    <c:if test="${requestScope.pi.currentPage != 1}">
			     <li class="page-item">
                    <a class="page-link" href="fboard.fb?cpage=${requestScope.pi.currentPage - 1}">Previous</a>
                 </li>
			    </c:if>
			    <c:forEach var="i" begin="${requestScope.pi.startPage}" end="${requestScope.pi.endPage}">
			      <c:if test="${empty condition}">
				     <c:choose>
				         <c:when test="${requestScope.pi.currentPage ne i}">
				             <li class="page-item">
	                             <a class="page-link" href="fboard.fb?cpage=${i}">${i}</a>
	                         </li>
				         </c:when>
				         <c:otherwise>
				             <li class="page-item active">
	                            <a class="page-link" href="">${i}</a>
	                         </li>
				         </c:otherwise>
				     </c:choose>				    
				   </c:if>
				   <c:if test="${condition ne null}">
				     <c:choose>
                         <c:when test="${requestScope.pi.currentPage ne i}">
                             <li class="page-item">
                                 <a class="page-link" href="search.fb?cpage=${i}&condition=${condition}&keyword=${keyword}">${i}</a>
                             </li>
                         </c:when>
                         <c:otherwise>
                             <li class="page-item active">
                                <a class="page-link" href="">${i}</a>
                             </li>
                         </c:otherwise>
                     </c:choose>        
				   </c:if>
			    </c:forEach>
		        <c:if test="${requestScope.pi.currentPage ne requestScope.pi.maxPage}">
		        <li class="page-item">
		          <a class="page-link" href="fboard.fb?cpage=${requestScope.pi.currentPage}">Next</a>
		        </li>
		        </c:if>
			</ul>
			</div>    
			<div class="button-area">
			<c:if test="${(empty sessionScope.loginUser) and (sessionScope.loginUser.status eq 'A')}">
             <a class="btn btn-primary btn-warning" href="views/notice/noticeInsertView.jsp">공지작성</a>
            </c:if>
            <a class="btn btn-primary" href="enrollForm.fb">글쓰기</a>
            </div>
				<div class="search-area">
					<form action="search.fb" method="get">
						<table class="table table-sm" align="center" style="width: 32%" style="cursor:default">
						<tr>
							<th width="100">
								<!--검색 조건 설정 (form 태그로 넘어가는)-->
									<select name="condition" class="custom-select-sm" id="search-area">
										<option value="titleContent">제목+내용</option>
										<option value="writer">작성자</option>
										<option value="ip">IP주소</option>
									</select>
							</th>
							<th width="250">
								<!--검색어 (form태그로 넘어가는)-->
								<input type="text" name="keyword" class="form-control form-control-sm" value="${requestScope.keyword}">
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
		  <c:if test="${not empty condition}">
        <script>
            $(() => {   
                $('#search-area option[value=${condition}]').attr('selected', true);
            });
        </script>
    </c:if>
	</body>
</html>
