<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.util.ArrayList, com.boseong.jsp.reservation.model.vo.HanokReservation, 
    com.boseong.jsp.freeboard.model.vo.PageInfo"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	ArrayList<HanokReservation> list = (ArrayList<HanokReservation>)request.getAttribute("rsvList");
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
<title>한옥 예약조회</title>
<style>
@font-face {
    font-family: 'GangwonEduHyeonokT_OTFMediumA';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEduHyeonokT_OTFMediumA.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
#content *{
font-family: 'GangwonEduHyeonokT_OTFMediumA';
color:black;
}

.reservation-list{
text-align:center;
}
#reserv-edit-area{
text-align:right;}
.reserv-paging-area{
text-align:center;}
td{
font-size:22px;}
th{
font-size:24px;}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.js"></script>
<script type="text/javascript" src="resources/scripts/reservation/hanokScript.js"></script>

</head>
<body>
		
	<%@include file = "../common/menubar.jsp" %>
	<div id="box"></div>
	<div class="reserv-page">
	<div id="content" class="page">
		<div class="page">
			<table class="table table-borderless reservation-list">
				<br>
				<h1>한옥예약 조회</h1>
				<thead>
					<tr>
						<th>예약번호</th>
						<th>룸 타입</th>
						<th>예약 날짜</th>
						<th>예약 인원</th>
						<th>요청사항</th>
						<th>가격</th>
					</tr>
					<tr>
				</thead>
				<tbody>
					<tr>
					<td>
			<div class="reserv-paging-area btn-group">
				<c:if test="${pi.currentPage eq 1 }">
					<button class="btn btn-lg" onclick="reservPageShift('${pi.currentPage }','${loginUser.memNo }');">&lt;</button>
				</c:if>
				<c:forEach var="i" begin ="${pi.startPage }" end="${pi.endPage }">
				<%for(int i=startPage;i<endPage+1;i++){ %>
					<%if(currentPage != i){ %>
					<button class="btn btn-lg" onclick="reservPageShift('<%=i%>','<%=memNo%>');"><%=i %></button>
					<%}else{ %>
					<button class="btn btn-lg" disabled><%=i%></button>
					<%} %>
				<%} %>
				<%if(currentPage != maxPage){ %>
					<button class="btn btn-lg" onclick="reservPageShift('<%=currentPage+1%>','<%=memNo%>');">&gt;</button>
				<%} %>
			</div>
					</td>
					<td colspan="3"></td>
					<td colspan="2" id="reserv-edit-area">
					<div class="btn-group">
					<button class="btn btn-outline-warning btn-sm" data-toggle="modal" data-target="#hanok-update"><h4>예약 변경</h4></button>
					<button class="btn btn-outline-danger btn-sm" data-toggle="modal" data-target="#hanok-delete"><h4>예약 취소</h4></button></td>		
					</div>
					</tr>

					<%if(list.isEmpty()){ %>
					<tr>
						<td colspan="4">예약정보가 존재하지 않습니다.</td>
					</tr>
					<%}else{ %>
						<%for(HanokReservation h : list){ %>
						<tr class="hanok-rserv-info">
							<td><%=h.getReservNo() %></td>
							<td><%=h.getRoomNo() %></td>
							<td><%=h.getFromDate() %> ~ <%=h.getToDate() %></td>
							<td><%=h.getClientNum() %></td>
							<td><%=h.getMessage() %></td>
							<td></td>
						</tr>
						<%} %>
					<%} %>
				</tbody>	

			</table>
			
		</div>
	</div>
	</div>
	<%@include file = "../common/footer.jsp" %>
	<script>
	</script>
	
	<!-- 모달해보기 -->
	<div class = "modal" id="hanok-delete">
		<div class="modal-dialog">
			<div class = "modal-content">
			<!-- Modal Header -->
			<div class = "modal-header">
				<h4 class="modal-title">한옥예약 취소</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<!-- Modal body -->
			<div class= "modal-body">
				<form action="delete.hk">
					<label for = "reservNo">예약 번호 :</label>
					<input type = "text" name="reservNo" id="reservNo" required>
					<input type="hidden" name="memNo" value="<%=loginUser.getMemNo()%>">
					<input type="hidden" name="cpage" value="<%=currentPage%>">
					<button type="submit">취소</button>
				</form>
			</div>
			<!-- Modal Footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
			</div>
			</div>
		</div>
	</div>

		<div class = "modal" id="hanok-update">
		<div class="modal-dialog">
			<div class = "modal-content">
			<!-- Modal Header -->
			<div class = "modal-header">
				<h4 class="modal-title">한옥예약 수정</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<!-- Modal body -->
			<div class= "modal-body">
				<form action="updateForm.hk">
					<label for = "reservNum">예약 번호 :</label>
					<input type = "text" name="reservNo" id="reservNum" required>
					<input type="hidden" name="memNo" value="<%=loginUser.getMemNo()%>">
					<input type="hidden" name="cpage" value="<%=currentPage%>">
					<button type="submit">수정</button>
				</form>
			</div>
			<!-- Modal Footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
			</div>
			</div>
		</div>
	</div>
</body>
</html>